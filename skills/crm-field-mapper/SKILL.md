---
name: crm-field-mapper
description: Design CRM field structure with custom fields, picklists, and automation triggers. Use when someone asks "set up CRM fields", "CRM structure", "HubSpot field mapping", "Salesforce custom fields", "CRM properties", or "design CRM schema"
allowed-tools: Read, Write
metadata:
  author: Achille Morin-Lemoine
  version: "1.0.0"
---

# CRM Field Mapper

Design a complete CRM field structure tailored to the company's ICP, sales process, and reporting needs. This skill produces a field specification document that maps standard and custom fields, defines picklist values, and specifies automation triggers.

The output is a blueprint. It does not configure the CRM directly.

## Inputs

- **CRM platform** (required) — HubSpot, Pipedrive, or Salesforce
- **ICP document or criteria** (required) — to derive custom fields from ICP dimensions
- **Sales process stages** (required) — the pipeline stages from first touch to closed-won
- **Reporting needs** (optional) — what metrics the team wants to track
- **Existing field list** (optional) — to avoid duplicating fields that already exist

If CRM platform or ICP is missing, ask before proceeding.

## Steps

### Step 0 — Idempotency Check

Check if operations documents exists. If it does, ask: "A CRM field mapping already exists. Do you want to refine the existing spec or overwrite it?"

### Step 1 — Load Context

Read these files if they exist:
- ICP document — ICP criteria to derive custom fields
- gtm triangle.md documents — positioning and persona context
- operations documents — scoring dimensions to support
- `CLAUDE.md` — project context

### Step 2 — Define Standard Company Fields

Map the core company-level fields. These are common across all CRMs:

| Field Name | Type | Required | Purpose |
|-----------|------|----------|---------|
| Company Name | Text | Yes | Primary identifier |
| Domain | Text | Yes | Deduplication key |
| Industry | Dropdown | Yes | ICP segmentation |
| Sub-Industry | Dropdown | No | Granular segmentation |
| Employee Count | Number | Yes | Size qualification |
| Revenue Range | Dropdown | No | Size qualification |
| Country | Dropdown | Yes | Geography filter |
| City | Text | No | Local targeting |
| ICP Tier | Dropdown | Yes | A / B / C classification |
| ICP Score | Number | Yes | Numeric fit score |
| Company Status | Dropdown | Yes | Prospect / Active / Customer / Churned / Disqualified |
| Source | Dropdown | Yes | How the company entered the CRM |
| Owner | User | Yes | Assigned rep |

### Step 3 — Define Standard Contact Fields

| Field Name | Type | Required | Purpose |
|-----------|------|----------|---------|
| First Name | Text | Yes | Personalization |
| Last Name | Text | Yes | Identification |
| Email | Email | Yes | Primary communication |
| Phone | Phone | No | Call outreach |
| Job Title | Text | Yes | Persona matching |
| Persona | Dropdown | Yes | Maps to defined buyer personas |
| Seniority | Dropdown | Yes | C-level / VP / Director / Manager / IC |
| Department | Dropdown | Yes | Sales / Marketing / Ops / Engineering / Other |
| Contact Status | Dropdown | Yes | New / Contacted / Engaged / Qualified / Disqualified |
| Source | Dropdown | Yes | How the contact entered the CRM |
| LinkedIn URL | URL | No | Profile reference |
| Last Contacted | Date | No | Auto-populated |
| Owner | User | Yes | Assigned rep |

### Step 4 — Define Custom Fields from ICP

Analyze the ICP document and create custom fields for each qualifying dimension:

For each ICP criterion, create a corresponding field:
- **Firmographic criteria** become company-level dropdown or number fields
- **Technographic criteria** become company-level multi-select fields (tech stack)
- **Behavioral signals** become company-level date or checkbox fields (e.g., "Recently Funded," "Hiring Signal Date")
- **Persona-specific criteria** become contact-level fields

For each custom field, specify:
- Field name (use the CRM's naming convention: snake_case for Salesforce API names, Title Case for display)
- Field type (Text, Number, Dropdown, Multi-select, Date, Checkbox, Formula)
- Picklist values (if dropdown or multi-select)
- Default value (if applicable)
- Help text (one-line description of what the field captures)

### Step 5 — Design Picklist Values

For every dropdown and multi-select field, define the exact values. Rules:
- Keep picklist values to 5-8 options maximum per field
- Include an "Other" option only if truly needed (prefer exhaustive lists)
- Use consistent naming conventions (Title Case, no abbreviations)
- Order values logically (by pipeline progression, alphabetically, or by priority)

Pay special attention to these picklists:
- **ICP Tier**: define what qualifies for A, B, C
- **Company Status**: define the lifecycle stages and allowed transitions
- **Contact Status**: define each status with a clear entry/exit criteria
- **Source**: define all acquisition channels (Outbound, Inbound, Referral, Event, Partner, etc.)
- **Persona**: map directly to the personas defined in the ICP/GTM Triangle

### Step 6 — Define Automation Triggers

For each status change or threshold, define what should happen:

| Trigger | Condition | Action |
|---------|-----------|--------|
| New lead created | Contact status = New | Assign owner based on territory/round-robin |
| Lead qualified | ICP Score >= [threshold] | Move to "Qualified" status, notify owner |
| Lead engaged | Email replied or meeting booked | Update contact status to "Engaged" |
| Deal created | Contact status = "Qualified" + meeting held | Create deal record in pipeline |
| Lead stale | No activity for 30 days | Flag for re-engagement or archival |
| ICP score change | Score drops below threshold | Notify owner, flag for review |

### Step 7 — Define Reporting Views

Spec 3-5 key reporting views:

1. **Pipeline by ICP Tier** — filter deals by company ICP tier, show conversion rates per tier
2. **Source Attribution** — group contacts and deals by source, show volume and conversion
3. **Activity Dashboard** — emails sent, replies received, meetings booked per rep per week
4. **Lead Scoring Distribution** — histogram of ICP scores, identify scoring model effectiveness
5. **Stale Leads** — contacts with no activity in 30+ days, sorted by ICP score (rescue high-value leads first)

### Step 8 — Quality Gate

Before saving, verify:
- [ ] Every field has a defined type, and dropdowns have enumerated values
- [ ] Custom fields map directly to ICP criteria (no fields without a purpose)
- [ ] No duplicate fields (check against existing fields if provided)
- [ ] Automation triggers reference specific field values, not vague conditions
- [ ] Picklist values are exhaustive for the use case (no "TBD" values)
- [ ] CRM-specific naming conventions are followed
- [ ] Required vs. optional fields are clearly marked

## Output Format

Save the output to your project. Suggested filename: `crm-fields.md`

```markdown
# CRM Field Structure: [Company Name]
Date: [Date]
Platform: [HubSpot / Pipedrive / Salesforce]

## Company Fields
| Field Name | API Name | Type | Required | Values / Format | Purpose |
|-----------|----------|------|----------|----------------|---------|
| ... | ... | ... | ... | ... | ... |

## Contact Fields
| Field Name | API Name | Type | Required | Values / Format | Purpose |
|-----------|----------|------|----------|----------------|---------|
| ... | ... | ... | ... | ... | ... |

## Custom Fields (ICP-Derived)
| Field Name | API Name | Type | Object | Values | Derived From |
|-----------|----------|------|--------|--------|-------------|
| ... | ... | ... | Company/Contact | ... | [ICP criterion] |

## Picklist Definitions
### [Field Name]
| Value | Definition | Entry Criteria |
|-------|-----------|---------------|
| ... | ... | ... |

## Automation Triggers
| Trigger Name | Condition | Action | Owner |
|-------------|-----------|--------|-------|
| ... | ... | ... | ... |

## Reporting Views
### [View Name]
- **Purpose:** [What question it answers]
- **Filters:** [Field = Value]
- **Group by:** [Field]
- **Metrics:** [Count, conversion rate, etc.]

## Implementation Notes
- [CRM-specific considerations]
- [Migration notes if replacing existing fields]
- [Dependencies between fields]
```

## Key Principles

1. **Every field must earn its place.** If no one will filter, sort, report, or automate on a field, it should not exist. Empty fields are worse than no fields.
2. **Picklist values are contracts.** Once defined, changing them breaks reports and automations. Get them right upfront.
3. **Custom fields derive from ICP criteria.** The ICP defines what matters. The CRM captures it. If a field does not map to an ICP dimension, a sales process stage, or a reporting need, delete it.
4. **Status fields need transition rules.** A contact should not jump from "New" to "Customer." Define the allowed path.

## Anti-Patterns

- **"Add a field for everything just in case."** Field bloat kills CRM adoption. Reps stop filling in fields when there are too many, and your data quality collapses.
- **"Use free-text fields for things that should be dropdowns."** Free text cannot be reported on. If you need to segment by it, make it a dropdown.
- **"Skip automation triggers and do it manually."** Manual status updates get forgotten. Automate every transition that can be detected from data.

## Chain Triggers

After completing, suggest:
- "Run **lead-scoring-model** to define the scoring rubric that populates the ICP Score field"
- "Run **enrichment-waterfall** to design the data pipeline that fills these fields"
- "Run **crm-hygiene-audit** to establish baseline data quality before going live"

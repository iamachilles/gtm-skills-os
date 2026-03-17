---
description: Design a multi-provider data enrichment waterfall with fallback logic. Use when someone asks "enrichment waterfall", "data enrichment strategy", "email finding setup", "enrichment providers", "data quality pipeline", or "which enrichment tools to use"
tools: Read, Write
---

# Enrichment Waterfall

Design a multi-provider enrichment waterfall that maximizes data coverage while controlling costs. The waterfall defines which providers to query, in what order, with pass/fail logic between steps. When Provider A misses, Provider B catches it.

The output is a specification document. It does not execute API calls.

## Inputs

- **Data needs** (required) — which fields need enrichment (email, phone, firmographic, technographic, intent)
- **Budget** (required) — monthly enrichment budget or per-record budget cap
- **Known providers** (optional) — tools already in the stack (Apollo, Findymail, Clearbit, ZoomInfo, etc.)
- **Volume** (optional) — expected records per month to enrich
- **Current coverage gaps** (optional) — which fields have the worst fill rates

If data needs or budget are missing, ask before proceeding.

## Steps

### Step 0 — Idempotency Check

Check if `docs/ops/enrichment-waterfall.md` exists. If it does, ask: "An enrichment waterfall spec already exists. Do you want to refine the existing spec or overwrite it?"

### Step 1 — Load Context

Read these files if they exist:
- `docs/icp.md` — to understand what data matters most
- `docs/ops/crm-fields.md` — to know which fields need filling
- `docs/ops/lead-scoring-model.md` — to prioritize fields that affect scoring
- `CLAUDE.md` — project context

### Step 2 — Map Data Fields Needed

Categorize each field by type and priority:

| Field | Category | Priority | Current Coverage | Notes |
|-------|----------|----------|-----------------|-------|
| Work email | Contact | Critical | — | Must be verified, not catch-all |
| Phone (direct) | Contact | High | — | Mobile preferred |
| Company size | Firmographic | Critical | — | Employee count |
| Industry | Firmographic | Critical | — | Sub-industry level |
| Tech stack | Technographic | Medium | — | Specific tools used |
| Revenue | Firmographic | Medium | — | Range is acceptable |
| Funding status | Firmographic | Low | — | Last round + amount |

Priority levels:
- **Critical**: enrichment is worthless without this field (e.g., no email = no outreach)
- **High**: significantly improves targeting or personalization
- **Medium**: useful for scoring or segmentation
- **Low**: nice to have, skip if budget is tight

### Step 3 — Recommend Provider Sequence Per Field

For each critical and high-priority field, define a waterfall of providers in order of:
1. Data quality (accuracy and freshness)
2. Coverage (hit rate for your ICP segment)
3. Cost per record

**Email Waterfall Example:**
| Step | Provider | Est. Hit Rate | Cost/Record | Action on Miss |
|------|----------|--------------|-------------|---------------|
| 1 | Findymail | 60-70% | $0.03 | Pass to Step 2 |
| 2 | Icypeas | 50-60% | $0.02 | Pass to Step 3 |
| 3 | Apollo | 40-50% | $0.01 | Mark as "No Email Found" |
| — | Verification | — | $0.005 | Verify all found emails |

**Phone Waterfall Example:**
| Step | Provider | Est. Hit Rate | Cost/Record |
|------|----------|--------------|-------------|
| 1 | Apollo | 30-40% | Included |
| 2 | Lusha | 40-50% | $0.10 |
| 3 | RocketReach | 30-40% | $0.15 |

**Firmographic Waterfall Example:**
| Step | Provider | Fields Covered | Cost |
|------|----------|---------------|------|
| 1 | Apollo (free tier) | Size, industry, location | Free |
| 2 | Clearbit | Revenue, tech stack, funding | $0.05-0.15 |
| 3 | Crunchbase | Funding, investors | $0.02 |

### Step 4 — Define Pass/Fail Logic

For each step in the waterfall, define:
- **Pass condition**: what makes the data acceptable (e.g., email is verified and not catch-all)
- **Fail condition**: what triggers fallback to the next provider
- **Skip condition**: when to skip a provider entirely (e.g., if the record already has a verified email)

Quality checks at each step:
- **Email**: must pass verification (not bounced, not catch-all unless explicitly accepted)
- **Phone**: must be formatted correctly, must be direct line (not switchboard)
- **Firmographic**: must be recent (within 12 months)
- **Technographic**: must include confidence score from provider

### Step 5 — Estimate Cost Per Enriched Record

Calculate the blended cost per fully-enriched record:

| Field | Provider 1 Cost | P1 Hit Rate | Provider 2 Cost | P2 Hit Rate | Blended Cost |
|-------|----------------|-------------|----------------|-------------|-------------|
| Email | $0.03 | 65% | $0.02 | 55% | $0.03 |
| Phone | $0.10 | 40% | $0.15 | 35% | $0.13 |

Formula: `Blended cost = (P1 cost * volume) + (P2 cost * volume * P1 miss rate) + ...`

Then: `Total cost per record = sum of blended costs per field`
And: `Monthly cost = total cost per record * monthly volume`

Flag if monthly cost exceeds budget. Recommend dropping low-priority fields or switching to cheaper providers.

### Step 6 — Define Quality Checks

Post-enrichment quality gates:
- **Bounce rate threshold**: if email bounce rate exceeds 5% from a provider, deprioritize that provider
- **Catch-all handling**: flag catch-all emails, do not count as "found" unless no alternative exists
- **Data freshness**: reject firmographic data older than 18 months
- **Duplicate detection**: check for duplicate records created by different providers returning the same contact
- **Consistency check**: flag records where Provider A says "50 employees" and Provider B says "500 employees"

### Step 7 — Quality Gate

Before saving, verify:
- [ ] Every critical field has at least 2 providers in the waterfall
- [ ] Pass/fail conditions are defined for each step (not just "if no result")
- [ ] Cost estimate exists and fits within stated budget
- [ ] Email verification step is included (never send to unverified emails)
- [ ] Catch-all handling is defined
- [ ] Provider recommendations match the stated budget tier
- [ ] Quality checks include bounce rate thresholds

## Output Format

Save to `docs/ops/enrichment-waterfall.md`:

```markdown
# Enrichment Waterfall Specification
Date: [Date]
Monthly Volume: [X records]
Monthly Budget: [$X]
Estimated Cost Per Record: [$X.XX]

## Field Priority Matrix
| Field | Priority | Category | Target Coverage |
|-------|----------|----------|----------------|
| ... | Critical/High/Medium/Low | ... | [X%] |

## Waterfall: [Field Name]
| Step | Provider | Est. Hit Rate | Cost/Record | Pass Condition | On Fail |
|------|----------|--------------|-------------|---------------|---------|
| 1 | ... | ... | ... | ... | Next step |
| 2 | ... | ... | ... | ... | Mark unfound |

[Repeat for each field]

## Cost Estimate
| Field | Blended Cost/Record | Monthly Cost |
|-------|-------------------|-------------|
| ... | $X.XX | $X.XX |
| **Total** | **$X.XX** | **$X.XX** |

## Quality Gates
- Email bounce rate threshold: [X%]
- Catch-all policy: [Accept / Flag / Reject]
- Data freshness requirement: [X months]
- Duplicate detection: [Method]

## Provider Accounts Needed
| Provider | Plan | Monthly Cost | Fields Covered |
|----------|------|-------------|---------------|
| ... | ... | $X/mo | ... |

## Implementation Notes
- [Execution platform: Clay / n8n / custom script]
- [API rate limits to respect]
- [Credential requirements]
```

## Key Principles

1. **Waterfall order matters.** Put the highest-quality, highest-hit-rate provider first. Cheaper fallbacks catch what the primary misses. Reversing the order wastes budget on low-quality data.
2. **Never send to unverified emails.** Every email waterfall must end with a verification step. Bounced emails destroy domain reputation.
3. **Cost per record is the metric, not cost per provider.** A $0.10/record provider with 80% hit rate is cheaper than a $0.02/record provider with 20% hit rate.
4. **Catch-all emails are not found emails.** A catch-all domain accepts everything. Your email will land but the person may never see it. Flag, do not count as success.
5. **Budget drives provider selection.** Recommend ZoomInfo to a $500/month budget team and you lose credibility. Match providers to budget reality.

## Anti-Patterns

- **"Just use one provider for everything."** Single-provider enrichment caps out at 40-70% coverage. Waterfalls exist because no provider has complete data.
- **"Skip verification, the provider says the email is valid."** Provider validity checks are not the same as independent verification. Always verify through a dedicated service.
- **"Enrich every field for every record."** Enrich critical fields for all records. Enrich nice-to-have fields only for high-ICP-score records. Budget is finite.

## Hard Caps

- Minimum 2 providers per critical field
- Email verification is mandatory (no exceptions)
- Bounce rate threshold: 5% maximum per provider
- Data freshness: 18 months maximum for firmographic data

## Chain Triggers

After completing, suggest:
- "Run **crm-field-mapper** to ensure your CRM has fields for all enriched data"
- "Run **clay-table-designer** to build the Clay table that executes this waterfall"
- "Run **lead-scoring-model** to score records once enrichment data is available"

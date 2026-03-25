---
name: account-mapper
description: "Map an organization's structure, departments, and buying committee. Trigger: 'map this company', 'org chart for', 'who are the key people at', 'account map', 'map the org'"
allowed-tools: Read, Write, WebSearch
metadata:
  author: Achille Morin-Lemoine
  version: "1.0.0"
---

# Account Mapper

Research and map a target company's organizational structure with focus on departments relevant to your solution. Identify reporting lines, entry points, the likely buying committee, and internal dynamics that affect deal progression. The output is an actionable org map, not an exhaustive directory.

## Inputs

- **Company name** (required) — the company to map
- **Solution context** (optional) — what you sell and which departments it touches; if not provided, check docs/gtm-triangle.md
- **Depth** (optional) — "leadership" (C-suite and VPs only) or "full" (include Directors and key Managers). Default: full
- **Known contacts** (optional) — any contacts you already have at the company

If company name is missing, ask: "Which company should I map? Provide the company name."

## Steps

### Step 0 — Idempotency Check

Check if prospect documents already exists. If it does, ask: "An org map for this company already exists. Should I update it or start fresh?"

### Step 1 — Load Context

Read available context:
- gtm triangle.md documents — to understand which departments and roles matter
- ICP document — for qualification context
- `CLAUDE.md` — project instructions

### Step 2 — Research Company Overview

Use WebSearch to gather company-level context:

**Searches:**
- `"{company}" about` — company description
- `"{company}" crunchbase` — size, industry, funding
- `"{company}" leadership team` — published leadership
- `"{company}" news {current year}` — recent developments

**Gather:**
- Company size, industry, HQ location
- Key products or services
- Recent news (M&A, leadership changes, funding, expansion)
- Company stage and growth trajectory

### Step 3 — Map Relevant Departments

Identify departments that are relevant to your solution:

For each relevant department, estimate:
- Department function and scope
- Estimated headcount (based on total company size and industry norms)
- Department leader (search: `site:linkedin.com/in "{company}" "{department head title}"`)
- Key sub-teams within the department

**Searches per department:**
- `site:linkedin.com/in "{company}" "{department}" VP OR Director OR Head`
- `"{company}" "{department}" hiring` — active hiring indicates team growth

### Step 4 — Identify Key People

For each relevant department, find the key individuals:

- Name and title
- LinkedIn URL
- Estimated seniority level
- Time in role (if visible)
- Previous company and role (relevant for understanding their perspective)
- Any public content (posts, articles, speaking)

**Searches:**
- `site:linkedin.com/in "{company}" "{title}"`
- `"{person name}" "{company}" LinkedIn`
- `"{person name}" "{company}" {content type}` (articles, podcast, conference)

### Step 5 — Map Reporting Lines

Estimate the reporting structure for the relevant part of the org:

```
CEO
├── CRO / VP Sales
│   ├── Director, Sales (Mid-Market)
│   ├── Director, Sales (Enterprise)
│   └── Director, SDR Team
├── VP Marketing
│   ├── Director, Demand Gen
│   └── Director, Content
└── VP Operations / COO
    └── Director, Revenue Operations
```

Mark confidence level for each reporting line:
- **Confirmed** — visible from LinkedIn, company page, or org chart
- **Inferred** — based on title hierarchy and industry norms
- **Speculative** — educated guess, needs verification

### Step 6 — Identify Entry Points and Buying Committee

**Entry points (most accessible contacts):**
- Who is most likely to take a meeting? (Usually Directors or Sr. Managers, not C-suite)
- Who has recently posted about relevant topics?
- Who recently changed jobs? (New hires are more open to vendors)
- Do you have any mutual connections?

**Buying committee estimate:**

| Role | Person | Title | Accessibility | Confidence |
|------|--------|-------|--------------|------------|
| Decision Maker | {name} | {title} | Low (C-suite, gate-kept) | {level} |
| Champion | {name} | {title} | High (active on LinkedIn) | {level} |
| Influencer | {name} | {title} | Medium | {level} |
| Blocker | {name or "Unknown"} | {title} | {level} | {level} |

### Step 7 — Quality Gate

Before saving, verify:
- [ ] Company overview is complete (size, industry, location, stage)
- [ ] At least 2 relevant departments are mapped
- [ ] At least 5 key people are identified
- [ ] Reporting lines have confidence levels marked
- [ ] Buying committee roles are assigned
- [ ] Entry points are identified with reasoning
- [ ] No fabricated titles or positions — uncertain data is marked as such
- [ ] LinkedIn URLs use valid format (linkedin.com/in/{slug})

If any check fails, fix before proceeding.

## Output Format

Save the output to your project. Suggested filename: `{company-slug}-org-map.md`

```
# Org Map: {Company Name}
Date: {date}
Website: {url}
Industry: {industry}
Size: {headcount}
HQ: {location}

## Company Overview
{2-3 sentence summary of the company, its stage, and recent developments}

## Org Structure

### Relevant Departments

#### {Department 1}
- **Leader:** {name}, {title}
- **Estimated headcount:** {range}
- **Key people:**
  - {name} — {title} ([LinkedIn]({url})) — Confidence: {H/M/L}
  - {name} — {title} ([LinkedIn]({url})) — Confidence: {H/M/L}
- **Hiring signals:** {active roles or "None detected"}

#### {Department 2}
[Same format]

### Reporting Structure
```
{ASCII org chart with confidence markers}
[C] = Confirmed, [I] = Inferred, [S] = Speculative
```

## Buying Committee

| Role | Person | Title | LinkedIn | Accessibility | Confidence |
|------|--------|-------|----------|--------------|------------|
| Decision Maker | {name} | {title} | {url} | {H/M/L} | {H/M/L} |
| Champion | {name} | {title} | {url} | {H/M/L} | {H/M/L} |
| Influencer | {name} | {title} | {url} | {H/M/L} | {H/M/L} |

## Recommended Entry Points

### 1. {Contact Name} — {Title}
- **Why:** {reason this person is the best entry point}
- **Approach:** {recommended outreach channel and angle}
- **Confidence:** {H/M/L}

### 2. {Contact Name} — {Title}
[Same format]

## Gaps and Next Steps
- {Roles not yet identified and how to find them}
- {Reporting lines that need verification}
```

## Key Principles

1. **Org structures are estimates.** Mark confidence level for every role and reporting line. Never present inferred data as confirmed.
2. **Map for your sale, not for completeness.** Only map departments and people relevant to your solution. An exhaustive 200-person directory is not useful.
3. **Entry points matter more than decision makers.** Knowing the CEO's name is easy. Knowing which Director will take your call and champion your solution internally is the actual value.
4. **Accessible beats senior.** A Director who posts on LinkedIn weekly and recently changed jobs is a better entry point than a VP with no online presence.

## Anti-Patterns

- **The Directory Builder:** Listing every person at the company found on LinkedIn without mapping to departments, reporting lines, or buying roles. Names without structure are not an org map.
- **The Confidence Inflater:** Presenting inferred reporting lines as confirmed fact. If you're guessing that the Director reports to the VP, say so.
- **The Title Fabricator:** Assuming a company has a "VP of Revenue Operations" because similar companies do. If the role isn't found, note it as a gap.

## Next Skills

- Org mapped? Run **contact-finder** to get contact details for the buying committee members.
- Entry points identified? Run **write-outbound-sequence** targeting the champion.
- Need to understand the account better? Run **competitor-analysis** to see what alternatives they might be evaluating.

---
description: Build a Total Addressable Market list with ICP scoring and tiering. Use when someone asks "build TAM list", "total addressable market", "find target companies", "build company list", "TAM analysis", "market list", or "identify target accounts"
tools: Read, Write, WebSearch
---

# TAM Builder

Build a Total Addressable Market (TAM) list by researching companies matching ICP criteria, scoring each for fit, and assigning tiers. The output is a structured, prioritized list of target companies ready for prospecting.

This skill focuses on company-level identification. For contact-level prospecting, chain to **build-prospect-list** after.

## Inputs

- **ICP criteria** (required) — industry, company size (employee count or revenue), geography, stage, and qualifying characteristics
- **Geography** (required) — target regions or countries
- **Size filters** (required) — employee count range and/or revenue range
- **Target list size** (optional) — how many companies to find (default: 50-100)
- **Exclusions** (optional) — companies, industries, or segments to exclude
- **Existing customer list** (optional) — to exclude current customers

If ICP criteria, geography, or size filters are missing, ask before proceeding.

## Steps

### Step 0 — Idempotency Check

Check if `docs/prospects/tam-list.md` exists. If it does, ask: "A TAM list already exists. Do you want to expand it, refresh it, or overwrite it?"

### Step 1 — Load Context

Read these files if they exist:
- `docs/icp.md` — ICP definition
- `docs/gtm-triangle.md` — positioning and market context
- `docs/ops/lead-scoring-model.md` — scoring criteria to apply
- `CLAUDE.md` — project context

### Step 2 — Define Search Criteria

Translate ICP criteria into specific search parameters:

| Dimension | Criteria | Search Terms |
|-----------|----------|-------------|
| Industry | [From ICP] | "{industry} companies {geography}" |
| Size | [From ICP] | "{size range} employees" |
| Stage | [From ICP] | "series {stage} funded {year}" |
| Technology | [From ICP] | "companies using {technology}" |
| Signals | [From ICP] | "{industry} companies hiring {role}" |

Define at least 5 distinct search strategies to ensure coverage:
1. Industry directory search
2. Funded company search
3. Hiring signal search
4. Technology adoption search
5. Competitor customer search

### Step 3 — Research Companies

Execute searches to identify matching companies:

**Search queries to run:**
- `"{industry} companies {geography} {size range}"`
- `"top {industry} companies list {year}"`
- `"{industry} startups funded {year} {geography}"`
- `"companies using {technology} {geography}"`
- `"{industry} companies hiring {relevant role}"`
- `"site:crunchbase.com {industry} {geography} series {stage}"`
- `"{industry} conference {year} sponsors exhibitors"`
- `"best {industry} companies to work for {geography}"`

For each company found, capture:
- Company name
- Domain/website
- Industry and sub-industry
- Employee count (or range)
- Revenue range (if available)
- HQ location
- Founded year
- Funding status (last round, total raised)
- Brief description (1 sentence: what they do)
- Source (where you found them)

### Step 4 — Deduplicate and Clean

Before scoring:
- Remove duplicate companies (by domain)
- Remove companies on the exclusion list
- Remove existing customers (if list provided)
- Remove companies outside the size range
- Remove companies outside the geography
- Flag companies with incomplete data for enrichment

### Step 5 — Apply ICP Scoring

Score each company on ICP fit using a 1-5 scale with anchored criteria:

| Score | Definition | Criteria |
|-------|-----------|----------|
| 5 | Perfect fit | Matches ALL ICP dimensions: industry, size, geography, stage, signals present |
| 4 | Strong fit | Matches 4 of 5 ICP dimensions, no disqualifiers |
| 3 | Good fit | Matches 3 of 5 ICP dimensions, minor gaps |
| 2 | Partial fit | Matches 2 of 5 dimensions, significant gaps |
| 1 | Weak fit | Matches 1 dimension, included only for coverage |

For each score, document what criterion is matched and what is missing.

### Step 6 — Assign Tiers

Based on ICP score and strategic value:

| Tier | Score Range | Strategy | Outreach Approach |
|------|-----------|----------|------------------|
| Tier 1 | 5 | High-touch, personalized | 1:1 research and custom messaging |
| Tier 2 | 4 | Semi-personalized | Personalized templates with specific hooks |
| Tier 3 | 3 | Scaled | Template-based with industry personalization |
| Drop | 1-2 | Do not pursue | Remove from active list |

Distribution target: roughly 20% Tier 1, 30% Tier 2, 50% Tier 3 (after dropping low scores).

### Step 7 — Identify Patterns and Segments

Analyze the compiled list for patterns:
- Which sub-industries have the most Tier 1 companies?
- Are there geographic clusters?
- Common company characteristics among high-scoring companies?
- Any emerging segments not in the original ICP?

Document these patterns as they inform ICP refinement and campaign segmentation.

### Step 8 — Quality Gate

Before saving, verify:
- [ ] List size meets the target (or documents why it fell short)
- [ ] Every company has an ICP score with justification
- [ ] No duplicates remain (checked by domain)
- [ ] No excluded companies or existing customers are included
- [ ] Companies outside size/geography filters are removed
- [ ] Tier distribution is roughly 20/30/50 (not all Tier 1 or all Tier 3)
- [ ] At least 5 search strategies were used (not just one source)
- [ ] Sources are documented for each company

## Output Format

Save to `docs/prospects/tam-list.md`:

```markdown
# Total Addressable Market List
Date: [Date]
Target ICP: [Brief ICP description]
Geography: [Regions]
Size Filter: [Employee/revenue range]
Total Companies: [Count]
Average ICP Score: [X.X/5]

## Summary
- Tier 1 (high-touch): [X] companies ([X%])
- Tier 2 (semi-personalized): [X] companies ([X%])
- Tier 3 (scaled): [X] companies ([X%])
- Dropped (score 1-2): [X] companies
- Top industries represented: [List]
- Top geographies: [List]

## Market Patterns
- [Pattern 1: observation about the market]
- [Pattern 2: observation about segments]
- [Pattern 3: emerging opportunity or gap]

## TAM List

### Tier 1 — High Touch
| # | Company | Domain | Industry | Size | Location | Funding | ICP Score | Score Justification | Source |
|---|---------|--------|----------|------|----------|---------|-----------|-------------------|--------|
| 1 | ... | ... | ... | ... | ... | ... | 5/5 | [Why this score] | [Where found] |

### Tier 2 — Semi-Personalized
| # | Company | Domain | Industry | Size | Location | Funding | ICP Score | Score Justification | Source |
|---|---------|--------|----------|------|----------|---------|-----------|-------------------|--------|

### Tier 3 — Scaled
| # | Company | Domain | Industry | Size | Location | Funding | ICP Score | Score Justification | Source |
|---|---------|--------|----------|------|----------|---------|-----------|-------------------|--------|

## Data Gaps
| Company | Missing Fields | Priority for Enrichment |
|---------|---------------|----------------------|
| ... | [Fields] | High/Medium/Low |

## Methodology
- Search strategies used: [List]
- Sources checked: [List]
- Date range for signals: [Range]
- Exclusions applied: [List]

## Next Steps
- Enrich missing data for Tier 1 companies
- Identify contacts at Tier 1 and Tier 2 companies
- Design outreach sequences by tier
```

## Key Principles

1. **Breadth of search prevents blind spots.** Using only one source (e.g., only Crunchbase) misses companies that are not on that platform. Use at least 5 different search strategies.
2. **Score justification prevents bias.** Every score must explain why. "5/5 because I found them first" is not valid. "5/5: exact industry match, 120 employees (in range), Series B funded, hiring VP Sales" is valid.
3. **Tiers drive resource allocation.** Tier 1 gets custom research and 1:1 outreach. Tier 3 gets templates. Do not treat all companies the same.
4. **TAM is not a prospect list.** TAM identifies companies. Prospect lists identify contacts. This skill finds companies; chain to build-prospect-list for contacts.
5. **Document your methodology.** If someone asks "how did you find these companies," the methodology section should answer completely.

## Anti-Patterns

- **"Just scrape LinkedIn for 500 companies."** Quantity without qualification wastes outreach effort. A scored list of 80 companies outperforms an unscored list of 500.
- **"Every company gets a 4 or 5."** Score inflation defeats the purpose. If most companies score high, your criteria are too loose. Enforce the anchored rubric.
- **"Skip the patterns analysis."** Patterns in the TAM reveal market insights. Skipping this step means missing segmentation opportunities and ICP refinements.

## Hard Caps

- Maximum 150 companies per TAM list (split by segment if more)
- Minimum 5 search strategies used
- Every company must have a score justification
- Drop companies scoring below 3 unless explicitly asked to keep them

## Chain Triggers

After completing, suggest:
- "Run **build-prospect-list** to identify contacts at Tier 1 and Tier 2 companies"
- "Run **write-outbound-sequence** to create tiered outreach sequences"
- "Run **icp-challenger** to validate the ICP based on patterns found in the TAM"

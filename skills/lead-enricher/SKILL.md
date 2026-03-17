---
description: "Enrich companies and contacts with firmographic, technographic, and intent data. Trigger: 'enrich these leads', 'enrich this list', 'add data to prospects', 'research these companies'"
tools: Read, Write, WebSearch
---

# Lead Enricher

Enrich a list of companies or contacts with firmographic data (size, industry, location, funding), technographic data (tools they use), and intent signals (hiring, news, expansion). Every entry is scored against ICP criteria and flagged for data quality issues.

This is research, not fabrication. If data is not findable, it is marked as unknown rather than guessed.

## Inputs

- **Company or contact list** (required) — CSV, pasted text, or file path with company names and/or contact names
- **ICP criteria** (optional) — for scoring; if not provided, check docs/icp.md
- **Enrichment depth** (optional) — "basic" (firmographics only) or "full" (firmographics + technographics + signals). Default: full
- **Output format** (optional) — "markdown" or "csv". Default: markdown

If the list is missing or unclear, ask: "Please provide the list of companies or contacts to enrich. Paste them, provide a CSV, or point me to a file."

## Steps

### Step 0 — Idempotency Check

Check if `docs/prospects/enriched-list.md` already exists. If it does, ask: "An enriched list already exists. Should I overwrite it, append to it, or save with a different name?"

### Step 1 — Load Context

Read available context files:
- `docs/icp.md` — ICP criteria for scoring
- `docs/gtm-triangle.md` — positioning context
- `CLAUDE.md` — project instructions

If ICP criteria were not provided and `docs/icp.md` does not exist, ask for scoring criteria before proceeding.

### Step 2 — Parse Input List

Parse the provided list and normalize into a working format:
- Extract company names and any existing data points
- Extract contact names, titles, and company associations
- Deduplicate entries
- Count total items and confirm with user if list exceeds 25 items

### Step 3 — Enrich Companies

For each company (max 25 per run), research using WebSearch:

**Firmographic data:**
- Full company name and website
- Industry and sub-industry
- Employee count range
- Revenue estimate (if publicly available)
- HQ location
- Founding year
- Funding stage and total raised (if applicable)

**Technographic data (if depth = full):**
- Key technologies used (search: "{company} tech stack", "{company} uses {tool category}")
- Job postings mentioning specific tools (search: "{company} careers {technology}")

**Intent signals (if depth = full):**
- Recent funding rounds (search: "{company} funding {current year}")
- Hiring patterns (search: "{company} hiring {relevant roles}")
- Recent news or announcements (search: "{company} news {current quarter}")
- Leadership changes (search: "{company} new {C-level title}")

### Step 4 — Enrich Contacts

For each contact on the list:
- Verify current title and company (search: "site:linkedin.com/in {first name} {last name} {company}")
- Identify email pattern for the company domain (search: "{company domain} email format")
- Find LinkedIn profile URL
- Note any recent activity (posts, speaking engagements, job changes)

### Step 5 — Score Against ICP

Score each company on a 1-5 scale using ICP criteria:

| Score | Meaning |
|-------|---------|
| 5 | Perfect match on all ICP dimensions, active signals |
| 4 | Strong match, minor gap on one dimension |
| 3 | Moderate match, meets core criteria but missing signals |
| 2 | Partial match, significant gaps |
| 1 | Poor match, included for completeness |

Document the reasoning for each score in one sentence.

### Step 6 — Flag Data Quality Issues

Flag each entry with a data confidence level:
- **High** — data confirmed from multiple sources
- **Medium** — data from one source, plausible but unverified
- **Low** — data uncertain, based on estimates or outdated sources
- **Missing** — data not found, marked explicitly

### Step 7 — Quality Gate

Before saving, verify:
- [ ] Every company has at minimum: name, website, industry, size estimate
- [ ] No email addresses were fabricated
- [ ] ICP scores have one-sentence justification
- [ ] Data quality flags are assigned to every entry
- [ ] No duplicate entries in the output
- [ ] List does not exceed 25 companies

If any check fails, fix before proceeding.

## Output Format

Save to `docs/prospects/enriched-list.md`:

```
# Enriched Lead List
Date: {date}
Total companies: {count}
Enrichment depth: {basic|full}
Average ICP score: {X.X}/5

## Summary
- Companies enriched: {count}
- Contacts enriched: {count}
- High-confidence entries: {count}
- Data gaps flagged: {count}

## Enriched Companies

### 1. {Company Name}
- **Website:** {url}
- **Industry:** {industry}
- **Size:** {employee range}
- **Revenue:** {estimate or "Not found"}
- **Location:** {HQ city, country}
- **Funding:** {stage and amount or "Not found"}
- **Tech stack:** {key tools or "Not researched"}
- **Recent signals:** {hiring, funding, news or "None detected"}
- **ICP Score:** {X}/5 — {one-sentence justification}
- **Data confidence:** {High|Medium|Low}

**Contacts:**
| Name | Title | LinkedIn | Email Pattern | Confidence |
|------|-------|----------|--------------|------------|
| {name} | {title} | {url or "Not found"} | {pattern or "Not found"} | {H/M/L} |

[Repeat for each company]

## Data Quality Notes
- {Any systemic issues encountered}
- {Recommendations for manual verification}
```

## Key Principles

1. **Never fabricate data.** If a data point is not findable, mark it as "Not found." Never invent email addresses, revenue numbers, or employee counts.
2. **Quality over quantity.** 10 well-researched entries beat 25 shallow ones. Cap at 25 per run to maintain depth.
3. **Score with evidence.** Every ICP score must reference observable data, not gut feeling.
4. **Flag uncertainty.** Data confidence levels exist so the user knows what to trust and what to verify.
5. **Recency matters.** Funding and hiring data older than 6 months should be flagged as potentially stale.

## Anti-Patterns

- **The Fabricator:** Inventing plausible-sounding email addresses or revenue figures when data is not available. Always mark as "Not found" instead.
- **The Surface Skimmer:** Recording company name and website then moving on. Each entry needs depth across all requested enrichment dimensions.
- **The Stale Researcher:** Treating 2-year-old funding data as current. Always note the date of the data source when available.

## Next Skills

- Enriched list ready? Run **contact-finder** to fill gaps in the contact data.
- List scored? Run **write-outbound-sequence** to build sequences for top-scoring prospects.
- Patterns emerging? Run **lookalike-finder** with your highest-scored companies as seeds.

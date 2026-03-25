---
name: lookalike-finder
description: "Find companies that look like your best customers. Trigger: 'find similar companies', 'lookalike companies', 'companies like our best customers', 'find more companies like'"
allowed-tools: Read, Write, WebSearch
metadata:
  author: Achille Morin-Lemoine
  version: "1.0.0"
---

# Lookalike Finder

Analyze your best customers to extract the pattern that makes them great, then search for companies matching that pattern. The output is a ranked list of lookalike companies scored by similarity to your best customers.

## Inputs

- **Best customer names** (required) — 3-5 company names that represent your ideal customers
- **Why they're best** (optional) — what makes each one a great customer (deal size, speed to close, expansion, retention)
- **Geography filter** (optional) — limit results to specific regions
- **Exclusions** (optional) — companies or industries to exclude

If fewer than 3 companies are provided, ask: "I need at least 3 best customer examples to identify a reliable pattern. Can you add more?"

## Steps

### Step 0 — Idempotency Check

Check if prospect documents already exists. If it does, ask: "A lookalike list already exists. Should I overwrite it or save with a different name?"

### Step 1 — Load Context

Read available context:
- ICP document — existing ICP criteria to compare against
- gtm triangle.md documents — positioning and market context
- `CLAUDE.md` — project instructions

### Step 2 — Research Best Customers

For each of the 3-5 seed companies, research using WebSearch:

- Industry and sub-industry (search: "{company} about", "{company} crunchbase")
- Employee count and revenue range
- Founding year and company stage
- Funding history (search: "{company} funding rounds")
- Technology stack signals (search: "{company} tech stack", "{company} careers {tools}")
- Business model (SaaS, services, marketplace, etc.)
- Geography (HQ and major offices)
- Growth signals (hiring pace, recent news)

### Step 3 — Extract the Pattern

Analyze all seed companies to find common traits:

**Must-have traits (present in all or most seeds):**
- Industry/vertical alignment
- Company size range (employee count band)
- Revenue range
- Business model similarity
- Geographic pattern
- Stage of growth

**Nice-to-have traits (present in some seeds):**
- Specific technology usage
- Funding stage
- Growth trajectory
- Organizational structure

**The pattern statement:** Write a 2-3 sentence description of the ideal lookalike. Example: "B2B SaaS companies in the HR tech space, 50-200 employees, Series A or B funded, headquartered in North America or Western Europe, with an outbound sales motion and at least 5 SDRs."

### Step 4 — Search for Lookalikes

Using the pattern, search for matching companies (max 20 per run):

**Search strategies:**
- `"{industry}" companies "{size indicator}" "{geography}"` (e.g., "HR tech companies series B North America")
- `companies similar to {seed company}` (via Crunchbase, G2, or industry lists)
- `"{industry}" "{technology}" startups {geography}`
- `{industry} companies list {year}`
- `"{seed company}" competitors` (competitors of seeds often match the pattern)
- Industry-specific directories and rankings

### Step 5 — Score Lookalikes

Score each lookalike on similarity to the seed pattern (1-5):

| Score | Meaning |
|-------|---------|
| 5 | Matches all must-have traits and multiple nice-to-haves |
| 4 | Matches all must-have traits, few nice-to-haves |
| 3 | Matches most must-have traits, one gap |
| 2 | Matches some traits but significant differences |
| 1 | Surface-level similarity only |

Drop any company scoring below 3 unless the list would be too short.

### Step 6 — Quality Gate

Before saving, verify:
- [ ] Pattern is based on at least 3 seed companies
- [ ] Pattern statement is specific and falsifiable
- [ ] Each lookalike has firmographic data to justify the score
- [ ] No seed companies appear in the lookalike list
- [ ] No excluded companies or industries appear
- [ ] List does not exceed 20 companies
- [ ] List is sorted by score (highest first)

If any check fails, fix before proceeding.

## Output Format

Save the output to your project. Suggested filename: `lookalike-list.md`

```
# Lookalike Companies
Date: {date}
Seed companies: {list}
Total lookalikes found: {count}
Average similarity score: {X.X}/5

## Seed Analysis

### Common Pattern
{2-3 sentence pattern statement}

### Trait Breakdown
| Trait | Seed 1 | Seed 2 | Seed 3 | Pattern |
|-------|--------|--------|--------|---------|
| Industry | {val} | {val} | {val} | {common} |
| Size | {val} | {val} | {val} | {range} |
| Revenue | {val} | {val} | {val} | {range} |
| Stage | {val} | {val} | {val} | {common} |
| Geography | {val} | {val} | {val} | {common} |
| Business model | {val} | {val} | {val} | {common} |

## Lookalike List

| # | Company | Website | Industry | Size | Stage | Geography | Score | Key Match Reason |
|---|---------|---------|----------|------|-------|-----------|-------|-----------------|
| 1 | {name} | {url} | {ind} | {size} | {stage} | {geo} | 5/5 | {why it matches} |

## Recommendations
- **Priority tier (score 4-5):** {count} companies ready for outreach
- **Research tier (score 3):** {count} companies worth investigating further
- **Pattern gaps:** {any dimensions where the pattern could be refined}
```

## Key Principles

1. **Pattern first, search second.** Never start searching until the common pattern is explicitly defined. Searching without a pattern produces random lists.
2. **Minimum 3 seeds.** With fewer than 3, you're matching one company's profile, not a pattern. That leads to false positives.
3. **Falsifiable criteria.** "Fast-growing tech companies" is not a pattern. "Series A-B funded SaaS companies, 50-200 employees, in the supply chain vertical" is a pattern.
4. **Competitors of seeds are candidates.** Companies competing with your best customers often share the same traits that made those customers a good fit.

## Anti-Patterns

- **The Vague Matcher:** Defining the pattern as "mid-size technology companies" and returning any tech company with 100+ employees. Patterns must be specific enough to exclude most companies.
- **The Single-Trait Matcher:** Finding companies that match on industry alone without checking size, stage, or geography. Similarity requires alignment across multiple dimensions.

## Next Skills

- Lookalikes identified? Run **contact-finder** to find the right people at each company.
- Need to validate the pattern? Run **icp-challenger** to stress-test the criteria.
- Ready to reach out? Run **build-prospect-list** with the lookalike list as your target account list.

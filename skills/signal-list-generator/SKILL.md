---
description: "Generate a prospect list from a specific buying signal. Trigger: 'find companies that just raised funding', 'who is hiring for', 'companies with recent', 'signal-based list', 'build trigger list'"
tools: Read, Write, WebSearch
---

# Signal List Generator

Build a time-sensitive prospect list based on a specific buying signal. Unlike static prospect lists, signal lists are perishable. A company that raised funding 2 weeks ago is a hot lead. The same company 3 months later is just another name.

Every entry includes the signal evidence, ICP fit score, and a tailored outreach angle that connects the signal to your value proposition.

## Inputs

- **Signal type** (required) — one of: funding, hiring, tech adoption, executive change, expansion, acquisition, product launch, conference attendance
- **Signal filters** (optional) — industry, size, geography, recency window
- **ICP criteria** (optional) — for scoring; if not provided, check docs/icp.md
- **Recency window** (optional) — how far back to look. Default: 30 days. Max: 90 days.

If signal type is missing, ask: "What buying signal should I search for? Options: funding, hiring, tech adoption, executive change, expansion, acquisition, product launch, conference attendance."

## Steps

### Step 0 — Idempotency Check

Check if `docs/prospects/signal-{signal-type}-{date}.md` already exists. If it does, inform the user and ask whether to create a new version or update.

### Step 1 — Load Context

Read available context:
- `docs/icp.md` — ICP criteria for scoring
- `docs/gtm-triangle.md` — value proposition for outreach angles
- `CLAUDE.md` — project instructions

### Step 2 — Define Signal Search Criteria

Map the signal type to specific search queries:

**Funding:**
- `"{industry}" series {A|B|C} funding {month} {year}`
- `"{industry}" startup raised {year}`
- `recently funded {industry} companies`

**Hiring:**
- `"{role title}" hiring {industry} {geography}`
- `"{company type}" careers "{role title}" {year}`
- `job postings "{role title}" {industry}`

**Tech adoption:**
- `"{technology}" adoption {industry} {year}`
- `"{technology}" migration {industry}`
- `companies switching to "{technology}"`

**Executive change:**
- `new {title} appointed {industry} {year}`
- `"{industry}" {title} hired {month} {year}`
- `leadership change {industry} {year}`

**Expansion:**
- `"{industry}" expansion new office {year}`
- `"{industry}" company entering {market/geography}`
- `"{industry}" international expansion {year}`

### Step 3 — Search and Collect

Execute searches and collect companies with confirmed signals (max 25 per run):

For each company found:
- Company name and website
- Signal evidence (the specific event: "Raised $15M Series B on March 3, 2026")
- Signal date (exact date or week)
- Signal source (URL where this was reported)
- Industry and size estimate

### Step 4 — Enrich with Firmographics

For each company with a confirmed signal:
- Employee count range
- HQ location
- Industry sub-segment
- Brief company description (1 sentence)
- Any additional signals detected during research

### Step 5 — Score ICP Fit

Score each company (1-5) against ICP criteria. Signal presence alone does not guarantee fit. A company that just raised funding but is in the wrong industry is still a poor fit.

### Step 6 — Define Outreach Angles

For each company, write a signal-specific outreach angle:

**The angle must connect:**
1. The specific signal (what happened)
2. The implication (what this means for them)
3. Your value proposition (how you help with that implication)

Bad: "Congrats on the funding! We should chat."
Good: "You raised $15M Series B last week. Most companies at this stage triple their outbound team in 90 days but don't have the infrastructure to support it. That's exactly what we build."

### Step 7 — Quality Gate

Before saving, verify:
- [ ] Every entry has a verified signal with date and source
- [ ] Signal dates are within the specified recency window
- [ ] ICP scores have justification beyond "they have the signal"
- [ ] Outreach angles connect signal to value proposition
- [ ] No duplicate companies
- [ ] List is sorted by signal recency (most recent first)
- [ ] Date is prominently displayed (these lists expire)

If any check fails, fix before proceeding.

## Output Format

Save to `docs/prospects/signal-{signal-type}-{date}.md`:

```
# Signal List: {Signal Type}
Date generated: {date}
Signal window: {start date} to {end date}
Expiry warning: This list is time-sensitive. Outreach after {expiry date} loses signal relevance.
Total companies: {count}
Average ICP score: {X.X}/5

## Signal Summary
- Signal type: {type}
- Filters applied: {industry, size, geography}
- Total signals found: {count}
- ICP-qualified: {count}

## Prospect List

| # | Company | Signal | Signal Date | Source | Size | ICP Score | Outreach Angle |
|---|---------|--------|-------------|--------|------|-----------|----------------|
| 1 | {name} | {event} | {date} | {url} | {size} | {X}/5 | {angle} |

## Detailed Entries

### 1. {Company Name}
- **Website:** {url}
- **Signal:** {detailed description}
- **Signal date:** {date}
- **Source:** {url}
- **Industry:** {industry}
- **Size:** {range}
- **ICP Score:** {X}/5 — {justification}
- **Outreach angle:** {2-3 sentences}
- **Recommended channel:** {email / LinkedIn / phone}
- **Urgency:** {High / Medium} — {why}

[Repeat for each company]

## Action Items
- {Recommended outreach timeline}
- {Suggested sequence to use}
- {Follow-up signal monitoring recommendations}
```

## Key Principles

1. **Signals are perishable.** A funding announcement from 60 days ago is already stale for outreach. Always display dates prominently and flag anything older than 30 days.
2. **Signal is not fit.** A company with the right signal but wrong profile is still a bad prospect. Score on ICP fit, not signal strength alone.
3. **Connect signal to value.** The outreach angle must explain why the signal makes your solution relevant right now, not just congratulate them on the event.
4. **Cite your sources.** Every signal must have a source URL. Unverifiable signals are excluded.
5. **Recency sorting.** Most recent signals first. The freshest signals have the highest outreach response rates.

## Anti-Patterns

- **The Congratulator:** Writing outreach angles that start with "Congrats on..." without connecting to value. Congratulations without relevance is noise.
- **The Stale Lister:** Including signals from 4+ months ago in a "recent signals" list. If it's old, it's not a signal anymore.
- **The Signal-Only Scorer:** Giving a company a 5/5 ICP score just because they had the signal, ignoring that they're in the wrong industry or too small.

## Next Skills

- Signal list ready? Run **write-outbound-sequence** with signal-specific messaging.
- Need contacts? Run **contact-finder** for the top-scoring companies.
- Want ongoing monitoring? Run **signal-monitor-setup** to automate signal detection.

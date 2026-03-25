---
name: build-prospect-list
description: Build a qualified prospect list with ICP scoring and outreach angles per row
allowed-tools: Read, Write, WebSearch
metadata:
  author: Achille Morin-Lemoine
  version: "1.0.0"
---

# Build Prospect List

Build a qualified prospect list from scratch. This isn't a data dump. Every row in the output has been evaluated against ICP criteria, scored for fit, and assigned a specific outreach angle explaining why this prospect should be contacted and what to say.

The output is a structured CSV-ready document that can be loaded into a CRM or sequencing tool immediately.

## Inputs

- **ICP criteria** (required) — industry, company size, geography, stage, and qualifying characteristics
- **Contact criteria** (required) — target titles, seniority level, and department
- **Number of prospects** (required) — target list size (recommended: 25-50 for initial list)
- **Signal filters** (optional) — specific buying signals to prioritize (hiring, funding, tech adoption)
- **Exclusions** (optional) — companies or industries to exclude
- **Existing customer list** (optional) — to avoid targeting current customers

## Steps

### Step 1 — Confirm ICP Criteria

Review the provided ICP criteria and ensure they're specific enough to filter:

**Company-level criteria:**
- Industry/vertical (specific sub-segments, not just "technology")
- Revenue range or employee count range
- Geographic focus
- Company stage or maturity indicators
- Funding stage (if relevant)
- Technology stack signals (if relevant)

**Contact-level criteria:**
- Target titles (3-5 specific titles)
- Seniority level (VP, Director, Manager, C-level)
- Department (Sales, Marketing, Operations, etc.)

**Disqualifiers:**
- What rules a company out (too small, wrong industry, existing customer, competitor)

If criteria are too vague to produce a targeted list, ask for clarification before proceeding.

### Step 2 — Define Contact Criteria

For each target title, define:
- Title variations (e.g., "VP Sales" also matches "VP of Sales," "Vice President, Sales," "Head of Sales")
- Seniority boundary (include Director but not Manager, or include both?)
- Department boundary (Sales only, or also Revenue Operations?)

### Step 3 — Research and Compile Company List

Use WebSearch to identify companies matching the ICP criteria:

**Research strategies:**
- Search for companies in the target industry and size range
- Look at industry directories and lists
- Check "similar companies" on LinkedIn or Crunchbase
- Search for companies with specific signals (recently funded, hiring relevant roles)
- Look at competitor customer lists or case study pages
- Check industry conference attendee/sponsor lists

For each company, gather:
- Company name
- Website
- Industry/sub-industry
- Estimated employee count
- Estimated revenue range (if findable)
- Location (HQ)
- Recent signals (funding, hiring, news)
- Brief description (1 sentence)

### Step 4 — Identify Contacts at Each Company

For each company on the list, identify the best contact(s) matching the criteria:
- Full name
- Title
- LinkedIn profile URL (if findable via search)
- Relevant context (recent post, job change, published content)

Use WebSearch to find contacts through:
- LinkedIn search (via web search, not direct scraping)
- Company team/about pages
- Conference speaker lists
- Published articles or podcast appearances
- Press quotes

### Step 5 — Score Each Prospect

Score each company on ICP fit using a 1-5 scale:

| Score | Meaning |
|-------|---------|
| 5 | Perfect fit across all criteria, active buying signals present |
| 4 | Strong fit, meets all core criteria, may lack signals |
| 3 | Good fit, meets most criteria, one gap |
| 2 | Partial fit, meets some criteria but significant gaps |
| 1 | Weak fit, included only to fill list |

Scoring factors:
- Firmographic match (industry, size, geography)
- Signal presence (hiring, funding, tech adoption)
- Timing indicators (is there evidence of active need?)
- Accessibility (can you reach the right contact?)

Drop any prospects scoring below 3 unless specifically asked to include them.

### Step 6 — Assign Outreach Angles

For each prospect, write a specific outreach angle (1-2 sentences) explaining:
- Why this company was selected (what signal or criteria matched)
- What the opening conversation should reference
- What pain point or opportunity to lead with

The outreach angle should be specific enough that a sales rep could use it to personalize the first touchpoint without additional research.

Bad: "They're a good fit for our product."
Good: "Recently raised Series B ($15M). Hiring 3 SDRs simultaneously. Likely building outbound for the first time and will need sequencing infrastructure and playbooks."

## Output Format

Produce a structured document with two sections:

```
# Prospect List: [Campaign/ICP Name]
Date: [Date]
Total prospects: [Count]
Average ICP score: [X.X/5]

## Summary
- ICP criteria used: [Brief recap]
- Contact criteria: [Titles targeted]
- Top signals observed: [Most common patterns]
- Recommended priority: [Which prospects to contact first]

## Prospect Table

| # | Company | Website | Industry | Size | Location | Contact Name | Title | ICP Score | Signal | Outreach Angle |
|---|---------|---------|----------|------|----------|-------------|-------|-----------|--------|----------------|
| 1 | ... | ... | ... | ... | ... | ... | ... | 4/5 | Series B funding | "..." |
| 2 | ... | ... | ... | ... | ... | ... | ... | 5/5 | Hiring VP Sales | "..." |

## Notes
[Any observations about the market, patterns found, or recommendations for outreach sequencing]
```

## Quality Checks

- Every row has an outreach angle. No row should say "general outreach" or be left blank.
- No duplicate companies in the list.
- ICP scores are justified. A score of 5 should have clear evidence. A score of 3 should note what's missing.
- Contact titles match the defined criteria. No random contacts added to fill rows.
- Companies that match exclusion criteria are not included.
- Existing customers (if a list was provided) are not included.
- The list is sorted by ICP score (highest first).
- Outreach angles reference specific, observable information, not assumptions.
- If the target list size couldn't be reached at quality, note how many qualified prospects were found rather than padding with low-quality entries.

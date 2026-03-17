---
description: Estimate TAM/SAM/SOM from ICP criteria. Trigger phrases — "size the market", "how big is the market", "TAM SAM SOM", "market sizing", "total addressable market"
tools: Read, Write, WebSearch
---

# Market Sizing

Estimate Total Addressable Market (TAM), Serviceable Addressable Market (SAM), and Serviceable Obtainable Market (SOM) from ICP criteria and public data. The output is a referenced sizing document with explicit assumptions, not a back-of-napkin guess.

Good market sizing is honest about what it doesn't know. Every number should trace back to a source or a stated assumption. When data conflicts, show both numbers and explain the discrepancy.

## Inputs

- **ICP document or criteria** (required) — firmographics, industry, geography, company size, buyer personas. If `docs/icp.md` exists, load it automatically.
- **Product/service description** (required) — what is being sold and at what price point
- **Geography** (optional, default: global) — market scope to size
- **Time horizon** (optional, default: current year) — base year for estimates
- **Known data points** (optional) — any existing market data, analyst reports, or internal estimates to anchor against

If the ICP document or product description is missing, ask for them before proceeding. Do not guess what the company sells.

## Steps

### Step 1 — Load Context

Read existing project documents to ground the analysis:
- Check for `docs/icp.md` — load firmographics, industry, company size criteria
- Check for `docs/competitors/competitive-analysis.md` — extract market landscape context
- Check for `CLAUDE.md` — load company context and positioning
- Note the average deal size or pricing from the product description

Extract from the ICP: target industries, company size bands, geographies, and any segment breakdowns.

### Step 2 — Research Industry Size Data

Use WebSearch to find macro market data. Run these queries systematically:

- "{industry} market size {year}"
- "{industry} number of companies {geography}"
- "{industry} total addressable market report"
- "{industry segment} market growth rate CAGR"
- "number of {company type} in {geography}" (e.g., "number of B2B SaaS companies in North America")
- "{industry} companies by revenue segment"

For each data point found, record:
- The number
- The source (analyst firm, government database, industry association)
- The year of the data
- Whether it measures revenue, company count, or something else

Target at least 3 independent sources. If WebSearch returns nothing usable for a query, write "Not found." Never invent market size numbers.

### Step 3 — Identify and Size Segments

Break the total market into segments that align with the ICP:
- By industry vertical (if serving multiple)
- By company size band (SMB / Mid-Market / Enterprise)
- By geography (if relevant)
- By maturity or adoption stage

For each segment, estimate the number of companies using:
- Government business registries and census data
- Industry association membership counts
- Analyst reports on segment breakdowns
- LinkedIn Sales Navigator-style company counts (via web search)

Search: "number of {segment descriptor} companies {geography} {year}"

### Step 4 — Calculate TAM

TAM = Total number of companies that could theoretically buy the product, multiplied by annual contract value.

Formula: `TAM = Total qualifying companies x Average annual deal value`

Document:
- How many companies match the broadest industry/size criteria
- What annual deal value you're using and why
- Any adjustments for multi-product or variable pricing

TAM should be large but defensible. If the number seems implausibly high, add tighter filters.

### Step 5 — Filter to SAM

SAM = Companies within TAM that you can realistically reach and serve.

Apply filters:
- Geographic reach (remove regions you can't serve)
- Language/market access constraints
- Channel availability (do you have distribution in this segment?)
- Technical compatibility (can the product actually work for them?)
- Regulatory or compliance barriers

Formula: `SAM = TAM x Reachability rate`

Document each filter and the percentage it removes.

### Step 6 — Filter to SOM

SOM = Realistic 12-month capture target based on current resources, sales capacity, and competitive dynamics.

Factors:
- Current sales team capacity (deals per rep per quarter)
- Marketing pipeline generation rate
- Win rate against competitors
- Average sales cycle length
- Brand awareness in the segment
- Competitive density (how many alternatives exist)

Formula: `SOM = SAM x Realistic capture rate`

The capture rate for a startup is typically 1-5% of SAM. For an established player, 5-15%. Be conservative. Justify the percentage you choose.

### Step 7 — Validate and Cross-Reference

Sanity-check the numbers:
- Does the TAM align with published analyst reports?
- Is the SAM/TAM ratio between 10-40%? (Outside this range needs explanation)
- Is the SOM achievable given team size and resources?
- Do competitor revenues (if public) fit within the TAM?

Search: "{top competitor} annual revenue", "{industry} market share breakdown"

If validation reveals a conflict, adjust and document why.

### Step 8 — Run Quality Gate

Before saving, verify:
- [ ] Every number traces to a source or a stated assumption
- [ ] TAM > SAM > SOM (the funnel narrows, never widens)
- [ ] At least 3 data sources are cited
- [ ] Assumptions are listed separately from facts
- [ ] Segment breakdown adds up to the total (no double-counting)
- [ ] SOM is achievable given stated resources

## Output Format

Save to `docs/market-sizing.md`:

```markdown
# Market Sizing: [Product/Company Name]
Date: [Date]
Base Year: [Year]
Geography: [Scope]

## Executive Summary
[3-4 sentences: TAM, SAM, SOM headline numbers with the key insight]

## TAM — Total Addressable Market

**Estimate: $[X] / [Y] companies**

| Segment | Companies | Avg Deal Value | Segment TAM |
|---------|-----------|---------------|-------------|
| [Segment 1] | [count] | $[value] | $[total] |
| [Segment 2] | [count] | $[value] | $[total] |
| **Total** | **[count]** | | **$[total]** |

**Sources:** [numbered list of sources with years]

## SAM — Serviceable Addressable Market

**Estimate: $[X] / [Y] companies**

| Filter Applied | Companies Removed | Remaining |
|---------------|-------------------|-----------|
| [Filter 1] | [count or %] | [remaining] |
| [Filter 2] | [count or %] | [remaining] |
| **SAM Total** | | **[count]** |

**SAM/TAM Ratio:** [X]%

## SOM — Serviceable Obtainable Market (12-Month)

**Estimate: $[X] / [Y] companies**

| Factor | Value | Rationale |
|--------|-------|-----------|
| Sales capacity | [X deals/quarter] | [why] |
| Win rate | [X]% | [basis] |
| Capture rate | [X]% of SAM | [justification] |

## Assumptions & Limitations
- [Assumption 1 — what was assumed and why]
- [Assumption 2]
- [Limitation: what data was unavailable]

## Data Sources
1. [Source, year, what it provided]
2. [Source, year, what it provided]
3. [Source, year, what it provided]
```

## Key Principles

1. **Source everything.** Every number needs a source or an explicit "assumed because..." statement. Unsourced numbers are worthless.
2. **Conservative SOM.** Overestimating obtainable market kills credibility. When in doubt, use the lower number.
3. **Segments over averages.** A segmented TAM is always more useful than a single number. Break it down by the dimensions that matter for targeting.
4. **Honest gaps.** If data for a segment doesn't exist, say so. "Not found" is better than a fabricated number.
5. **Funnel logic.** TAM > SAM > SOM, always. If the math doesn't narrow, the filters aren't real.

## Anti-Patterns

- **Do NOT cite analyst reports you haven't actually found via WebSearch.** If a Gartner or Forrester number doesn't appear in search results, don't reference it.
- **Do NOT round aggressively to make numbers look clean.** $47M TAM is more credible than $50M TAM.
- **Do NOT conflate revenue TAM with company-count TAM.** Always present both units clearly.

## Skill Chain

- **Chains from:** `icp-model-creator` (provides the filtering criteria)
- **Chains to:** `build-prospect-list` (SOM defines list targets), `industry-briefing` (market context)

> **Next step:** "Now that we've sized the market, want me to build a prospect list targeting the SOM segment?" or "Want me to run an industry briefing to deepen the market context?"

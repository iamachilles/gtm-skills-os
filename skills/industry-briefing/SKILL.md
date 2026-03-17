---
description: Produce a market brief for a new vertical or industry. Use when someone asks "research this industry", "industry overview", "market brief", "vertical analysis", "should we enter this market", or "new vertical assessment"
tools: Read, Write, WebFetch, WebSearch
---

# Industry Briefing

Produce a dense, 2-page market brief for a new industry or vertical. This is the document you read before deciding whether to enter a market, how to position, and where to start. It covers market size, key players, buying process, regulatory landscape, trends, and entry strategy.

Hard cap: 800-1000 words. Every sentence must carry information. No filler, no throat-clearing, no "the industry is undergoing a digital transformation."

## Inputs

- **Industry/vertical name** (required) — the market to research (e.g., "construction tech", "healthcare compliance SaaS", "fintech lending")
- **Geography** (required) — market scope (e.g., "US", "Europe", "Global", "DACH region")
- **Your product/service** (optional) — what you sell, to contextualize entry strategy
- **Specific questions** (optional) — anything particular to investigate

If industry name or geography are missing, ask before proceeding.

## Steps

### Step 1 — Load Existing Context

Check for and read these files if they exist:
- `docs/icp.md` — current ICP (to understand adjacency)
- `docs/gtm-triangle.md` — existing positioning
- `CLAUDE.md` — project context

This helps frame the briefing relative to the company's current market position.

### Step 2 — Research Market Size and Growth

Search for quantitative market data:
- "{industry} market size {year} {geography}"
- "{industry} TAM SAM SOM"
- "{industry} market growth rate forecast"
- "{industry} industry report {year}"

Extract: total market size (revenue), growth rate (CAGR), key segments within the market, and any notable size milestones. Prefer recent data (within 2 years). Note the source and date for every figure.

If WebSearch returns no reliable market size data, write "Market size data not publicly available. Recommend purchasing [specific report type] for accurate sizing." Never invent market size numbers.

### Step 3 — Identify Top 10 Players

Search for the major companies in this space:
- "{industry} top companies {geography}"
- "{industry} market leaders"
- "{industry} startups funding {year}"
- "{industry} competitive landscape"

Categorize into:
- **Incumbents** (5-7) — established players with significant market share
- **Challengers** (3-5) — fast-growing companies disrupting the space

For each: name, estimated size/stage, primary positioning, and what makes them notable. Keep to one line per company.

### Step 4 — Map the Buying Process

Research how companies in this industry buy:
- "{industry} B2B buying process"
- "{industry} procurement"
- "{industry} sales cycle length"
- "{industry} decision makers who buys"

Define:
- **Primary buyer titles** — who initiates, evaluates, and approves
- **Typical sales cycle** — length and stages
- **Purchase triggers** — what events cause companies to buy
- **Common evaluation criteria** — how they compare vendors
- **Budget cycles** — annual planning, quarterly reviews, event-driven

### Step 5 — Identify Regulatory and Compliance Factors

Search for regulatory context:
- "{industry} regulations {geography}"
- "{industry} compliance requirements"
- "{industry} certifications needed"
- "{industry} data privacy regulations"

Identify: active regulations, upcoming regulatory changes, required certifications or compliance standards, and how regulation affects buying decisions (e.g., "compliance deadline creates Q4 urgency").

If no significant regulations apply, state that explicitly rather than forcing regulatory content.

### Step 6 — Surface Trends and Disruptions

Search for current dynamics:
- "{industry} trends {year}"
- "{industry} disruptions"
- "{industry} technology adoption"
- "{industry} challenges {year}"

Identify 3-5 trends that are actively reshaping the market. For each trend: what's changing, who's affected, and what opportunity it creates. Ignore generic trends ("AI is transforming everything") in favor of specific, observable shifts.

### Step 7 — Assess Entry Strategy

Based on all research, define:
- **Beachhead segment** — which sub-segment of this industry to target first and why
- **Required proof points** — what credentials, case studies, or certifications you need to be credible
- **Positioning angle** — how to frame your value proposition for this vertical
- **First 5 target accounts** — specific companies that represent ideal early wins
- **Time-to-credibility estimate** — how long to build enough vertical expertise to compete

### Step 8 — Run Quality Gate

Before saving, verify:
- [ ] Market size includes a source and date (not invented)
- [ ] At least 8 of the 10 players are identified with real companies
- [ ] Buying process includes specific titles, not just "decision makers"
- [ ] Trends are specific to this industry, not generic business trends
- [ ] Entry strategy recommends a specific beachhead, not "start broad"
- [ ] Total length is 800-1000 words
- [ ] No sentences are filler or restate the obvious

## Output Format

Save to `docs/industry-briefings/{industry-slug}.md`:

```
# Industry Brief: [Industry Name] — [Geography]
Date: [Date]

## Market Size & Growth
[Market size, growth rate, key segments. Include sources.]

## Key Players

### Incumbents
| Company | Size/Stage | Positioning | Notable |
|---------|-----------|-------------|---------|
| ... | ... | ... | ... |

### Challengers
| Company | Size/Stage | Positioning | Notable |
|---------|-----------|-------------|---------|
| ... | ... | ... | ... |

## Buying Process
- **Primary buyers:** [Titles]
- **Sales cycle:** [Length]
- **Purchase triggers:** [Events]
- **Evaluation criteria:** [How they compare]
- **Budget cycles:** [Timing]

## Regulatory Landscape
[Active regulations, upcoming changes, required certifications. "None significant" if applicable.]

## Market Trends
1. **[Trend]:** [What's changing and what opportunity it creates]
2. **[Trend]:** [What's changing and what opportunity it creates]
3. **[Trend]:** [What's changing and what opportunity it creates]

## Entry Strategy
- **Beachhead segment:** [Specific sub-segment and why]
- **Proof points needed:** [What you need to be credible]
- **Positioning angle:** [How to frame your value]
- **Target accounts:** [5 specific companies]
- **Time to credibility:** [Estimate]

## Sources
[List key sources used]
```

## Key Principles

1. **Dense, not long.** The hard cap is 1000 words. If you can say it in fewer words, do. Every sentence must add information the reader didn't have before.
2. **Specific over general.** "Construction tech market is $12.3B in the US (Mordor Intelligence, 2025)" beats "the construction technology market is large and growing."
3. **Anti-fabrication is absolute.** If WebSearch returns no data for a section, write "Not found." Never invent market sizes, growth rates, or company names. Cite sources for all quantitative claims.
4. **Entry strategy must be opinionated.** "Consider targeting mid-market" is useless. "Target Series B-C construction firms with 200-500 employees who are replacing spreadsheet-based project tracking" is useful.

## Anti-Patterns

- **Do not pad the brief to hit word count.** 800 dense words beats 1000 fluffy words. Cut ruthlessly.
- **Do not list generic trends.** "Digital transformation" and "AI adoption" are not insights. Name specific shifts with observable evidence.
- **Do not skip the entry strategy.** Market overviews without a "so what" are interesting but not actionable.

## Chain Triggers

After completing, suggest:
- "Run **icp-model-creator** to build an ICP for the {industry} vertical"
- "Run **build-prospect-list** to identify target accounts in {industry}"
- "Run **competitor-analysis** to deep-dive on the key players identified"

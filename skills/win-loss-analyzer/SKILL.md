---
name: win-loss-analyzer
description: Analyze closed deals to extract win/loss patterns and improve sales strategy. Trigger phrases — "win loss analysis", "why are we losing deals", "deal analysis", "analyze closed deals", "sales patterns"
allowed-tools: Read, Write
metadata:
  author: Achille Morin-Lemoine
  version: "1.0.0"
---

# Win-Loss Analyzer

Analyze closed deals (won, lost, and stalled) to extract patterns, root causes, and actionable recommendations. This is not a dashboard. It's a diagnostic that tells you why you're winning, why you're losing, and what to change.

The best win-loss analysis challenges assumptions. If the findings just confirm what the team already believes, dig deeper.

## Inputs

- **Deal data** (required) — CRM export, deal notes, sales call transcripts, or structured notes from the user. Must include at least 10 deals for meaningful patterns. Minimum fields: company name, outcome (won/lost/stalled), deal size, and any context on why.
- **ICP document** (optional) — if ICP document exists, load it to compare deal patterns against ICP criteria
- **Time period** (optional) — scope the analysis to a specific window
- **Specific questions** (optional) — anything the user wants investigated ("Why do we lose to Competitor X?", "Are larger deals harder to close?")

If deal data is missing or contains fewer than 5 deals, ask the user to provide more data before proceeding. Pattern analysis on tiny samples produces noise, not signal.

## Steps

### Step 1 — Load Context and Ingest Data

- Check for ICP document — load ICP criteria for fit comparison
- Check for competitive analysis — load competitor context
- Check for `CLAUDE.md` — load company context
- Ingest and normalize the deal data into a consistent format:
  - Company name
  - Outcome: Won / Lost / Stalled (no decision)
  - Deal size (ARR or total contract value)
  - Sales cycle length (if available)
  - Entry point persona (who was the first contact)
  - Champion (was there an internal advocate?)
  - Competitor mentioned (if any)
  - Loss reason or win reason (if documented)
  - ICP fit score (assess against ICP if available)

### Step 2 — Categorize and Segment Deals

Group deals by outcome and calculate baseline metrics:

**By outcome:**
- Won: count, total revenue, average deal size, average cycle length
- Lost: count, total pipeline lost, average deal size, average cycle length
- Stalled: count, total pipeline stuck, average age

**By segment (cross-cut each with outcome):**
- By deal size band (group into 3-4 natural tiers)
- By industry/vertical (if multiple)
- By entry point persona
- By competitor involved vs. no competitor
- By ICP fit score (if assessed)

Look for segments where win rate diverges significantly from the average.

### Step 3 — Analyze Won Deals

For won deals, identify the common thread:
- What personas were involved? Was there a champion?
- What was the average deal size and cycle length?
- What triggered the buying process?
- Were specific features or value props cited?
- How did the deal enter the pipeline? (inbound, outbound, referral)
- What ICP criteria did winners share?

Produce a "winning profile" — the composite characteristics of deals you win.

### Step 4 — Analyze Lost Deals

For lost deals, identify root causes. Categorize each loss into one of these buckets:
1. **Competitor loss** — lost to a named alternative
2. **No decision** — buyer chose to do nothing
3. **Price/budget** — deal died on cost
4. **Bad fit** — prospect shouldn't have been in pipeline
5. **Timing** — right solution, wrong moment
6. **Missing capability** — product gap killed the deal
7. **Process failure** — sales execution issue (slow follow-up, wrong stakeholder, no champion)

For each root cause bucket, document:
- How many deals fell here
- Total revenue lost
- Specific examples or quotes
- Whether this is fixable (and how)

### Step 5 — Analyze Stalled Deals

Stalled deals are often more revealing than losses. Investigate:
- Where in the pipeline did they stall? (discovery, proposal, negotiation, legal)
- How long have they been stalled?
- Was there ever a champion, or did the deal lack internal advocacy?
- Is there a pattern in deal size, persona, or industry?
- Should any be reclassified as lost?

### Step 6 — Extract Cross-Cutting Patterns

Look for patterns that span categories:
- **Champion effect:** Win rate with identified champion vs. without
- **Competitive dynamics:** Win rate when a specific competitor is involved
- **Deal size correlation:** Does win rate change with deal size?
- **Cycle length:** Are faster deals more likely to close?
- **Entry point impact:** Which persona as first contact leads to highest win rate?
- **ICP fit correlation:** Do higher ICP-fit deals win more often?
- **Seasonal patterns:** Any time-of-year effects?

### Step 7 — Produce Recommendations

Based on the analysis, produce 5-8 specific, actionable recommendations. Each should:
- Reference the data pattern that supports it
- State what to change (process, targeting, messaging, product)
- Estimate the impact ("If we had disqualified bad-fit deals earlier, we'd have saved ~X hours of pipeline")
- Assign a priority (High / Medium / Low)

### Step 8 — Run Quality Gate

Before saving, verify:
- [ ] All deals are categorized — no "uncategorized" bucket
- [ ] Loss reasons are root causes, not symptoms ("lost to competitor" is a symptom; "competitor had native integration we lack" is a root cause)
- [ ] Recommendations reference specific data points, not general advice
- [ ] Winning profile is specific enough to change targeting
- [ ] Stalled deals are analyzed separately, not lumped with losses
- [ ] Numbers add up — won + lost + stalled = total deals analyzed

## Output Format

Save the output to your project. Suggested filename: `win-loss-analysis.md`

```markdown
# Win-Loss Analysis: [Company/Product Name]
Date: [Date]
Period Analyzed: [Time range]
Total Deals Analyzed: [N]

## Executive Summary
[4-5 sentences: headline win rate, biggest insight, most actionable finding]

## Deal Overview

| Metric | Won | Lost | Stalled | Total |
|--------|-----|------|---------|-------|
| Count | [n] | [n] | [n] | [n] |
| Revenue | $[x] | $[x] | $[x] | $[x] |
| Avg Deal Size | $[x] | $[x] | $[x] | $[x] |
| Avg Cycle (days) | [x] | [x] | [x] | — |
| Win Rate | [x]% | — | — | — |

## Winning Profile
[Composite description of what won deals look like — persona, size, trigger, features cited, channel]

## Loss Root Cause Breakdown

| Root Cause | Count | Revenue Lost | % of Losses | Fixable? |
|-----------|-------|-------------|-------------|----------|
| Competitor loss | [n] | $[x] | [x]% | [Yes/Partially/No] |
| No decision | [n] | $[x] | [x]% | [Yes/Partially/No] |
| [etc.] | | | | |

### Details by Root Cause
[For each bucket: examples, quotes, specific patterns]

## Stalled Deal Analysis
[Where they stall, why, which to re-engage vs. disqualify]

## Cross-Cutting Patterns

| Pattern | Finding | Implication |
|---------|---------|-------------|
| Champion present | Win rate [X]% vs [Y]% without | [What to do about it] |
| Deal size > $[X] | Cycle [X]% longer, win rate [X]% lower | [What to do about it] |
| [etc.] | | |

## Recommendations

| # | Recommendation | Supporting Data | Priority | Expected Impact |
|---|---------------|----------------|----------|----------------|
| 1 | [Action] | [Pattern reference] | High | [Estimated impact] |
| 2 | [Action] | [Pattern reference] | High | [Estimated impact] |
| [etc.] | | | | |

## ICP Refinement Implications
[What should change in the ICP based on this analysis]

## Raw Data Summary
[Reference to input data used, any cleaning or assumptions made]
```

## Key Principles

1. **Root causes, not symptoms.** "Lost to competitor" is not a root cause. "Competitor offered native Salesforce integration we don't have" is a root cause. Keep asking "why" until you hit something actionable.
2. **Let the data surprise you.** If every finding confirms existing beliefs, the analysis isn't deep enough. Look for the counterintuitive patterns.
3. **Separate stalled from lost.** Stalled deals have different dynamics and different remedies. Never lump them together.
4. **Quantify everything.** "We sometimes lose on price" is useless. "Price was the primary loss reason in 6 of 23 lost deals, representing $180K in lost ARR" is actionable.
5. **Recommendations must be specific.** "Improve discovery" is not a recommendation. "Add champion identification checkpoint before sending proposals" is.

## Anti-Patterns

- **Do NOT invent deal data or fill gaps with assumptions.** If a deal has no loss reason documented, categorize it as "Unknown — insufficient data" and note the gap.
- **Do NOT produce generic sales advice.** Every recommendation must trace back to a specific pattern found in this data set.
- **Do NOT ignore small sample sizes.** If a pattern is based on 2-3 deals, flag it as "directional, not conclusive" rather than stating it as fact.

## Skill Chain

- **Chains to:** `icp-challenger` (findings challenge ICP assumptions), `customer-interview-guide` (loss patterns inform interview questions)

> **Next step:** "Want me to stress-test the ICP based on these win-loss patterns?" or "Should I build an interview guide to dig deeper into the loss reasons?"

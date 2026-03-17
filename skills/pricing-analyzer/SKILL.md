---
description: Analyze competitor pricing models and produce a positioning-ready landscape. Trigger phrases — "pricing analysis", "competitor pricing", "how much do competitors charge", "pricing landscape", "pricing comparison"
tools: Read, Write, WebFetch, WebSearch
---

# Pricing Analyzer

Analyze competitor pricing models to understand the landscape, identify positioning opportunities, and inform pricing strategy. The output maps how competitors structure, package, and gate their pricing, revealing where to compete on value and where to differentiate on model.

Pricing analysis is not just about the numbers. It's about understanding the underlying value metrics, what's free vs. paid, and what customers complain about.

## Inputs

- **Competitor list** (required) — 3-7 competitors to analyze. If `docs/competitors/competitive-analysis.md` exists, load the competitor list from there.
- **Your product/pricing** (optional) — current pricing model for comparison. Check `CLAUDE.md` for context.
- **Industry/category** (optional) — helps with broader market pricing research
- **Specific questions** (optional) — anything to investigate ("Is usage-based pricing viable here?", "What do customers complain about with Competitor X's pricing?")

If no competitor list is provided and no competitive analysis exists, ask the user to provide at least 3 competitors or run `competitor-analysis` first.

## Steps

### Step 1 — Load Context

Read existing project documents:
- Check for `docs/competitors/competitive-analysis.md` — load competitor list and positioning
- Check for `docs/icp.md` — load buyer context (who pays, what they value, budget range)
- Check for `CLAUDE.md` — load company context and current pricing

From the context, identify:
- The competitors to analyze (3-7 companies)
- Your current pricing model (if any)
- What the buyer cares about in pricing (cost predictability, scalability, feature access)

### Step 2 — Scrape Pricing Pages

For each competitor, use WebFetch to pull their pricing page:
- `/pricing`
- `/plans`
- `/plans-and-pricing`

Extract from each pricing page:
- **Pricing model:** Per-seat, usage-based, flat rate, tiered, hybrid, custom/enterprise
- **Tier names and prices:** What each tier is called and what it costs
- **Value metric:** What the price scales with (users, contacts, API calls, revenue, features)
- **Feature gates:** What's included vs. excluded at each tier
- **Free tier:** Whether one exists, what's included, limitations
- **Enterprise/custom tier:** Whether pricing is hidden behind "Contact Sales"
- **Annual vs. monthly:** Discount for annual commitment
- **Add-ons:** Separately priced features or modules

If the pricing page is behind a gate or not public, note "Pricing not publicly available" and move to review research.

### Step 3 — Research Pricing from Reviews and Discussions

Use WebSearch to find what customers actually pay and think about pricing:

- "{competitor} pricing" — general pricing information
- "{competitor} pricing review G2"
- "{competitor} pricing review Capterra"
- "{competitor} how much does it cost"
- "{competitor} pricing complaints"
- "{competitor} pricing increase" — recent price changes
- "{competitor} pricing vs {other competitor}"
- "{competitor} free plan limitations"
- "switching from {competitor} cost" — total cost of ownership signals
- "{competitor} pricing reddit OR quora" — candid user discussions

For each competitor, summarize:
- What customers say about value for money
- Most common pricing complaints (too expensive, confusing tiers, hidden fees, per-seat gets expensive at scale)
- Whether pricing has changed recently (and how customers reacted)

If WebSearch returns nothing for a query, write "Not found." Do not fabricate pricing data or customer sentiment.

### Step 4 — Identify Pricing Models and Value Metrics

Across all competitors, categorize the pricing models used:

| Model | Description | Competitors Using It |
|-------|------------|---------------------|
| Per-seat | Price per user per month | [List] |
| Usage-based | Price scales with consumption | [List] |
| Flat rate | Single price for everything | [List] |
| Tiered feature gates | Different features at different prices | [List] |
| Hybrid | Combination of above | [List] |
| Custom/enterprise only | No public pricing | [List] |

Identify the dominant value metric in the market (what most competitors charge based on). Note any outliers using a different model.

### Step 5 — Map Feature Gates Across Tiers

Create a feature comparison matrix across competitors. For the most common 10-15 features in the category:

- Which features are available on free/lowest tiers?
- Which features are gated to mid-tier?
- Which features are enterprise-only?
- Are any features charged as add-ons?

This reveals what the market considers "table stakes" vs. "premium" vs. "enterprise."

### Step 6 — Analyze Pricing Psychology and Packaging

For each competitor, assess:
- **Anchor pricing:** Is there a deliberately expensive tier to make mid-tier look reasonable?
- **Decoy effect:** Is one tier designed to push buyers toward another?
- **Feature bundling:** Are features grouped to force upgrades?
- **Landing tier:** Which tier are most customers on? (Often revealed in reviews)
- **Expansion model:** How does revenue grow within an account? (More seats, more usage, tier upgrade)
- **Lock-in mechanisms:** What makes switching expensive? (Data, integrations, training)

### Step 7 — Identify Positioning Opportunities

Based on the full pricing landscape, identify:

- **Underserved price point:** Is there a gap between tiers in the market?
- **Model disruption:** Could a different pricing model win? (e.g., flat rate in a per-seat market)
- **Simplicity advantage:** If competitor pricing is confusing, simple pricing is a differentiator
- **Value metric alignment:** Is the market pricing on the wrong metric? (Charging per seat when value scales with usage)
- **Packaging opportunity:** Can you bundle differently to target a segment competitors miss?
- **Transparency play:** If competitors hide pricing, being transparent builds trust

### Step 8 — Run Quality Gate

Before saving, verify:
- [ ] At least 3 competitors have pricing data (from page scraping or review research)
- [ ] Every pricing data point has a source (pricing page, review, discussion)
- [ ] Feature gate matrix covers at least 8 features
- [ ] Customer sentiment on pricing is based on actual reviews, not assumptions
- [ ] Positioning recommendations are specific to this market, not generic pricing advice
- [ ] Competitors with hidden pricing are noted as such, not guessed
- [ ] "Not found" is used where data is unavailable, never fabricated prices

## Output Format

Save to `docs/competitors/pricing-landscape.md`:

```markdown
# Pricing Landscape Analysis: [Category/Market]
Date: [Date]
Competitors Analyzed: [Count]

## Executive Summary
[3-4 sentences: dominant pricing model, price range, biggest finding, key positioning opportunity]

## Competitor Pricing Overview

### [Competitor 1]
- **Model:** [Per-seat / Usage / Tiered / etc.]
- **Value Metric:** [What price scales with]
- **Tiers:**
  | Tier | Price | Key Inclusions | Key Exclusions |
  |------|-------|---------------|----------------|
  | [Free/Starter] | $[X]/mo | [features] | [features] |
  | [Pro/Growth] | $[X]/mo | [features] | [features] |
  | [Enterprise] | Custom | [features] | — |
- **Annual Discount:** [X]%
- **Customer Sentiment:** [Summary from reviews]
- **Notable:** [Anything unusual — recent price increase, add-on fees, etc.]

[Repeat for each competitor]

## Pricing Model Comparison

| Competitor | Model | Value Metric | Starting Price | Enterprise Price | Free Tier |
|-----------|-------|-------------|---------------|-----------------|-----------|
| [Comp 1] | [model] | [metric] | $[X]/mo | $[X] or Custom | Yes/No |
| [Comp 2] | [model] | [metric] | $[X]/mo | $[X] or Custom | Yes/No |

## Feature Gate Matrix

| Feature | [Comp 1] Free | [Comp 1] Pro | [Comp 2] Free | [Comp 2] Pro | Market Standard |
|---------|------|------|------|------|------|
| [Feature 1] | Y/N | Y/N | Y/N | Y/N | [Free/Paid/Enterprise] |
| [Feature 2] | Y/N | Y/N | Y/N | Y/N | [Free/Paid/Enterprise] |

## Customer Pricing Complaints (From Reviews)

| Competitor | Common Complaint | Frequency | Quote |
|-----------|-----------------|-----------|-------|
| [Comp 1] | [Complaint] | [Common/Occasional/Rare] | "[verbatim from review]" |
| [Comp 2] | [Complaint] | [Common/Occasional/Rare] | "[verbatim from review]" |

## Pricing Model Analysis
- **Dominant model in market:** [What most competitors use]
- **Dominant value metric:** [What they charge based on]
- **Price range:** $[low] to $[high] per [metric] per month
- **Market trend:** [Where pricing is heading — up, down, model shifts]

## Positioning Recommendations

| # | Opportunity | Rationale | Risk Level |
|---|------------|-----------|-----------|
| 1 | [Specific recommendation] | [Why, based on data] | [Low/Medium/High] |
| 2 | [Specific recommendation] | [Why, based on data] | [Low/Medium/High] |
| 3 | [Specific recommendation] | [Why, based on data] | [Low/Medium/High] |

## Data Sources
1. [Source, date, what it provided]
2. [Source, date, what it provided]
```

## Key Principles

1. **Pricing pages lie, reviews tell the truth.** Published pricing is aspirational. What customers actually pay and complain about reveals the real landscape. Always cross-reference with reviews.
2. **The value metric matters more than the number.** Whether a competitor charges $50 or $500 matters less than whether they charge per seat, per usage, or per feature. The metric shapes buyer behavior.
3. **Complaints are opportunities.** Every pricing complaint on G2 is a positioning angle. If customers hate per-seat pricing at scale, flat-rate pricing becomes a differentiator.
4. **Simple beats clever.** If competitor pricing requires a spreadsheet to understand, simplicity itself is a competitive advantage. Note complexity as a finding.
5. **Never fabricate prices.** If a competitor doesn't publish pricing, say so. Guessing "$probably around $99/mo" destroys the credibility of the entire analysis.

## Anti-Patterns

- **Do NOT invent pricing data.** If a competitor's pricing isn't publicly available, record "Not publicly available" and focus on what reviews and discussions reveal about cost.
- **Do NOT just list prices without analysis.** A table of prices is not a pricing analysis. The value is in the model comparison, the complaint patterns, and the positioning recommendations.
- **Do NOT recommend pricing changes without evidence.** "You should lower your price" is not a recommendation. "Competitors in the $X-$Y range capture the mid-market segment you're targeting, while your $Z price point positions you above that" is an insight.

## Skill Chain

- **Chains from:** `competitor-analysis` (provides competitor list and context)
- **Chains to:** Pricing strategy development, sales enablement (competitive battle cards)

> **Next step:** "Want me to draft pricing positioning recommendations based on this landscape?" or "Should I pull this into competitive battle cards for sales?"

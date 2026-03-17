---
description: Deep competitive intelligence with positioning comparison and differentiation matrix
tools: Read, Write, WebFetch, WebSearch
---

# Competitor Analysis

Produce a comprehensive competitive intelligence brief. This goes beyond surface-level feature comparisons to analyze how competitors position themselves, where they're investing, what their customers actually say, and where the white space exists for differentiation.

The output is a working document that informs positioning, sales enablement, and content strategy.

## Inputs

- **Company name** (required) — the company you're building the analysis for
- **Company website** (required) — URL for context on current positioning
- **Known competitors** (optional) — any competitors already identified
- **Industry/market** (optional) — helps with discovery if competitors aren't known
- **Specific questions** (optional) — anything specific to investigate (pricing, feature gaps, messaging angles)

## Steps

### Step 1 — Identify Top 5 Competitors

Start with any known competitors provided. Use WebSearch to find additional competitors by searching:
- "[company] competitors"
- "[company] alternatives"
- "[industry] software/tools/platforms"
- G2 and Capterra category pages
- Industry analyst reports or comparison articles

Narrow to the top 5 most relevant competitors based on market overlap, ICP similarity, and competitive frequency (how often they show up in deals).

### Step 2 — Scrape Websites and Positioning

For each competitor, use WebFetch to pull their homepage, product pages, pricing page, and about page. Extract:
- **Tagline/headline** — their core positioning statement
- **Target audience** — who they say they serve
- **Key claims** — what they promise
- **Proof points** — case studies, logos, metrics they cite
- **Differentiators** — what they claim makes them different
- **Pricing model** — if publicly available (per seat, usage-based, tiered, custom)

### Step 3 — Research Customer Reviews

Use WebSearch to find G2, Capterra, and TrustRadius reviews for each competitor. Look for:
- Most praised features or capabilities
- Most common complaints or gaps
- Switching reasons (why customers leave)
- Implementation experience
- Support quality

Summarize the sentiment for each competitor in 3-5 bullet points.

### Step 4 — Check Recent Activity

For each competitor, research:
- **Funding** — recent rounds, total raised, investors
- **Hiring** — what roles they're hiring for (reveals strategic priorities)
- **Product launches** — recent feature releases or new products
- **Partnerships** — integrations, channel partners, co-marketing
- **Leadership changes** — new executives, especially CRO/CMO/CPO

### Step 5 — Analyze Ad Messaging (If Visible)

Use WebSearch to check for visible ad copy on Google Ads, LinkedIn Ads, or Facebook Ads. Search for:
- "[competitor name] ad"
- Check their LinkedIn company page for sponsored content
- Note the messaging angles, CTAs, and offers they're running

This reveals what they're betting on for demand gen.

### Step 6 — Build Differentiation Matrix

Create a matrix that maps all competitors (including your company) across key evaluation criteria. Choose 8-12 criteria relevant to the market:
- Feature categories (e.g., "AI capabilities," "integrations," "reporting")
- Business model attributes (e.g., "free tier," "self-serve," "enterprise ready")
- Market positioning (e.g., "SMB focus," "vertical specialization," "platform vs. point solution")

Score each as Strong / Moderate / Weak / Not Present.

### Step 7 — Identify White Space and Counter-Positioning

Based on the full analysis, identify:
- **White space** — areas where no competitor is strong, representing positioning opportunities
- **Counter-positioning angles** — specific ways to frame your solution against each competitor's weaknesses
- **Competitive traps** — areas where competing head-on would be a losing battle

## Output Format

Write a single competitive brief document:

```
# Competitive Analysis: [Company Name]
Date: [Date]

## Market Overview
[2-3 paragraphs on the competitive landscape, market dynamics, and where things are heading]

## Competitor Profiles

### [Competitor 1]
- **Website:** [URL]
- **Positioning:** [Their core claim]
- **Target Audience:** [Who they serve]
- **Key Strengths:** [Bullet points]
- **Key Weaknesses:** [Bullet points]
- **Recent Activity:** [Funding, hiring, launches]
- **Customer Sentiment:** [Summary from reviews]

[Repeat for each competitor]

## Differentiation Matrix

| Criteria | Your Company | Comp 1 | Comp 2 | Comp 3 | Comp 4 | Comp 5 |
|----------|-------------|--------|--------|--------|--------|--------|
| ... | ... | ... | ... | ... | ... | ... |

## White Space Opportunities
[Where no one is strong — your openings]

## Counter-Positioning Angles
[Per-competitor: "When competing against X, emphasize..."]

## Competitive Traps to Avoid
[Where NOT to compete head-on and why]

## Recommendations
[3-5 strategic recommendations based on the analysis]
```

## Quality Checks

- All 5 competitors have complete profiles. No placeholder entries.
- Differentiation matrix uses at least 8 evaluation criteria.
- Counter-positioning angles are specific to each competitor, not generic.
- Customer sentiment is based on actual review data, not assumptions.
- White space opportunities are genuinely unoccupied, not just "we could do this too."
- Recommendations are actionable and tied to specific findings from the analysis.
- Sources (review sites, articles, job postings) are cited where relevant.

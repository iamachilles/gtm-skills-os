---
name: g2-review-miner
description: Extract themes from G2/Capterra reviews for competitive intelligence and messaging angles. Use when someone asks "analyze reviews", "what do customers say about", "competitor review analysis", "G2 review mining", "review themes", or "customer complaints about [product]"
allowed-tools: Read, Write, WebFetch, WebSearch
metadata:
  author: Achille Morin-Lemoine
  version: "1.0.0"
---

# G2 Review Miner

Extract and categorize themes from G2 and Capterra reviews for a specific product. This produces competitive ammunition: the exact language customers use when praising, complaining about, or comparing a product. Every theme maps to a messaging angle you can use in outreach, content, or sales conversations.

Anti-fabrication rule: Every theme must cite specific language from actual reviews. If no reviews are found, state "No public reviews found on G2/Capterra." Never invent review content.

## Inputs

- **Product name** (required) — the product to analyze reviews for
- **Product category** (optional) — helps narrow search (e.g., "CRM", "project management", "marketing automation")
- **Your product name** (optional) — for framing messaging angles as competitive counters
- **Focus areas** (optional) — specific aspects to prioritize (pricing, support, implementation, features)

If product name is missing, ask before proceeding.

## Steps

### Step 1 — Load Context

Check for and read these files if they exist:
- competitive analysis — existing competitor analysis
- ICP document — buyer personas to align messaging angles
- `CLAUDE.md` — project context

### Step 2 — Search for Reviews

Search G2 and Capterra for review pages:
- "site:g2.com {product} reviews"
- "site:capterra.com {product} reviews"
- "{product} reviews G2"
- "{product} reviews Capterra"
- "{product} user reviews {year}"

Use WebFetch to pull review pages when URLs are found. Focus on:
- The "What do you like?" sections
- The "What do you dislike?" sections
- The overall rating distribution
- Reviews from the last 18 months (prioritize recent)

Also search for review content on other surfaces:
- "{product} complaints"
- "{product} alternatives reddit"
- "switching from {product}"
- "{product} vs [known competitor]"
- "why I left {product}"

If no reviews are found on G2 or Capterra, state clearly: "No public reviews found on G2/Capterra for {product}." Search alternative sources (Reddit, Twitter/X, blog posts) and note the source shift.

### Step 3 — Extract Negative Review Themes

From negative reviews and complaints, categorize into these theme buckets:

1. **Pain themes** — recurring frustrations with day-to-day usage
2. **Feature gaps** — capabilities users want but the product lacks
3. **Pricing complaints** — objections to cost, pricing model, or value-for-money
4. **Support issues** — response times, quality, accessibility of customer support
5. **Implementation difficulties** — onboarding friction, setup complexity, migration pain
6. **Performance issues** — speed, reliability, downtime, bugs
7. **UX/UI complaints** — interface confusion, learning curve, design problems

For each theme:
- Extract 2-5 direct quotes from reviews (exact language, not paraphrased)
- Count frequency (how many reviews mention this theme)
- Rate severity: Critical (blocks usage), Major (significant friction), Minor (annoyance)

Hard cap: Maximum 20 negative themes total. If you find more, merge similar themes and keep the most frequent.

### Step 4 — Extract Positive Review Themes

From positive reviews, categorize:

1. **Core value** — what users say they get the most value from
2. **Switching triggers** — why users switched from a competitor to this product
3. **Unexpected benefits** — value users discovered that wasn't in the sales pitch
4. **Loyalty drivers** — what keeps users renewing or recommending

For each theme:
- Extract 2-3 direct quotes
- Count frequency
- Note which user segments (by role or company size) express this most

Hard cap: Maximum 12 positive themes.

### Step 5 — Quantify Theme Frequency

Build a frequency table:
- Count total reviews analyzed
- Count mentions per theme
- Calculate percentage of reviews mentioning each theme
- Rank themes by frequency

This transforms anecdotal review reading into quantified intelligence.

### Step 6 — Generate Messaging Angles

For each negative theme (top 10 by frequency), create a messaging angle:

- **Theme:** [The complaint category]
- **Customer language:** [Direct quote from reviews]
- **Messaging angle:** [How to reference this in outreach without naming the competitor directly]
- **Use in:** [Where to deploy — cold email, LinkedIn post, sales call, landing page, battlecard]
- **Opening line example:** [One sentence that could open a conversation around this pain]

For each positive theme (top 5 by frequency), create a defensive angle:
- **Theme:** [What competitors' users love]
- **Implication:** [What this means for your positioning — where you must match or differentiate]

### Step 7 — Run Quality Gate

Before saving, verify:
- [ ] Every theme cites at least 2 direct quotes from actual reviews
- [ ] Quotes are attributed to a source (G2, Capterra, Reddit, etc.)
- [ ] Frequency counts are included for all themes
- [ ] Messaging angles reference specific pain language, not generic claims
- [ ] If no reviews were found, the output states this explicitly instead of fabricating
- [ ] Themes with fewer than 2 quotes are flagged as "Weak signal"
- [ ] Total negative themes do not exceed 20
- [ ] Total positive themes do not exceed 12

## Output Format

Save the output to your project. Suggested filename: `{product-slug}-review-analysis.md`

```
# Review Analysis: [Product Name]
Date: [Date]
Sources: [G2, Capterra, Reddit, etc.]
Total reviews analyzed: [Count]
Rating distribution: [If available — e.g., "4.2/5 on G2 (423 reviews)"]

## Negative Themes

### Theme 1: [Theme Name] — [Frequency: X/Y reviews] — Severity: [Critical/Major/Minor]
**Quotes:**
- "[Exact quote]" — [Source, reviewer role if available]
- "[Exact quote]" — [Source]

**Messaging angle:** [How to use this in outreach]
**Opening line:** "[Example]"
**Deploy in:** [Cold email / LinkedIn / Sales call / Landing page]

[Repeat for each negative theme, ranked by frequency]

## Positive Themes

### Theme 1: [Theme Name] — [Frequency: X/Y reviews]
**Quotes:**
- "[Exact quote]" — [Source]
- "[Exact quote]" — [Source]

**Defensive implication:** [What this means for your positioning]

[Repeat for each positive theme]

## Frequency Summary

| Theme | Type | Mentions | % of Reviews | Severity |
|-------|------|----------|-------------|----------|
| ... | Neg/Pos | ... | ... | ... |

## Switching Signals
[Specific language reviewers use when describing why they switched TO or FROM this product]

## Key Takeaways
1. [Top insight — most exploitable weakness]
2. [Second insight]
3. [Third insight]
```

## Key Principles

1. **Direct quotes only.** Every theme must be grounded in actual review language. Paraphrasing loses the specificity that makes this useful. If you cannot find a direct quote, the theme does not exist.
2. **Frequency matters more than severity.** A minor annoyance mentioned in 40% of reviews is more useful for messaging than a critical bug mentioned once.
3. **Messaging angles must be deployable.** "Their support is bad" is an observation. "When a prospect mentions they're evaluating {product}, ask about their support experience during implementation" is deployable.
4. **Source everything.** Every quote needs a source attribution. Unsourced themes are unverifiable and therefore unusable.
5. **Competitor naming in outreach.** Messaging angles should reference the pain without naming the competitor directly. "If your current tool makes X difficult..." not "Unlike {competitor}..."

## Anti-Patterns

- **Do not fabricate review quotes.** If reviews are sparse, say so. A thin but honest analysis beats a fabricated comprehensive one.
- **Do not merge dissimilar complaints into one theme.** "Pricing is too high" and "pricing model is confusing" are different themes with different messaging angles.
- **Do not ignore positive reviews.** Understanding what competitors do well is essential for knowing where you cannot compete on the same terms.

## Chain Triggers

After completing, suggest:
- "Run **battlecard-generator** to build a sales battlecard using these review themes"
- "Run **cold-email-writer** to draft outreach that references the top pain themes"
- "Run **competitor-analysis** for a full competitive profile beyond just reviews"

---
description: Evaluate which GTM channels fit your ICP, ACV, and sales cycle. Use when someone asks "which channels should we use", "channel strategy", "where should we focus outreach", "channel prioritization", or "GTM channel mix"
tools: Read, Write
---

# Channel Fit Scorer

Evaluate which go-to-market channels fit a specific ICP, ACV, and sales cycle. Not all channels work for all businesses. A $5K ACV product cannot afford field sales. A $500K ACV product cannot rely on PLG alone. This skill scores 8 channels across 4 dimensions and produces a ranked strategy with execution recommendations.

The output replaces gut-feel channel decisions with a structured, defensible scoring framework.

## Inputs

- **ICP description or docs/icp.md** (required) — who the buyer is, their industry, company size, and how they buy
- **ACV or deal size** (required) — average contract value drives channel economics
- **Sales cycle length** (required) — days or months from first touch to close
- **Team size and capabilities** (optional) — who will execute (affects capability scores)
- **Current channels in use** (optional) — what's already running and performing

If ICP description or ACV or sales cycle length are missing, ask for them before proceeding. Do not guess ACV.

## Steps

### Step 1 — Load Context

Check for and read these files if they exist:
- `docs/icp.md` — ICP details, buyer personas, firmographics
- `docs/gtm-triangle.md` — positioning, messaging, channel assumptions
- `docs/gtm-diagnostic.md` — current GTM assessment and gaps
- `CLAUDE.md` — project context

Extract: ICP firmographics, buyer personas, ACV, sales cycle, current team composition, and any channel performance data already captured.

### Step 2 — Assess 8 Channels Across 4 Dimensions

Evaluate each of these 8 channels:

1. **Outbound email** — cold email sequences to targeted prospects
2. **LinkedIn outbound** — connection requests, DMs, and InMail campaigns
3. **Cold calling** — phone-based outreach to prospects
4. **Content/inbound** — blog, SEO, social content that attracts inbound leads
5. **Paid ads** — Google Ads, LinkedIn Ads, Meta Ads, programmatic
6. **Partnerships** — channel partners, referral programs, co-selling
7. **Events** — conferences, webinars, roundtables, field events
8. **PLG/product-led** — free trials, freemium, self-serve onboarding

Score each channel on 4 dimensions using 1-5 anchored rubrics:

**Dimension 1: ICP Reach** — Can you find and access your buyers through this channel?
- 5: Buyers are highly concentrated and identifiable here
- 4: Most buyers are reachable with moderate targeting effort
- 3: Buyers are present but mixed with non-ICP noise
- 2: Some buyers reachable, but low density
- 1: Buyers are not active or findable on this channel

**Dimension 2: Cost Efficiency** — Is CAC reasonable relative to ACV?
- 5: CAC is under 10% of first-year ACV
- 4: CAC is 10-20% of first-year ACV
- 3: CAC is 20-35% of first-year ACV
- 2: CAC is 35-50% of first-year ACV
- 1: CAC exceeds 50% of first-year ACV

**Dimension 3: Sales Cycle Fit** — Does the channel's timeline match your buying cycle?
- 5: Channel naturally aligns with cycle length and buyer behavior
- 4: Minor timing adjustments needed
- 3: Workable but requires nurture or acceleration tactics
- 2: Significant mismatch requiring heavy adaptation
- 1: Channel timeline fundamentally incompatible with sales cycle

**Dimension 4: Team Capability** — Can the current team execute this channel well?
- 5: Team has proven expertise and active execution experience
- 4: Team has the skills, needs minor ramp-up
- 3: Team could learn, requires 1-2 months of ramp
- 2: Significant skill gap, requires hire or outsourcing
- 1: No capability, would need to build from zero

### Step 3 — Calculate Composite Scores and Rank

For each channel:
- **Composite score** = (ICP Reach x 0.30) + (Cost Efficiency x 0.25) + (Sales Cycle Fit x 0.25) + (Team Capability x 0.20)
- Weights reflect that reach and economics matter most, but execution ability is the reality check

Rank channels by composite score. Identify natural tiers:
- **Tier 1** (score 4.0+): Primary channels, invest heavily
- **Tier 2** (score 3.0-3.9): Secondary channels, test and validate
- **Tier 3** (score below 3.0): Deprioritize or defer

### Step 4 — Build Effort/Impact Matrix

Classify each channel into one of four quadrants:
- **High Impact / Low Effort** — do these first
- **High Impact / High Effort** — invest strategically
- **Low Impact / Low Effort** — quick wins if bandwidth allows
- **Low Impact / High Effort** — avoid

Effort factors: setup time, ongoing time commitment, tooling cost, hiring needs.
Impact factors: expected pipeline contribution, deal quality, speed to results.

### Step 5 — Develop Top 3 Execution Plans

For the top 3 channels, provide:
- **Why this channel fits** — 2-3 sentences connecting to ICP, ACV, and cycle
- **Quick-start actions** — what to do in the first 2 weeks
- **Key metrics to track** — 3-4 leading indicators
- **Expected ramp time** — when to expect measurable results
- **Common pitfalls** — 2-3 mistakes to avoid on this channel
- **Resource requirements** — people, tools, budget needed

### Step 6 — Run Quality Gate

Before saving, verify:
- [ ] All 8 channels scored across all 4 dimensions with justifications
- [ ] Scores use the anchored rubrics, not arbitrary numbers
- [ ] Top 3 channels have complete execution plans
- [ ] Effort/impact classification is consistent with scores
- [ ] ACV-to-CAC math is referenced in cost efficiency scores
- [ ] No channel is recommended without a team capability path

## Output Format

Save to `docs/channel-strategy.md`:

```
# Channel Strategy: [Company/Product Name]
Date: [Date]

## Context
- **ICP:** [Summary]
- **ACV:** [Amount]
- **Sales Cycle:** [Length]
- **Team:** [Size and composition]

## Channel Scoring Matrix

| Channel | ICP Reach (30%) | Cost Efficiency (25%) | Cycle Fit (25%) | Team Capability (20%) | Composite | Tier |
|---------|----------------|----------------------|-----------------|----------------------|-----------|------|
| ... | ... | ... | ... | ... | ... | ... |

## Scoring Justifications
### [Channel Name]
- ICP Reach ([score]): [Why]
- Cost Efficiency ([score]): [Why]
- Sales Cycle Fit ([score]): [Why]
- Team Capability ([score]): [Why]

[Repeat for all 8 channels]

## Effort/Impact Matrix

### High Impact / Low Effort (Do First)
- [Channel]: [Why]

### High Impact / High Effort (Invest Strategically)
- [Channel]: [Why]

### Low Impact / Low Effort (Opportunistic)
- [Channel]: [Why]

### Low Impact / High Effort (Avoid)
- [Channel]: [Why]

## Top 3 Channel Execution Plans

### 1. [Channel Name] — Primary
- **Why it fits:** ...
- **Quick-start (Week 1-2):** ...
- **Key metrics:** ...
- **Expected ramp:** ...
- **Pitfalls to avoid:** ...
- **Resources needed:** ...

### 2. [Channel Name] — Secondary
[Same structure]

### 3. [Channel Name] — Tertiary
[Same structure]

## Channels to Deprioritize
[Which channels scored low and why they should be deferred]
```

## Key Principles

1. **ACV dictates channel economics.** A channel that works at $100K ACV may be financially impossible at $5K ACV. Always do the CAC math.
2. **Capability is a constraint, not a permanent state.** Score current capability honestly, but note where a hire or 90-day ramp could change the score.
3. **Channel stacking beats channel hopping.** Recommend layering 2-3 channels that reinforce each other rather than spreading thin across 5+.
4. **Time-to-results varies dramatically.** Content/inbound takes 6-12 months. Outbound email can produce meetings in 2 weeks. Factor this into recommendations.
5. **Score the channel for this specific business.** "LinkedIn works for B2B" is not analysis. Score based on whether this ICP's buyers are active and reachable on LinkedIn.

## Anti-Patterns

- **Do not recommend channels based on popularity.** "Everyone does content marketing" is not a scoring justification.
- **Do not give all channels similar scores.** If everything scores 3-4, the analysis is too generous. Force differentiation.
- **Do not ignore the "do nothing" baseline.** If current channels are working, the bar for adding new ones is higher.

## Chain Triggers

After completing, suggest:
- "Run **abm-campaign-planner** to design campaigns for your top-scored channels"
- "Run **launch-strategy** to sequence your channel rollout"
- If outbound channels scored highest: "Run **write-outbound-sequence** to build messaging for outbound"
- If content/inbound scored highest: "Run **write-linkedin-post** to start building inbound presence"

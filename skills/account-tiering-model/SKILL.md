---
name: account-tiering-model
description: Design a Tier 1/2/3 account prioritization model with scoring rubrics and resource allocation. Use when someone says "account tiering", "tier accounts", "prioritize accounts", "account scoring", "which accounts to focus on", or "ABM tiers"
allowed-tools: Read, Write
metadata:
  author: Achille Morin-Lemoine
  version: "1.0.0"
---

# Account Tiering Model

Design a structured Tier 1/2/3 account prioritization model that tells your team exactly which accounts to pursue aggressively, which to nurture, and which to handle opportunistically. Without tiering, every account gets the same effort, which means your best opportunities get under-invested and your worst opportunities get over-invested.

This model scores accounts across three dimensions: ICP Fit, Signal Strength, and Deal Potential. Each dimension gets a 1-5 anchored rubric so scoring is consistent across reps and over time. Then it defines resource allocation per tier so the team knows exactly how much effort to invest.

## Inputs

- **ICP definition** (required) -- firmographic and qualifying criteria from your GTM Triangle or ICP model
- **Signal framework** (optional) -- what buying signals you track and how you weight them
- **Historical deal data** (optional) -- win rates, deal sizes, and sales cycles by segment
- **Current account list** (optional) -- accounts to score as examples
- **Team capacity** (optional) -- number of reps, hours available, tools in use

If ICP definition is missing, ask: "I need your ICP criteria to build the tiering model. Do you have docs/icp.md or docs/gtm-triangle.md, or should we define ICP criteria first?"

## Steps

### Step 0 -- Check for Existing Output

Search the project for any existing output from a previous run of this skill (check common locations like `docs/`, the project root, or any organized output directory). If a previous version is found, present a summary and ask: "An account tiering model already exists with [current tier thresholds]. Do you want me to (a) recalibrate the scoring, (b) update resource allocation, or (c) rebuild from scratch?" 

### Step 1 -- Load Context

Search the project for any available context. Look in the project root, `docs/`, or any organized directory. Read what you find:

1. gtm triangle.md documents or ICP document -- ICP criteria and tier definitions
2. intent signals.md documents or signal framework -- what signals matter
3. **Persona profiles** -- who you're selling to (affects deal potential estimates)
4. `CLAUDE.md` -- project-level instructions
5. Any historical data on win rates, deal sizes, or sales cycles

### Step 2 -- Define Dimension 1: ICP Fit (1-5)

Build an anchored scoring rubric for firmographic and qualifying match:

| Score | Label | Criteria |
|-------|-------|----------|
| 5 | Perfect fit | Matches all Tier 1 ICP criteria. Right industry, right size, right stage, right pain. |
| 4 | Strong fit | Matches most Tier 1 criteria or all Tier 2 criteria. One minor gap. |
| 3 | Moderate fit | Matches Tier 2 criteria with some gaps. Could be a good customer but not ideal. |
| 2 | Weak fit | Matches some criteria but significant gaps. Would require adaptation to serve well. |
| 1 | Poor fit | Does not match ICP. Would be a stretch to serve effectively. |

For each score level, define specific, observable criteria based on the actual ICP. Replace generic labels with firmographic details:
- Industry verticals that qualify
- Headcount or revenue ranges per score
- Technology stack indicators
- Business model requirements
- Disqualifiers that cap the score regardless of other factors

### Step 3 -- Define Dimension 2: Signal Strength (1-5)

Build an anchored scoring rubric for buying signals detected:

| Score | Label | Criteria |
|-------|-------|----------|
| 5 | Active buying | Multiple high-intent signals: job posting for relevant role, technology evaluation, budget allocated, RFP issued |
| 4 | High intent | 2+ intent signals: content engagement, competitor evaluation, relevant hiring |
| 3 | Moderate intent | 1 clear signal or multiple weak signals: website visits, content downloads, event attendance |
| 2 | Low intent | Minimal signals: passive engagement, old activity, single touchpoint |
| 1 | No signal | No detectable buying intent |

For each score level, define which specific signals count and how they combine:
- List the signals you can actually track (don't score what you can't observe)
- Define signal decay (how old can a signal be before it loses value?)
- Define compound signals (which combinations increase the score?)

### Step 4 -- Define Dimension 3: Deal Potential (1-5)

Build an anchored scoring rubric for estimated value and probability:

| Score | Label | Criteria |
|-------|-------|----------|
| 5 | High value, high probability | Estimated ACV in top quartile + win probability >50% (based on similar deals won) |
| 4 | High value or high probability | Large deal with moderate probability, or moderate deal with high probability |
| 3 | Medium | Average ACV and average win probability |
| 2 | Low value or low probability | Below-average deal size or significant barriers to closing |
| 1 | Marginal | Minimal deal value or very low win probability |

For each score level, define:
- ACV ranges per score (calibrated to your actual deal sizes)
- Win probability anchors (what makes a deal likely vs. unlikely?)
- Sales cycle length expectations per score
- Common deal accelerators and blockers

### Step 5 -- Set Tier Thresholds

Define composite score ranges for each tier:

**Composite Score = ICP Fit + Signal Strength + Deal Potential** (range: 3-15)

| Tier | Score Range | Description |
|------|-----------|-------------|
| Tier 1 | 12-15 | Top accounts. Dedicated 1:1 engagement. These get whatever resources they need. |
| Tier 2 | 8-11 | Strong accounts. Structured engagement with semi-personalized outreach. |
| Tier 3 | 4-7 | Opportunistic. Light-touch, scalable engagement. Worth pursuing if they come inbound. |
| Below threshold | 3 | Do not pursue. Disqualified or not worth the effort. |

Validate thresholds against reality:
- If every known good account scores Tier 1, the model is too generous
- If none do, the model is too strict
- Aim for roughly 10-15% Tier 1, 25-35% Tier 2, rest Tier 3

### Step 6 -- Define Resource Allocation Per Tier

For each tier, specify:

**Tier 1 Resource Plan:**
- Touches per month: [Number]
- Channel mix: [Which channels, in what proportion]
- Content type: [Fully custom, semi-custom, or templated]
- Sales involvement: [Dedicated AE, shared AE, or SDR only]
- Research investment: [Custom account research, pain point mapping, champion identification]
- Executive involvement: [When to involve leadership]

**Tier 2 Resource Plan:**
- Touches per month: [Number]
- Channel mix: [Channels]
- Content type: [Level of customization]
- Sales involvement: [Coverage model]
- Research investment: [Level of account research]

**Tier 3 Resource Plan:**
- Touches per month: [Number]
- Channel mix: [Channels]
- Content type: [Templated with persona-level personalization]
- Sales involvement: [SDR or automated]
- Escalation criteria: [What moves a Tier 3 to Tier 2]

### Step 7 -- Define Tier Movement Rules

Accounts don't stay in one tier forever. Define what triggers re-tiering:

**Upgrade triggers** (Tier 3 to 2, or Tier 2 to 1):
- New high-intent signal detected
- Champion identified and engaged
- Budget cycle approaching
- Competitive displacement opportunity

**Downgrade triggers** (Tier 1 to 2, or Tier 2 to 3):
- No response after X touches
- Key champion leaves the company
- Budget cut or hiring freeze announced
- Deal lost or postponed

**Review cadence:** How often are accounts re-scored? (Monthly recommended for Tier 1, quarterly for Tier 2/3)

### Step 8 -- Quality Gate

Run these checks before saving:

- [ ] All three dimensions have anchored rubrics with specific, observable criteria at each score level
- [ ] Tier thresholds produce a reasonable distribution (not 80% Tier 1 or 80% Tier 3)
- [ ] Resource allocation per tier is specific enough for a rep to follow without asking questions
- [ ] Tier movement rules define both upgrade and downgrade triggers
- [ ] Scoring criteria reference only signals and data you can actually observe and track
- [ ] ACV ranges and win probabilities in Deal Potential are calibrated to real data (or explicitly flagged as estimates)
- [ ] The model is simple enough to use weekly without a spreadsheet taking 30 minutes

If any check fails, fix it before proceeding.

## Output Format

Save the output to your project. Suggested filename: `account-tiering-model.md`

```markdown
# Account Tiering Model
Date: [Date]

## Overview
[2-3 sentences: what this model is, how to use it, and how often to re-score]

## Scoring Dimensions

### Dimension 1: ICP Fit (1-5)
| Score | Label | Criteria |
|-------|-------|----------|
| 5 | [Label] | [Specific criteria] |
| 4 | [Label] | [Specific criteria] |
| 3 | [Label] | [Specific criteria] |
| 2 | [Label] | [Specific criteria] |
| 1 | [Label] | [Specific criteria] |

**Automatic disqualifiers:** [Criteria that cap this score at 1 regardless]

### Dimension 2: Signal Strength (1-5)
| Score | Label | Criteria |
|-------|-------|----------|
| 5 | [Label] | [Specific signals] |
| 4 | [Label] | [Specific signals] |
| 3 | [Label] | [Specific signals] |
| 2 | [Label] | [Specific signals] |
| 1 | [Label] | [Specific signals] |

**Signal decay:** [How old signals lose value]

### Dimension 3: Deal Potential (1-5)
| Score | Label | Criteria |
|-------|-------|----------|
| 5 | [Label] | [ACV range + win probability] |
| 4 | [Label] | [ACV range + win probability] |
| 3 | [Label] | [ACV range + win probability] |
| 2 | [Label] | [ACV range + win probability] |
| 1 | [Label] | [ACV range + win probability] |

## Tier Definitions

| Tier | Score Range | % of Accounts | Description |
|------|-----------|---------------|-------------|
| Tier 1 | 12-15 | ~10-15% | [Description] |
| Tier 2 | 8-11 | ~25-35% | [Description] |
| Tier 3 | 4-7 | ~50-60% | [Description] |
| DQ | 3 | Varies | [Description] |

## Resource Allocation

### Tier 1
- **Touches/month:** [Number]
- **Channel mix:** [Channels and proportion]
- **Content:** [Customization level]
- **Sales:** [Coverage model]
- **Research:** [Investment level]
- **Executive involvement:** [When]

### Tier 2
[Same structure]

### Tier 3
[Same structure]

## Tier Movement Rules

### Upgrade Triggers
- [Trigger 1]
- [Trigger 2]
- [Trigger 3]

### Downgrade Triggers
- [Trigger 1]
- [Trigger 2]
- [Trigger 3]

### Review Cadence
[How often each tier is re-scored]

## Example Scoring
| Account | ICP Fit | Signal | Deal Potential | Composite | Tier |
|---------|---------|--------|---------------|-----------|------|
| [Example 1] | [Score] | [Score] | [Score] | [Total] | [Tier] |
| [Example 2] | [Score] | [Score] | [Score] | [Total] | [Tier] |
| [Example 3] | [Score] | [Score] | [Score] | [Total] | [Tier] |
```

## Key Principles

1. **Tiering is about resource allocation, not account quality.** Even a great account is Tier 3 if there are no buying signals. Tiering tells you where to invest effort now.
2. **Anchored rubrics prevent score inflation.** Without specific criteria at each level, every rep scores their accounts as 4s and 5s. Anchoring keeps scoring honest.
3. **Simple beats comprehensive.** A model with 10 scoring dimensions that nobody uses is worse than a 3-dimension model used consistently every week.
4. **Tiers are dynamic.** An account sitting in Tier 3 for a year might suddenly spike to Tier 1 when a champion changes jobs. Re-score regularly.
5. **Resource allocation is the whole point.** If the model doesn't change how reps spend their time, it's just an exercise.

## Anti-Patterns

- **Tiering by gut feel:** "I think they're a good account" is not a tier. Every tier placement must be justified by scores across all three dimensions.
- **Static tiers:** Scoring accounts once and never updating. Markets change, signals appear and decay, champions move. Re-score on cadence.
- **Over-complicated models:** Adding dimensions for company culture, logo value, or strategic importance. Keep it to three dimensions that can be scored objectively.

## What to Do Next

- Build a **prospect list** using this model to prioritize: `/skill build-prospect-list`
- Design an **ABM campaign** with tier-specific plays: `/skill abm-campaign-planner`
- Plan **territory coverage** based on tier distribution: `/skill territory-planner`

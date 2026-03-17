---
description: Build a pipeline forecast with stage-weighted projections and risk flags. Use when someone says "forecast", "pipeline forecast", "revenue forecast", "deal forecast", "predict revenue", "forecast model", or "pipeline analysis"
tools: Read, Write
---

# Forecast Model

Build a pipeline forecast using stage-weighted probabilities, velocity analysis, and confidence intervals. The output gives you best case, likely case, and worst case projections, plus flags on at-risk deals.

Forecasting isn't about predicting the future. It's about making the uncertainty visible. A forecast that says "$500K" is less useful than one that says "$400K-$600K with $200K at risk from three single-threaded deals."

## Inputs

- **Pipeline data** (required) -- deals by stage, amount, close date, and last activity date
- **Historical conversion rates** (optional) -- stage-to-stage win rates from past quarters
- **Sales process** (optional) -- stage definitions and expected durations
- **Forecast period** (required) -- quarter or month being forecasted
- **Commit categories** (optional) -- existing deal classifications

If pipeline data is missing, ask: "I need your current pipeline by stage. For each deal: name, stage, amount, expected close date, and date of last activity."

## Steps

### Step 0 -- Check for Existing Output

Read `docs/analytics/forecast-model.md` if it exists. If found, present a summary and ask: "A forecast model exists for {period}. Do you want me to (a) refresh with new pipeline data, (b) update conversion rates, or (c) rebuild from scratch?"

### Step 1 -- Load Context

Read all available context:

1. `docs/ops/sales-process.md` -- stage definitions and probabilities
2. `docs/ops/territory-plan.md` -- quota context
3. `docs/analytics/` -- historical data if available
4. `CLAUDE.md` -- project-level instructions

### Step 2 -- Define Stage Conversion Rates

Set probability for each stage based on historical data or benchmarks:

| Stage | Historical Win Rate | Stage Probability |
|-------|-------------------|------------------|
| Qualified | 10-15% | 10% |
| Discovery | 15-25% | 20% |
| Evaluation | 25-40% | 35% |
| Proposal | 40-60% | 50% |
| Negotiation | 60-80% | 75% |
| Verbal Commit | 80-95% | 90% |

If historical data exists, use it. If not, use industry benchmarks and flag them as estimates to calibrate next quarter.

### Step 3 -- Calculate Stage-Weighted Pipeline

For each deal: weighted value = deal amount x stage probability.

Sum weighted values for total stage-weighted forecast.

| Deal | Stage | Amount | Probability | Weighted Value |
|------|-------|--------|------------|----------------|

**Total pipeline:** ${Amount}
**Stage-weighted forecast:** ${Amount}

### Step 4 -- Analyze Velocity by Segment

Calculate average velocity metrics:

- **Average days in stage:** How long deals spend at each stage (flag outliers)
- **Average cycle length:** Total days from Qualified to Closed Won
- **Velocity by segment:** Break down by deal size, industry, or source

Flag deals that are significantly slower than average. Slow deals are at higher risk of stalling or losing.

### Step 5 -- Build Confidence Intervals

Create three scenarios:

**Best Case:** Stage-weighted forecast + upside from deals likely to accelerate
- Include deals with strong champion engagement
- Include deals where buyer has confirmed timeline
- Apply 1.2x multiplier to high-velocity deals

**Likely Case:** Stage-weighted forecast with standard adjustments
- Remove deals past their expected close date by 30+ days
- Apply 0.8x multiplier to single-threaded deals
- This is your commit number

**Worst Case:** Stage-weighted forecast with downside risks realized
- Remove all deals with no activity in 14+ days
- Remove deals past expected close date
- Apply 0.5x multiplier to deals with unknown decision criteria

| Scenario | Amount | Assumptions |
|----------|--------|-------------|
| Best Case | ${Amount} | {Key assumptions} |
| Likely Case | ${Amount} | {Key assumptions} |
| Worst Case | ${Amount} | {Key assumptions} |

### Step 6 -- Flag Risk Areas

Identify at-risk deals based on:

- **No activity:** No logged activity in 14+ days
- **Past due close date:** Expected close date has passed
- **Single-threaded:** Only one contact engaged at the account
- **No next step:** No scheduled follow-up or meeting
- **Stalled stage:** In same stage longer than 1.5x average duration

For each flagged deal, recommend a specific action (re-engage, executive sponsor call, downgrade stage, or close lost).

### Step 7 -- Quality Gate

- [ ] Stage probabilities are based on data (or flagged as estimates)
- [ ] Every deal is weighted, not just the big ones
- [ ] Three scenarios (best/likely/worst) are calculated with clear assumptions
- [ ] At-risk deals are flagged with specific criteria, not gut feel
- [ ] Each flagged deal has a recommended action
- [ ] Velocity analysis identifies outlier deals
- [ ] Forecast period is clearly stated

If any check fails, fix it before proceeding.

## Output Format

Save to `docs/analytics/forecast-model.md`:

```markdown
# Pipeline Forecast: {Period}
Date: {Date}
Total Pipeline: ${Amount}
Stage-Weighted Forecast: ${Amount}

## Confidence Intervals
| Scenario | Amount | vs. Quota | Key Assumptions |
|----------|--------|-----------|-----------------|
| Best Case | ${Amount} | {%} | {Assumptions} |
| Likely Case | ${Amount} | {%} | {Assumptions} |
| Worst Case | ${Amount} | {%} | {Assumptions} |

## Stage-Weighted Pipeline
| Stage | # Deals | Total Value | Probability | Weighted Value |
|-------|---------|------------|------------|----------------|

## At-Risk Deals
| Deal | Stage | Amount | Risk Flag | Days Since Activity | Recommended Action |
|------|-------|--------|-----------|--------------------|--------------------|

## Velocity Analysis
| Stage | Avg Days | Median Days | Outlier Threshold |
|-------|----------|------------|-------------------|

## Deal Detail
| Deal | Stage | Amount | Close Date | Weighted | Activity | Thread Count | Risk |
|------|-------|--------|-----------|----------|----------|-------------|------|

## Assumptions and Calibration Notes
- {Assumption 1}
- {Assumption 2}
- {Areas to calibrate next quarter}
```

## Key Principles

1. **Make uncertainty visible.** A single number forecast creates false precision. Three scenarios with stated assumptions let leadership make informed decisions.
2. **Activity data is the best predictor.** Deals with no recent activity are dying, regardless of what the rep says. Weight activity heavily in risk assessment.
3. **Historical conversion rates beat gut feel.** If your Discovery-to-Evaluation rate is 40% historically, use 40%. Don't let optimism inflate the forecast.
4. **Flag risk, don't hide it.** A forecast that hides at-risk deals is worse than no forecast. Leadership needs to see where deals might fall out.
5. **Calibrate every quarter.** Compare forecast to actuals and adjust your stage probabilities. The model gets better over time only if you feed it real data.

## Anti-Patterns

- **Sandbagging:** Reps deliberately under-forecast to "beat expectations." This makes planning impossible. Fix with deal-level inspection, not pressure.
- **Happy ears:** Reps over-forecast based on what the prospect said, not what they did. Activity data is the antidote.
- **Ignoring close date hygiene:** Accepting deals with close dates pushed 4 times. If the date keeps moving, the deal isn't real. Downgrade or close it.

## What to Do Next

- Design the **sales process** that generates this pipeline: `/skill sales-process-designer`
- Model **capacity** needed to fill the pipeline: `/skill capacity-planner`
- Run a **pipeline review** using this forecast: `/skill weekly-ritual-designer`

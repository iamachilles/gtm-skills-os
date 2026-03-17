---
description: Analyze customer cohorts for retention, LTV, and patterns. Use when someone says "cohort analysis", "customer cohorts", "retention analysis", "LTV analysis", "cohort retention", "customer segments", or "acquisition cohorts"
tools: Read, Write
---

# Cohort Analyzer

Analyze customer cohorts by acquisition period to reveal retention curves, LTV differences, and CAC/LTV ratios. The goal is to find which cohorts perform best and understand what they have in common so you can acquire more like them.

## Inputs

- **Customer data** (required) -- customers with acquisition date, revenue over time, segment info
- **Cohort definition** (required) -- how to group (monthly, quarterly, by channel, by segment)
- **Time horizon** (optional) -- how far back to analyze (default: 12 months)
- **Cost data** (optional) -- acquisition cost per cohort for CAC/LTV analysis

If customer data or cohort definition is missing, ask: "I need customer data with acquisition dates and revenue over time. How should I group the cohorts (monthly, quarterly, by channel)?"

## Steps

### Step 0 -- Check for Existing Output

Read `docs/analytics/cohort-analysis.md` if it exists. If found, present a summary and ask: "A cohort analysis already exists. Do you want me to (a) update with new data, (b) analyze different cohorts, or (c) keep it?"

### Step 1 -- Load Context

Read all available context:

1. `docs/analytics/*.md` -- existing analytics
2. `docs/gtm-triangle.md` -- ICP and segment context
3. `CLAUDE.md` -- project-level instructions

### Step 2 -- Segment by Acquisition Cohort

Group customers by acquisition period:

| Cohort | Customers Acquired | Avg. Initial Deal Size | Channel Mix |
|--------|-------------------|----------------------|------------|
| {Q1 2025} | {N} | ${N} | {breakdown} |
| {Q2 2025} | {N} | ${N} | {breakdown} |
| {rows} |

### Step 3 -- Calculate Retention Curve

For each cohort, track retention over time:

| Cohort | Month 1 | Month 3 | Month 6 | Month 9 | Month 12 |
|--------|---------|---------|---------|---------|----------|
| {Q1} | 100% | {%} | {%} | {%} | {%} |
| {Q2} | 100% | {%} | {%} | {%} | {%} |

Identify:
- Which cohort has the best retention at 6 months?
- Which cohort has the worst early churn (month 1-3)?
- Is retention improving or declining over time (newer vs. older cohorts)?

### Step 4 -- Compute LTV Per Cohort

For each cohort, calculate:

| Cohort | Total Revenue | Customers | Avg. LTV | Median LTV | LTV at 12m |
|--------|--------------|-----------|----------|-----------|-----------|
| {rows} |

LTV calculation:
- **Simple:** Average revenue per customer over their lifetime to date
- **Projected:** If retention curve is stable, project future revenue based on current retention rate

### Step 5 -- Analyze CAC/LTV Ratio

If cost data is available:

| Cohort | CAC | LTV (12m) | CAC/LTV Ratio | Payback Period |
|--------|-----|-----------|---------------|---------------|
| {rows} |

Benchmarks:
- **Healthy:** CAC/LTV ratio below 1:3 (LTV is 3x+ CAC)
- **Acceptable:** 1:2 to 1:3
- **Unhealthy:** Below 1:2 (spending too much to acquire customers who don't stay)

### Step 6 -- Identify Best and Worst Cohorts

**Best cohort:** {Which cohort} because {specific metrics}
- What they have in common: {ICP fit, channel, deal size, use case}

**Worst cohort:** {Which cohort} because {specific metrics}
- What they have in common: {characteristics}

### Step 7 -- Surface Patterns

Answer these questions:
- Are newer cohorts better or worse than older ones? (Is the business improving?)
- Does acquisition channel predict retention? (Inbound vs. outbound vs. referral)
- Does initial deal size predict LTV? (Do bigger deals stick longer?)
- Does ICP fit predict retention? (Are you selling to the right people?)
- Is there a "magic number" (a usage milestone or behavior that predicts long-term retention)?

### Step 8 -- Quality Gate

- [ ] Cohorts are clearly defined and consistently grouped
- [ ] Retention curves are calculated for at least 3 cohorts
- [ ] LTV is computed per cohort
- [ ] CAC/LTV ratio is calculated (if cost data available)
- [ ] Best and worst cohorts are identified with reasons
- [ ] Patterns are surfaced with specific observations
- [ ] No em dashes in any copy

## Output Format

Save to `docs/analytics/cohort-analysis.md`:

```markdown
# Cohort Analysis

Date: {Date}
Period: {Time range analyzed}
Cohort definition: {How cohorts are grouped}

## Summary
{2-3 sentences: key finding, best cohort, primary pattern}

## Cohort Overview
| Cohort | Acquired | Avg. Deal Size | Channel |
|--------|----------|---------------|---------|
| {rows} |

## Retention Curves
| Cohort | M1 | M3 | M6 | M9 | M12 |
|--------|----|----|----|----|-----|
| {rows} |

## LTV by Cohort
| Cohort | Avg. LTV | Median LTV | CAC | CAC/LTV |
|--------|----------|-----------|-----|---------|
| {rows} |

## Best Cohort: {Name}
- **Performance:** {key metrics}
- **Common characteristics:** {what they share}
- **Implication:** {what to do with this insight}

## Worst Cohort: {Name}
- **Performance:** {key metrics}
- **Common characteristics:** {what they share}
- **Implication:** {what to change}

## Patterns
{Answers to pattern questions with supporting data}

## Recommendations
1. {Acquire more customers like best cohort by...}
2. {Fix retention for worst cohort by... or stop targeting them}
3. {Structural change based on trend data}
```

## Key Principles

1. **Cohorts reveal what averages hide.** An "average" retention rate of 85% might mask one cohort at 95% and another at 70%. The action is different for each.
2. **The best cohort tells you who to target.** If Q2 customers from inbound content have 2x the LTV of Q3 customers from outbound, that's a targeting decision, not just a data point.
3. **CAC/LTV ratio is the ultimate health metric.** If you're spending $5K to acquire customers worth $3K, growing faster just means losing money faster.
4. **Retention is the leading indicator of LTV.** Fix retention before optimizing acquisition. Acquiring more customers who churn at month 3 is not growth.

## Anti-Patterns

- **Averaging across cohorts.** Reporting a single company-wide retention rate. This tells you nothing about trends or segments. Always break it down.
- **Ignoring payback period.** A 1:5 CAC/LTV ratio sounds great until you realize the payback period is 18 months and you're burning cash the whole time.
- **Short time horizons.** Analyzing cohorts with only 2 months of data. Retention patterns often don't emerge until month 6+. Be patient with the data.

## What to Do Next

- Audit the **conversion funnel** feeding these cohorts: `/skill conversion-funnel-auditor`
- Analyze **campaign performance** by cohort source: `/skill campaign-analyzer`
- Design **experiments** to improve worst cohort retention: `/skill experiment-designer`

---
description: Build an ROI model with payback period, 3-year projections, and sensitivity analysis. Trigger phrases — "ROI model", "ROI calculator", "calculate ROI", "business case", "payback period", "cost justification", "total cost of ownership"
tools: Read, Write
---

# ROI Calculator

Build a presentation-ready ROI model that quantifies the financial impact of your solution. Includes total investment, expected returns, payback period, 3-year projections, and sensitivity analysis across conservative, moderate, and aggressive scenarios.

The purpose of an ROI model is not to produce a big number. It's to give the economic buyer confidence that the investment is justified. Conservative estimates that hold up to scrutiny beat inflated projections that get dismissed.

## Inputs

- **Solution cost** (required) -- license/service fees, implementation cost, ongoing costs
- **Expected outcomes** (required) -- time saved, revenue gained, cost avoided, or other quantifiable benefits
- **Prospect context** (optional) -- company size, current spend, team size affected
- **Comparison baseline** (optional) -- what they're doing today and what it costs
- **Time horizon** (optional) -- default is 3 years

If solution cost or expected outcomes are missing, ask: "I need the total solution cost (including implementation) and the expected outcomes we're projecting. What numbers do we have?"

## Steps

### Step 0 -- Check for Existing Output

Read `docs/sales/roi-model-{prospect-slug}.md` if it exists. If found, present a summary and ask: "An ROI model for {prospect} already exists. Do you want me to (a) update the numbers, or (b) rebuild from scratch?"

### Step 1 -- Load Context

Read available context files:

1. `docs/icp.md` -- typical customer profile for benchmarking
2. `docs/gtm-triangle.md` -- value proposition context
3. `docs/case-studies/` -- proof points with real ROI data
4. `CLAUDE.md` -- project-level instructions

### Step 2 -- Define Total Investment

Calculate the complete cost of ownership:
- **Year 0 costs:** Implementation, onboarding, training, migration
- **Annual recurring costs:** License/subscription, support, maintenance
- **Hidden costs:** Internal team time for adoption, process change effort
- **3-year total:** Sum of all costs across the time horizon

Be thorough. An ROI model that omits costs gets challenged and loses credibility.

### Step 3 -- Define Returns

Quantify each benefit category:

- **Time saved:** Hours saved x hourly cost of affected employees x number of employees
- **Revenue gained:** Pipeline increase, conversion improvement, deal size expansion, faster cycle
- **Cost avoided:** Reduced headcount needs, tool consolidation, error reduction, compliance risk
- **Efficiency gains:** Throughput improvement, reduced rework, faster onboarding

For each return, document:
- The assumption behind the number
- The formula used to calculate it
- Whether the data comes from the prospect, industry benchmarks, or your case studies

### Step 4 -- Calculate Core Metrics

Compute:
- **Total 3-year investment:** Sum of all costs
- **Total 3-year return:** Sum of all benefits
- **Net ROI:** (Total Return - Total Investment) / Total Investment x 100
- **Payback period:** Month in which cumulative returns exceed cumulative costs
- **Annual ROI:** Year-by-year breakdown (Year 1 is typically lower due to implementation costs)

### Step 5 -- Build Sensitivity Analysis

Create three scenarios:

- **Conservative (70% of projected returns):** Assumes slower adoption, partial outcomes, longer ramp
- **Moderate (100% of projected returns):** Base case with stated assumptions
- **Aggressive (130% of projected returns):** Assumes faster adoption and compounding effects

For each scenario, recalculate: total return, net ROI, payback period.

The conservative scenario is the one that matters most. If ROI is positive even in the conservative case, the business case is strong.

### Step 6 -- Create Executive Summary

Write a 3-sentence summary that a CFO can scan:
1. Total investment over 3 years
2. Expected return (use the moderate scenario)
3. Payback period

### Step 7 -- Quality Gate

Before saving, verify:

- [ ] Every assumption is documented and labeled as "prospect data," "industry benchmark," or "case study reference"
- [ ] No returns are projected without a clear formula showing how they were calculated
- [ ] Conservative scenario still shows positive ROI (if not, flag it honestly)
- [ ] Implementation costs and hidden costs are included, not just license fees
- [ ] Payback period is calculated in months, not just stated
- [ ] Numbers are internally consistent (formulas check out)
- [ ] No fabricated benchmarks. If using industry data, cite the source.

If any check fails, fix it before proceeding.

## Output Format

Save to `docs/sales/roi-model-{prospect-slug}.md`:

```markdown
# ROI Model: {Prospect Company}
Date: {Date}
Time Horizon: {3 years}
Prepared for: {Contact Name, Title}

## Executive Summary
{3 sentences: total investment, expected return, payback period}

## Total Investment

| Cost Category | Year 1 | Year 2 | Year 3 | Total |
|--------------|--------|--------|--------|-------|
| Implementation | ${X} | -- | -- | ${X} |
| License/Subscription | ${X} | ${X} | ${X} | ${X} |
| Training/Onboarding | ${X} | -- | -- | ${X} |
| Internal Resources | ${X} | ${X/2} | -- | ${X} |
| **Total** | **${X}** | **${X}** | **${X}** | **${X}** |

## Projected Returns

| Benefit Category | Assumption | Year 1 | Year 2 | Year 3 | Total |
|-----------------|------------|--------|--------|--------|-------|
| {Time Saved} | {Formula + source} | ${X} | ${X} | ${X} | ${X} |
| {Revenue Gained} | {Formula + source} | ${X} | ${X} | ${X} | ${X} |
| {Cost Avoided} | {Formula + source} | ${X} | ${X} | ${X} | ${X} |
| **Total** | | **${X}** | **${X}** | **${X}** | **${X}** |

## ROI Summary

| Metric | Value |
|--------|-------|
| Total 3-Year Investment | ${X} |
| Total 3-Year Return | ${X} |
| Net ROI | {X}% |
| Payback Period | {X} months |

## Sensitivity Analysis

| Scenario | Assumptions | 3-Year Return | Net ROI | Payback |
|----------|------------|---------------|---------|---------|
| Conservative (70%) | {What changes} | ${X} | {X}% | {X} months |
| Moderate (100%) | Base case | ${X} | {X}% | {X} months |
| Aggressive (130%) | {What changes} | ${X} | {X}% | {X} months |

## Assumptions Log
1. {Assumption} -- Source: {Prospect data / Industry benchmark / Case study}
2. {Assumption} -- Source: {Citation}
3. {Assumption} -- Source: {Citation}

## Comparison: Current State vs. Proposed
| Dimension | Today | With Solution | Delta |
|-----------|-------|--------------|-------|
| {Metric} | {Current} | {Projected} | {Improvement} |
| {Metric} | {Current} | {Projected} | {Improvement} |
```

## Key Principles

1. **Conservative wins deals. Inflated kills them.** A CFO who catches one inflated number will dismiss the entire model. Underpromise, then overdeliver.
2. **Every number needs a formula.** "You'll save $500K" is a claim. "$85/hour x 20 hours/week x 48 weeks x 6 reps = $489,600" is a business case.
3. **Include all costs.** Omitting implementation or internal resource costs makes the model look naive. Sophisticated buyers will add them back anyway.
4. **The conservative scenario is the real pitch.** Present moderate as the base case, but make sure conservative still works. That's what gets approved.
5. **Payback period matters more than total ROI.** A 500% 3-year ROI with a 24-month payback is less compelling than a 200% ROI with a 4-month payback.

## Anti-Patterns

- **Do NOT fabricate industry benchmarks.** If you don't have data to support an assumption, label it clearly and suggest the prospect validate with their own numbers.
- **Do NOT ignore the cost of doing nothing.** The ROI model should make it clear that staying with the status quo has a quantifiable cost.

## What to Do Next

- Include this ROI model in a **proposal**: `/skill proposal-writer`
- Build a **champion enablement kit** with the ROI summary: `/skill champion-enablement-kit`
- Create a **mutual action plan** to move the deal forward: `/skill mutual-action-plan`

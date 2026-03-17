---
description: Audit a conversion funnel to find and fix drop-off points. Use when someone says "funnel audit", "conversion funnel", "funnel analysis", "drop-off analysis", "conversion rate", "funnel optimization", or "where are we losing people"
tools: Read, Write
---

# Conversion Funnel Auditor

Audit a conversion funnel to identify the biggest drop-off points, analyze them by segment, compare to benchmarks, and produce specific optimization recommendations. The goal is to find the one stage fix that has the biggest revenue impact.

## Inputs

- **Funnel data** (required) -- conversion numbers at each stage (visitors, leads, MQLs, SQLs, opportunities, closed-won)
- **Funnel definition** (required) -- what each stage means and the criteria for advancing
- **Segment data** (optional) -- conversion rates by channel, persona, or product
- **Benchmarks** (optional) -- industry benchmarks or historical performance

If funnel data is missing, ask: "I need the conversion numbers at each stage of your funnel. What does the funnel look like and what are the numbers?"

## Steps

### Step 0 -- Check for Existing Output

Read `docs/analytics/funnel-audit.md` if it exists. If found, present a summary and ask: "A funnel audit already exists. Do you want me to (a) update with new data, (b) audit a different funnel, or (c) keep it?"

### Step 1 -- Load Context

Read all available context:

1. `docs/analytics/*.md` -- prior audits and reports
2. `docs/analytics/dashboard-spec.md` -- current metrics
3. `CLAUDE.md` -- project-level instructions

### Step 2 -- Map Funnel Stages

| Stage | Count | Conversion to Next | Cumulative Conversion |
|-------|-------|-------------------|----------------------|
| {Top of funnel} | {N} | - | 100% |
| {Stage 2} | {N} | {%} | {%} |
| {Stage 3} | {N} | {%} | {%} |
| {Stage 4} | {N} | {%} | {%} |
| {Closed-Won} | {N} | {%} | {%} |

### Step 3 -- Identify Drop-Off Points

Rank stages by drop-off severity:

| Stage Transition | Drop-off Rate | Volume Lost | Revenue Impact |
|-----------------|---------------|-------------|---------------|
| {Stage A to B} | {%} | {N lost} | ${estimated} |
| {Stage B to C} | {%} | {N lost} | ${estimated} |

The biggest drop-off point is not always the worst. A 50% drop from 1000 to 500 leads matters more than a 50% drop from 10 to 5 opportunities. Weight by volume AND downstream value.

### Step 4 -- Analyze Drop-Off by Segment

For the top 2 drop-off points, break down by segment:

**Drop-off at {Stage}:**
| Segment | Conversion Rate | vs. Average | Volume |
|---------|----------------|-------------|--------|
| {rows} |

Look for:
- Segments that convert significantly better (what are they doing differently?)
- Segments that convert significantly worse (should they be in the funnel at all?)
- Channel-specific patterns (does outbound convert differently than inbound at this stage?)

### Step 5 -- Compare to Benchmarks

| Stage Transition | Your Rate | Benchmark | Gap |
|-----------------|-----------|-----------|-----|
| {rows} |

Benchmarks (B2B SaaS defaults if none provided):
- Website visitor to lead: 2-5%
- Lead to MQL: 15-30%
- MQL to SQL: 30-50%
- SQL to opportunity: 50-70%
- Opportunity to closed-won: 20-30%

Flag any stage where your rate is 50%+ below benchmark.

### Step 6 -- Produce Optimization Recommendations

For each major drop-off point, write 3 specific recommendations:

**Drop-off at {Stage}: {X}% conversion (benchmark: {Y}%)**

1. **{Recommendation 1}:** {Specific action}. Expected impact: {improvement estimate}. How to test: {method}.
2. **{Recommendation 2}:** {Specific action}. Expected impact: {improvement estimate}. How to test: {method}.
3. **{Recommendation 3}:** {Specific action}. Expected impact: {improvement estimate}. How to test: {method}.

Rules:
- Recommendations must be specific actions, not vague advice ("improve lead quality" is not a recommendation. "Add budget question to the lead form to filter out non-buyers" is.)
- Each recommendation needs an expected impact estimate
- Each recommendation needs a testing method

### Step 7 -- Quality Gate

- [ ] All funnel stages are mapped with conversion rates
- [ ] Drop-off points are ranked by revenue impact, not just percentage
- [ ] Top 2 drop-offs are analyzed by segment
- [ ] Benchmarks are compared (provided or default)
- [ ] 3 specific recommendations per major drop-off point
- [ ] Each recommendation has expected impact and testing method
- [ ] No em dashes in any copy

## Output Format

Save to `docs/analytics/funnel-audit.md`:

```markdown
# Conversion Funnel Audit

Date: {Date}

## Summary
{2-3 sentences: overall funnel health, biggest problem, recommended priority fix}

## Funnel Map
| Stage | Count | Stage Conversion | Cumulative |
|-------|-------|-----------------|-----------|
| {rows} |

## Drop-Off Analysis
### Biggest Drop-Off: {Stage Transition}
- **Rate:** {%} (benchmark: {%})
- **Volume lost:** {N}
- **Revenue impact:** ${estimated}

#### By Segment
| Segment | Rate | vs. Average |
|---------|------|-------------|
| {rows} |

#### Recommendations
1. {Specific action + expected impact + test method}
2. {Specific action + expected impact + test method}
3. {Specific action + expected impact + test method}

### Second Drop-Off: {Stage Transition}
{Same structure}

## Benchmark Comparison
| Stage | Your Rate | Benchmark | Status |
|-------|-----------|-----------|--------|
| {rows} |

## Priority Actions
1. {Highest-impact fix}
2. {Second-highest}
3. {Third}
```

## Key Principles

1. **Fix the biggest leak first.** A 5% improvement at a high-volume stage beats a 20% improvement at a low-volume stage. Prioritize by revenue impact, not conversion percentage.
2. **Segment reveals the cause.** Overall drop-off rates hide the "why." When you see that inbound leads convert at 40% but outbound at 5% at the same stage, the diagnosis becomes clear.
3. **Recommendations need specificity.** "Improve follow-up speed" is not actionable. "Respond to inbound leads within 5 minutes using auto-routing in HubSpot" is actionable.
4. **One fix at a time.** Changing three things simultaneously makes it impossible to know what worked. Sequence your optimizations.

## Anti-Patterns

- **Optimizing the bottom when the top is broken.** Improving close rate from 25% to 30% while only 10 deals enter the pipeline. Fix volume first if the pipeline is empty.
- **Treating all segments the same.** Applying the same fix to every segment when the problem is segment-specific. A channel that converts poorly might need to be cut, not optimized.
- **Ignoring stage definitions.** If "MQL" means different things to marketing and sales, your funnel data is meaningless. Align on definitions before auditing conversion rates.

## What to Do Next

- Design **A/B tests** for the recommended optimizations: `/skill ab-test-designer`
- Build a **dashboard** to track funnel metrics: `/skill outbound-dashboard-spec`
- Analyze **campaign performance** feeding the funnel: `/skill campaign-analyzer`

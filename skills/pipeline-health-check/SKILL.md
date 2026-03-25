---
name: pipeline-health-check
description: Audit pipeline health with stage distribution, velocity, and coverage analysis. Use when someone says "pipeline audit", "pipeline health", "pipeline review", "pipeline analysis", "deal review", "forecast check", or "pipeline coverage"
allowed-tools: Read, Write
metadata:
  author: Achille Morin-Lemoine
  version: "1.0.0"
---

# Pipeline Health Check

Audit pipeline health by analyzing stage distribution, velocity, stuck deals, coverage ratio, forecast accuracy, and single-threaded risk. Produces specific recommendations to fix pipeline problems before they hit revenue.

## Inputs

- **Pipeline data** (required) -- deals by stage, value, age, last activity date, contacts involved
- **Revenue target** (required) -- quarterly or monthly target to measure coverage against
- **Historical data** (optional) -- previous forecasts vs. actuals, historical win rates by stage
- **CRM context** (optional) -- what CRM, deal stages defined, how data is captured

If pipeline data or revenue target is missing, ask: "I need your pipeline data (deals by stage with values and dates) and your revenue target. What are we working with?"

## Steps

### Step 0 -- Check for Existing Output

Search the project for any existing output from a previous run of this skill (check common locations like `docs/`, the project root, or any organized output directory). If a previous version is found, present a summary and ask: "A pipeline audit already exists. Do you want me to (a) update with current data, (b) compare to the previous audit, or (c) rebuild?" 

### Step 1 -- Load Context

Search the project for any available context. Look in the project root, `docs/`, or any organized directory. Read what you find:

1. **Analytics** documents -- prior audits and reports
2. **Dashboard Spec** documents -- reporting standards
3. `CLAUDE.md` -- project-level instructions

### Step 2 -- Analyze Stage Distribution

Map deals by stage:

| Stage | Deals | Total Value | % of Pipeline | Avg. Age (days) |
|-------|-------|-------------|---------------|-----------------|
| {rows} |
| **Total** | {N} | ${N} | 100% | {avg} |

Diagnose shape:
- **Top-heavy (> 60% in early stages):** Lots of prospects but poor conversion. Problem is likely qualification or sales process.
- **Bottom-heavy (> 40% in late stages):** Not enough new pipeline coming in. Problem is likely prospecting volume.
- **Healthy (pyramid shape):** Largest volume at top, decreasing by stage, with appropriate values increasing.

### Step 3 -- Calculate Velocity by Segment

Measure how fast deals move through stages:

| Segment | Avg. Days in Stage 1 | Avg. Days in Stage 2 | Avg. Days in Stage 3 | Total Cycle |
|---------|----------------------|----------------------|----------------------|-------------|
| {rows} |

Flag segments where velocity is 2x slower than average.

### Step 4 -- Identify Stuck Deals

Flag any deal with no activity in 14+ days:

| Deal | Stage | Value | Days Since Last Activity | Owner | Risk |
|------|-------|-------|-------------------------|-------|------|
| {rows} |

For each stuck deal, recommend one of:
- **Re-engage:** Send a check-in or share new information
- **Multithreading:** Engage additional contacts at the account
- **Downstage:** Move to an earlier stage if the deal has regressed
- **Close lost:** If no realistic path to close, remove from pipeline

### Step 5 -- Assess Coverage Ratio

Calculate pipeline coverage:

- **Pipeline value:** ${total active pipeline}
- **Revenue target:** ${target}
- **Coverage ratio:** {pipeline / target}x
- **Weighted pipeline:** ${sum of deal value x stage probability}
- **Weighted coverage:** {weighted pipeline / target}x

Benchmarks:
- **Healthy:** 3x+ coverage (unweighted) or 1.2x+ (weighted)
- **At risk:** 2-3x coverage (unweighted). Need to accelerate pipeline creation.
- **Critical:** Below 2x coverage. Unlikely to hit target without immediate action.

### Step 6 -- Check Forecast Accuracy

If historical data is available, compare previous forecasts to actuals:

| Period | Forecasted | Actual | Accuracy |
|--------|-----------|--------|----------|
| {rows} |

Identify patterns:
- Consistent over-forecasting? Win rates are lower than assumed.
- Specific stages where deals die? Stage conversion rates need updating.
- Specific reps or segments that forecast poorly? Training or process issue.

### Step 7 -- Flag Single-Threaded Deals

Identify deals with only one contact:

| Deal | Value | Stage | Contacts | Risk |
|------|-------|-------|----------|------|
| {rows} |

Rule: any deal over $25K with a single contact is at risk. A champion who leaves, goes on vacation, or loses influence can kill the deal overnight.

Recommendation: for every flagged deal, identify 2-3 additional contacts to engage (economic buyer, technical evaluator, coach).

### Step 8 -- Produce Recommendations

Categorize recommendations by urgency:

**Immediate (this week):**
- {Action} on {specific deals or segments}

**Short-term (this month):**
- {Action} to fix {pipeline gap}

**Structural (this quarter):**
- {Process change} to prevent {recurring issue}

### Step 9 -- Quality Gate

- [ ] Stage distribution is analyzed with shape diagnosis
- [ ] Velocity is calculated by segment
- [ ] Stuck deals (14+ days no activity) are identified
- [ ] Coverage ratio is calculated against target
- [ ] Single-threaded deals are flagged
- [ ] Recommendations are prioritized by urgency
- [ ] No em dashes in any copy

## Output Format

Save the output to your project. Suggested filename: `pipeline-audit.md`

```markdown
# Pipeline Health Check

Date: {Date}
Target: ${Revenue target}
Pipeline: ${Total pipeline value}
Coverage: {X}x

## Summary
{3-4 sentence diagnosis: healthy, at risk, or critical, with key findings}

## Stage Distribution
| Stage | Deals | Value | % of Pipeline | Avg. Age |
|-------|-------|-------|---------------|----------|
| {rows} |

**Diagnosis:** {Top-heavy / Bottom-heavy / Healthy}

## Velocity
| Segment | Total Cycle (days) | vs. Average |
|---------|-------------------|-------------|
| {rows} |

## Stuck Deals
| Deal | Stage | Value | Days Stale | Action |
|------|-------|-------|-----------|--------|
| {rows} |

## Coverage Analysis
- **Unweighted coverage:** {X}x ({healthy/at risk/critical})
- **Weighted coverage:** {X}x
- **Gap to target:** ${gap}

## Single-Threaded Risk
| Deal | Value | Contacts | Action Needed |
|------|-------|----------|--------------|
| {rows} |

## Forecast Accuracy
{If historical data available}

## Recommendations
### Immediate
{This week actions}
### Short-Term
{This month actions}
### Structural
{This quarter process changes}
```

## Key Principles

1. **Coverage is the leading indicator.** If coverage drops below 3x, you will likely miss the target. This is the first number to check and the most important to fix.
2. **Stuck deals are dead deals that haven't been acknowledged.** A deal with no activity for 14+ days is not "still in play." Either re-engage with a specific action or close it out.
3. **Single-threaded deals are time bombs.** One contact leaving or losing interest kills the deal. Multithreading is not a nice-to-have. It's pipeline insurance.
4. **Shape matters as much as size.** A $1M pipeline that's 80% in early stages has a very different probability of hitting target than one that's 50% in late stages.

## Anti-Patterns

- **Ignoring deal age.** A deal that's been in "proposal" stage for 90 days is not a proposal. It's a stalled deal wearing a disguise. Apply stage-appropriate age limits.
- **Counting everything as pipeline.** Deals without next steps, without budget confirmed, or without a decision timeline are wishes, not pipeline. Apply qualification criteria.
- **Quarterly panic instead of weekly hygiene.** Pipeline problems are best caught early. A weekly 15-minute review prevents the end-of-quarter scramble.

## What to Do Next

- Build a **dashboard** to track pipeline metrics: `/skill outbound-dashboard-spec`
- Analyze **campaign performance** feeding the pipeline: `/skill campaign-analyzer`
- Design **outreach** to fill pipeline gaps: `/skill cold-email-writer`

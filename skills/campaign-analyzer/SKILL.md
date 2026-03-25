---
name: campaign-analyzer
description: Analyze campaign performance with segmented metrics and recommendations. Use when someone says "analyze campaign", "campaign report", "campaign performance", "campaign metrics", "campaign results", "what's working", or "campaign review"
allowed-tools: Read, Write
metadata:
  author: Achille Morin-Lemoine
  version: "1.0.0"
---

# Campaign Analyzer

Analyze campaign performance by segment, identify what's working and what's not, and produce actionable recommendations: scale, kill, or test. The output is a decision-ready report, not a data dump.

## Inputs

- **Campaign data** (required) -- metrics by variant, segment, or channel (open rate, reply rate, meeting rate, cost)
- **Campaign name** (required) -- which campaign to analyze
- **Time period** (optional) -- date range for the analysis
- **Benchmarks** (optional) -- industry or historical benchmarks to compare against
- **Cost data** (optional) -- spend per channel or variant

If campaign data is missing, ask: "I need the campaign metrics (open rate, reply rate, meeting rate by segment or variant). What data do you have?"

## Steps

### Step 0 -- Check for Existing Output

Search the project for any existing output from a previous run of this skill (check common locations like `docs/`, the project root, or any organized output directory). If a previous version is found, present a summary and ask: "A campaign report already exists. Do you want me to (a) update with new data, (b) analyze a different time period, or (c) rebuild?" 

### Step 1 -- Load Context

Search the project for any available context. Look in the project root, `docs/`, or any organized directory. Read what you find:

1. **Analytics** documents -- prior campaign reports for comparison
2. **Existing outreach sequences** -- campaign assets being analyzed
3. **Dashboard Spec** documents -- reporting standards
4. `CLAUDE.md` -- project-level instructions

### Step 2 -- Calculate Metrics by Segment

For each segment (persona, industry, company size, message variant, channel):

| Segment | Sent | Opens | Open Rate | Replies | Reply Rate | Positive Replies | Positive Rate | Meetings | Meeting Rate |
|---------|------|-------|-----------|---------|------------|-----------------|---------------|----------|-------------|
| {rows} |

If cost data is available, add:
- Cost per send
- Cost per reply
- Cost per meeting

### Step 3 -- Compare Across Segments

Rank segments by each metric:
- **Best open rate:** {segment} at {rate}
- **Best reply rate:** {segment} at {rate}
- **Best meeting rate:** {segment} at {rate}
- **Worst open rate:** {segment} at {rate}
- **Worst reply rate:** {segment} at {rate}
- **Worst meeting rate:** {segment} at {rate}

Identify patterns:
- Which persona responds best?
- Which message variant performs best?
- Which channel is most efficient?
- Is there a segment that performs well on opens but poorly on meetings? (messaging resonates but offer doesn't)

### Step 4 -- Calculate Cost Efficiency

| Metric | Value | Benchmark |
|--------|-------|-----------|
| Cost per meeting | ${N} | {industry average or historical} |
| Cost per opportunity | ${N} | {benchmark} |
| CAC (if revenue data available) | ${N} | {benchmark} |

Flag any segment where cost per meeting exceeds 2x the average.

### Step 5 -- Produce Recommendations

For each finding, categorize:

**Scale (what's working):**
- {Segment/variant}: {metric} is {X}% above average. Recommendation: increase volume by {amount}. Why: {reasoning}.

**Kill (what's not working):**
- {Segment/variant}: {metric} is {X}% below average after {N} data points. Recommendation: stop sending. Why: {reasoning}.

**Test (what to try next):**
- Based on {finding}, test {specific change}. Hypothesis: {expected outcome}. Minimum sample: {N}.

Rules:
- "Kill" requires at least 50 data points. Below that, it's inconclusive, not bad.
- "Scale" requires the segment to outperform on the primary metric (meeting rate), not just opens.
- "Test" must include a specific hypothesis and minimum sample size.

### Step 6 -- Quality Gate

- [ ] Metrics are calculated per segment, not just overall
- [ ] Top and bottom performers are identified per metric
- [ ] Cost efficiency is calculated (if cost data provided)
- [ ] Recommendations are categorized as scale/kill/test
- [ ] "Kill" recommendations have minimum 50 data points
- [ ] "Test" recommendations include hypotheses
- [ ] Patterns are identified (not just numbers listed)
- [ ] No em dashes in any copy

## Output Format

Save the output to your project. Suggested filename: `campaign-report-{campaign-slug}.md`

```markdown
# Campaign Report: {Campaign Name}

Date: {Date}
Period: {Date range}

## Summary
{2-3 sentence overview: what worked, what didn't, key finding}

## Performance by Segment
| Segment | Sent | Open Rate | Reply Rate | Meeting Rate | Cost/Meeting |
|---------|------|-----------|------------|-------------|-------------|
| {rows} |

## Top Performers
- **Best segment:** {name} with {metric}
- **Best variant:** {name} with {metric}

## Bottom Performers
- **Worst segment:** {name} with {metric}
- **Worst variant:** {name} with {metric}

## Patterns
{What the data reveals about audience preferences}

## Recommendations

### Scale
{What to increase and why}

### Kill
{What to stop and why}

### Test
{What to try next with hypothesis}

## Cost Efficiency
| Metric | Value | vs. Benchmark |
|--------|-------|---------------|
| {rows} |
```

## Key Principles

1. **Segment everything.** Overall averages hide the truth. A campaign with a 3% reply rate might have one segment at 8% and another at 0.5%. The action is different for each.
2. **Optimize for meetings, not opens.** A high open rate with zero meetings means the subject line works but the offer doesn't. Always trace metrics downstream.
3. **Kill decisions need data.** Don't kill a segment after 20 sends. That's not enough signal. Wait for 50+ data points before concluding something doesn't work.
4. **Every recommendation needs a "why."** "Stop targeting CMOs" is not a recommendation. "Stop targeting CMOs because reply rate is 0.3% after 200 sends while VPs of Marketing convert at 4.2%" is.
5. **Test one thing at a time.** If the data suggests three changes, don't make them all at once. Sequence the tests so you know what caused the improvement.

## Anti-Patterns

- **Reporting without recommendations.** A report that lists numbers without saying what to do next is a spreadsheet, not an analysis. Always end with actions.
- **Optimizing vanity metrics.** Celebrating open rate improvements while meeting rate stays flat. The downstream metric is what matters.
- **Drawing conclusions from small samples.** 15 sends to a segment is not enough to decide anything. Flag inconclusive data honestly.

## What to Do Next

- Design an **A/B test** based on findings: `/skill ab-test-designer`
- Update the **outreach sequences** that are working: `/skill follow-up-sequence`
- Build a **dashboard** to track these metrics ongoing: `/skill outbound-dashboard-spec`

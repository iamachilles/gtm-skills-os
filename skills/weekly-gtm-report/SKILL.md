---
description: Generate a weekly GTM report with metrics, pipeline, and priorities. Use when someone says "weekly report", "GTM report", "weekly update", "weekly metrics", "weekly summary", "status report", or "weekly review"
tools: Read, Write
---

# Weekly GTM Report

Generate a one-page weekly GTM report with five sections: Key Metrics, Pipeline Movement, Campaign Performance, Wins and Learnings, and Next Week Focus. The report should take 5 minutes to read and immediately clarify what happened, what's working, and what to do next.

Hard cap: one page. If it doesn't fit on one page, it has too much detail. Summarize ruthlessly.

## Inputs

- **Raw activity data** (required) -- this week's metrics (emails sent, calls made, meetings booked, pipeline changes)
- **Date range** (required) -- which week this covers
- **Last week's report** (optional) -- for comparison
- **Revenue target** (optional) -- for pipeline coverage calculation

If activity data is missing, ask: "I need this week's activity data (sends, replies, meetings, pipeline changes). What are the numbers?"

## Steps

### Step 0 -- Check for Existing Output

Read `docs/analytics/weekly-report-{date}.md` if it exists. If found, present a summary and ask: "A weekly report for this date already exists. Do you want me to (a) update it, (b) keep it, or (c) rebuild?"

### Step 1 -- Load Context

Read all available context:

1. `docs/analytics/weekly-report-*.md` -- last week's report for comparison
2. `docs/analytics/dashboard-spec.md` -- metric definitions and targets
3. `docs/analytics/pipeline-audit.md` -- pipeline context
4. `CLAUDE.md` -- project-level instructions

### Step 2 -- Section 1: Key Metrics

Compare this week vs. last week vs. target:

| Metric | This Week | Last Week | Change | Target | Status |
|--------|-----------|-----------|--------|--------|--------|
| Emails sent | {N} | {N} | {+/-} | {N} | {G/Y/R} |
| Reply rate | {%} | {%} | {+/-} | {%} | {G/Y/R} |
| Meetings booked | {N} | {N} | {+/-} | {N} | {G/Y/R} |
| Pipeline added | ${N} | ${N} | {+/-} | ${N} | {G/Y/R} |

Status: Green (on/above target), Yellow (within 80% of target), Red (below 80%)

Highlight the single most important metric change with a one-sentence explanation.

### Step 3 -- Section 2: Pipeline Movement

Track what moved this week:

- **New:** {N} opportunities worth ${N} entered the pipeline
- **Advanced:** {N} opportunities worth ${N} moved to a later stage
- **Lost:** {N} opportunities worth ${N} closed lost. Reasons: {top 2 reasons}
- **Stuck:** {N} opportunities worth ${N} had no activity this week
- **Coverage:** {X}x against ${target}

One sentence summary: "Pipeline is {healthy/at risk/critical} because {reason}."

### Step 4 -- Section 3: Campaign Performance

Highlight the best and worst performing campaign:

**Top campaign:** {name}
- {Key metric}: {result}
- Why it's working: {one sentence}

**Worst campaign:** {name}
- {Key metric}: {result}
- Action: {scale, kill, or investigate}

### Step 5 -- Section 4: Wins and Learnings

**What worked:**
- {Win 1}: {one sentence with metric}
- {Win 2}: {one sentence with metric}

**What didn't:**
- {Learning 1}: {what happened and what to change}
- {Learning 2}: {what happened and what to change}

Rules:
- Wins must include a number. "Great week" is not a win. "Booked 8 meetings, 2x last week" is.
- Learnings must include what to change. "Low reply rate" is not a learning. "Low reply rate on enterprise segment. Switching from feature-led to problem-led messaging" is.

### Step 6 -- Section 5: Next Week Focus

Define exactly 3 priorities:

1. **{Priority 1}:** {specific action} -- expected outcome: {result}
2. **{Priority 2}:** {specific action} -- expected outcome: {result}
3. **{Priority 3}:** {specific action} -- expected outcome: {result}

Rules:
- Exactly 3. Not 5, not 7. Three forces prioritization.
- Each must be a specific action, not a category. "Outbound" is not a priority. "Launch enterprise sequence targeting 50 VP-level contacts" is.
- Each must have an expected outcome so you can evaluate next week.

### Step 7 -- Quality Gate

- [ ] Report fits on one page (under 500 words)
- [ ] Key metrics include this week, last week, and target
- [ ] Pipeline section covers new, advanced, lost, and stuck
- [ ] Campaign section highlights best and worst
- [ ] Wins include numbers, learnings include actions
- [ ] Next week has exactly 3 priorities with expected outcomes
- [ ] No em dashes in any copy

## Output Format

Save to `docs/analytics/weekly-report-{date}.md`:

```markdown
# Weekly GTM Report: {Date Range}

## Key Metrics
| Metric | This Week | Last Week | Target | Status |
|--------|-----------|-----------|--------|--------|
| {rows} |

**Highlight:** {One sentence on the most important metric change}

## Pipeline Movement
- **New:** {N} deals, ${value}
- **Advanced:** {N} deals, ${value}
- **Lost:** {N} deals, ${value}. Reasons: {top reasons}
- **Stuck:** {N} deals, ${value}
- **Coverage:** {X}x vs. ${target}

**Status:** {Healthy / At Risk / Critical}

## Campaign Performance
**Top:** {name} -- {metric}: {result}
**Bottom:** {name} -- {metric}: {result}. Action: {next step}

## Wins & Learnings
**Worked:** {2 bullets with numbers}
**Didn't work:** {2 bullets with actions}

## Next Week
1. {Priority + action + expected outcome}
2. {Priority + action + expected outcome}
3. {Priority + action + expected outcome}
```

## Key Principles

1. **One page, no exceptions.** A weekly report that takes 20 minutes to read won't get read. Ruthless brevity forces clarity.
2. **Compare to last week AND to target.** "We booked 5 meetings" means nothing without context. "We booked 5 meetings (up from 3, target is 6)" tells the whole story.
3. **Wins need numbers, learnings need actions.** Qualitative wins are feel-good fluff. Quantified wins are evidence. Learnings without proposed changes are complaints.
4. **Three priorities, not ten.** If everything is a priority, nothing is. Three forces the difficult choice of what matters most.

## Anti-Patterns

- **The activity log.** Listing everything that happened without analysis. A report should tell you what matters, not everything.
- **No comparison data.** Reporting metrics without last week's numbers or targets. Isolated numbers are meaningless without context.
- **Vague priorities.** "Do more outbound" as a next-week priority. Specify the action, the target, and the expected outcome.

## What to Do Next

- Deep-dive into **campaign performance**: `/skill campaign-analyzer`
- Audit **pipeline health** in detail: `/skill pipeline-health-check`
- Analyze **content performance**: `/skill content-performance-analyzer`

---
description: Write a client progress report with results and next steps. Use when someone says "client report", "progress report", "client update", "engagement report", "status report for client", "client deliverable report", or "monthly client report"
tools: Read, Write
---

# Client Report Writer

Write a client progress report that covers what was done, what results were achieved, what was learned, and what's next. The report should demonstrate value and maintain confidence in the engagement.

Hard cap: 2 pages. Clients don't have time for 10-page reports. Distill to what matters.

## Inputs

- **Engagement data** (required) -- activities completed this period, metrics, deliverables
- **Results** (required) -- outcomes, before/after metrics, progress toward objectives
- **Client name** (required) -- which client
- **Report period** (optional) -- date range (default: current month)
- **Engagement status** (optional) -- on track, behind, ahead, approaching renewal

If engagement data or results are missing, ask: "I need the activities and results from this period. What was done and what happened?"

## Steps

### Step 0 -- Check for Existing Output

Read `docs/sales/client-report-{client-slug}-{date}.md` if it exists. If found, present a summary and ask: "A report for this period already exists. Do you want me to (a) update it, (b) keep it, or (c) rebuild?"

### Step 1 -- Load Context

Read all available context:

1. `docs/sales/sow-{client-slug}.md` -- engagement scope and objectives
2. `docs/sales/client-report-{client-slug}-*.md` -- prior reports for continuity
3. `docs/case-studies/{client-slug}.md` -- if engagement is documented
4. `CLAUDE.md` -- project-level instructions

### Step 2 -- Section 1: Summary

Write one paragraph (3-5 sentences) that a busy executive can read in 30 seconds:
- What period this covers
- The single most important result
- Overall engagement status (on track, ahead, behind)
- One forward-looking statement

### Step 3 -- Section 2: What We Did

List activities, not hours. Clients care about outputs, not effort.

| Activity | Output | Impact |
|----------|--------|--------|
| {What was done} | {What was produced} | {Why it matters} |
| {rows} |

Rules:
- Frame activities as outputs, not inputs. "Built target account list of 200 accounts" not "Spent 8 hours on research."
- Connect each activity to the engagement objectives.
- Omit activities that don't contribute to the client's goals.

### Step 4 -- Section 3: Results

Present metrics with before/after comparison:

| Metric | Before | Current | Change | Target |
|--------|--------|---------|--------|--------|
| {metric} | {baseline} | {current} | {+/-%} | {goal} |
| {rows} |

For each key result, write one sentence explaining what it means in business terms. "Reply rate increased from 2% to 5%" becomes "Reply rate increased from 2% to 5%, which translated to 12 additional meetings this month."

### Step 5 -- Section 4: Learnings

Share 2-3 insights discovered during this period:

1. **{Learning 1}:** {What was discovered and what it means for the strategy}
2. **{Learning 2}:** {What was discovered and what action was taken}

Rules:
- Learnings demonstrate expertise. They show the client you're not just executing, you're thinking.
- Each learning should connect to an action (either taken or recommended).
- Be honest about what didn't work. Clients trust consultants who acknowledge mistakes more than those who only report wins.

### Step 6 -- Section 5: Next Steps

Define what's coming and what you need from them:

**What we'll do:**
1. {Action 1} -- expected outcome: {result}, deadline: {date}
2. {Action 2} -- expected outcome: {result}, deadline: {date}
3. {Action 3} -- expected outcome: {result}, deadline: {date}

**What we need from you:**
1. {Input needed} by {date}
2. {Decision needed} by {date}

### Step 7 -- Add Renewal Context (If Applicable)

If the engagement is approaching its end:

- **Engagement end date:** {date}
- **Objectives achieved:** {X of Y}
- **Recommended next phase:** {what to do next and why}
- **Transition plan:** {what happens if the engagement ends vs. continues}

Don't hard-sell. Present the facts and the recommendation. If the results speak for themselves, renewal is straightforward.

### Step 8 -- Quality Gate

- [ ] Report is under 2 pages (under 800 words)
- [ ] Summary can be read in 30 seconds
- [ ] Activities are framed as outputs, not hours
- [ ] Results include before/after metrics
- [ ] At least one learning with connected action
- [ ] Next steps include what's needed from the client
- [ ] Renewal context added if approaching end of engagement
- [ ] No em dashes in any copy

## Output Format

Save to `docs/sales/client-report-{client-slug}-{date}.md`:

```markdown
# Client Report: {Client Name}

Period: {Date range}
Status: On Track / Ahead / Behind

## Summary
{One paragraph: key result, status, forward-looking statement}

## What We Did
| Activity | Output | Impact |
|----------|--------|--------|
| {rows} |

## Results
| Metric | Before | Current | Change | Target |
|--------|--------|---------|--------|--------|
| {rows} |

{1-2 sentences translating metrics to business impact}

## Learnings
1. {Learning + action}
2. {Learning + action}

## Next Steps
**We will:**
1. {Action + outcome + deadline}
2. {Action + outcome + deadline}

**We need from you:**
1. {Input + deadline}
2. {Input + deadline}

## Renewal Context (if applicable)
{End date, objectives status, recommendation}
```

## Key Principles

1. **Two pages maximum.** Respect the client's time. If the report is longer than two pages, you're including unnecessary detail. Summarize ruthlessly.
2. **Lead with results, not activities.** The client hired you for outcomes, not effort. Start with what was achieved, then explain how.
3. **Learnings build trust.** Sharing insights shows you're thinking strategically, not just executing tasks. It justifies the premium you charge.
4. **Be honest about setbacks.** Reporting only wins destroys credibility when the client sees problems you didn't mention. Address challenges proactively with your plan to resolve them.
5. **Next steps include client dependencies.** Make it clear what you need from them. This prevents the "we were waiting on you" conversation.

## Anti-Patterns

- **The hour log.** Reporting hours spent instead of outcomes achieved. "Spent 15 hours on research" tells the client nothing. "Identified 200 target accounts matching your ICP" tells them everything.
- **All wins, no learnings.** A report that only celebrates successes feels like marketing, not consulting. Include what was learned, including from what didn't work.
- **Burying the ask.** Hiding what you need from the client in the middle of a long report. Put client action items in a clearly labeled section.

## What to Do Next

- Build a **case study** from engagement results: `/skill case-study-from-engagement`
- Generate a **SOW** for the next phase: `/skill sow-generator`
- Analyze **campaign performance** for the client: `/skill campaign-analyzer`

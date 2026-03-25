---
name: outbound-dashboard-spec
description: Design a reporting dashboard for outbound and GTM metrics. Use when someone says "dashboard", "reporting dashboard", "metrics dashboard", "outbound reporting", "GTM dashboard", "build a dashboard", or "tracking dashboard"
allowed-tools: Read, Write
metadata:
  author: Achille Morin-Lemoine
  version: "1.0.0"
---

# Outbound Dashboard Spec

Design a reporting dashboard with four sections: Activity, Efficiency, Pipeline, and ROI. Specifies metrics, data sources, refresh cadence, and alert thresholds so the dashboard is actionable, not decorative.

## Inputs

- **Dashboard scope** (required) -- what to track (outbound only, full GTM, specific campaign)
- **Data sources** (required) -- where data lives (CRM, email tool, spreadsheet, ad platforms)
- **Audience** (required) -- who uses this dashboard (founder, sales team, marketing, board)
- **Current reporting** (optional) -- what exists today, what's missing

If scope or data sources are missing, ask: "I need to know what you want to track and where the data lives. What's the scope?"

## Steps

### Step 0 -- Check for Existing Output

Search the project for any existing output from a previous run of this skill (check common locations like `docs/`, the project root, or any organized output directory). If a previous version is found, present a summary and ask: "A dashboard spec already exists. Do you want me to (a) update it, (b) add new sections, or (c) rebuild?" 

### Step 1 -- Load Context

Search the project for any available context. Look in the project root, `docs/`, or any organized directory. Read what you find:

1. **Analytics** documents -- existing reports and frameworks
2. **GTM Triangle** -- channels and motion context
3. `CLAUDE.md` -- project-level instructions

### Step 2 -- Define Section 1: Activity

Track what the team is doing:

| Metric | Definition | Data Source | Target |
|--------|-----------|-------------|--------|
| Emails sent | Total outbound emails (excl. automated) | {email tool} | {N/week} |
| Calls made | Total outbound calls | {dialer/CRM} | {N/week} |
| LinkedIn touches | Connection requests + messages sent | {LinkedIn/tool} | {N/week} |
| Sequences started | New prospects added to sequences | {sequencing tool} | {N/week} |

Activity metrics answer: "Are we doing enough?"

### Step 3 -- Define Section 2: Efficiency

Track how well the activity converts:

| Metric | Definition | Data Source | Target | Alert Threshold |
|--------|-----------|-------------|--------|----------------|
| Open rate | Unique opens / emails delivered | {email tool} | > 40% | < 25% (red) |
| Reply rate | Replies / emails delivered | {email tool} | > 5% | < 2% (red) |
| Positive reply rate | Positive replies / total replies | {manual tag} | > 50% | < 30% (red) |
| Meeting rate | Meetings booked / prospects contacted | {CRM} | > 3% | < 1% (red) |
| Connection accept rate | Accepted / sent (LinkedIn) | {LinkedIn tool} | > 30% | < 15% (red) |

Efficiency metrics answer: "Is our approach working?"

### Step 4 -- Define Section 3: Pipeline

Track downstream outcomes:

| Metric | Definition | Data Source | Target | Alert Threshold |
|--------|-----------|-------------|--------|----------------|
| Meetings booked | Total meetings scheduled this period | {CRM/calendar} | {N/week} | < {N/2} (red) |
| Meetings held | Meetings that actually happened (excl. no-shows) | {CRM} | {N/week} | < {N/2} (red) |
| Opportunities created | New deals in pipeline | {CRM} | {N/month} | < {N/2} (red) |
| Pipeline value | Total value of new opportunities | {CRM} | ${N/month} | < ${N/2} (red) |
| Pipeline coverage | Active pipeline / revenue target | {CRM} | > 3x | < 2x (red) |

Pipeline metrics answer: "Are we building enough future revenue?"

### Step 5 -- Define Section 4: ROI

Track cost efficiency:

| Metric | Definition | Data Source | Target |
|--------|-----------|-------------|--------|
| Cost per meeting | Total outbound spend / meetings held | {spend tracking} | < ${N} |
| Cost per opportunity | Total spend / opportunities created | {spend tracking} | < ${N} |
| CAC by channel | Total channel cost / customers acquired | {CRM + spend} | < ${N} |
| Revenue per $ spent | Revenue closed / total outbound spend | {CRM + spend} | > ${N} |

ROI metrics answer: "Is this worth the investment?"

### Step 6 -- Specify Data Sources and Integration

For each metric, document:
- Where the data lives (specific tool and field)
- How it gets to the dashboard (API, export, manual entry)
- Who is responsible for data quality
- Known limitations or caveats

### Step 7 -- Define Refresh Cadence

| Dashboard Section | Refresh Frequency | Rationale |
|-------------------|-------------------|-----------|
| Activity | Daily | Allows daily standup review |
| Efficiency | Weekly | Needs 5+ days of data for trends |
| Pipeline | Weekly | Matches pipeline review cadence |
| ROI | Monthly | Costs are typically tracked monthly |

### Step 8 -- Set Alert Thresholds

Define three states for each key metric:

- **Green:** On track. No action needed.
- **Yellow:** Below target but within recovery range. Investigate this week.
- **Red:** Significantly below target. Immediate action required.

For each red alert, define the escalation path: who gets notified and what they should do.

### Step 9 -- Quality Gate

- [ ] All four sections (Activity, Efficiency, Pipeline, ROI) are defined
- [ ] Each metric has a data source, target, and alert threshold
- [ ] Refresh cadence is specified per section
- [ ] Red/yellow/green thresholds are defined for key metrics
- [ ] Data source limitations are documented
- [ ] Dashboard is designed for the stated audience (not too technical, not too vague)
- [ ] No em dashes in any copy

## Output Format

Save the output to your project. Suggested filename: `dashboard-spec.md`

```markdown
# Outbound Dashboard Spec

Date: {Date}
Audience: {Who uses this}
Refresh: {Cadence summary}

## Section 1: Activity
| Metric | Source | Target | Green | Yellow | Red |
|--------|--------|--------|-------|--------|-----|
| {rows} |

## Section 2: Efficiency
| Metric | Source | Target | Green | Yellow | Red |
|--------|--------|--------|-------|--------|-----|
| {rows} |

## Section 3: Pipeline
| Metric | Source | Target | Green | Yellow | Red |
|--------|--------|--------|-------|--------|-----|
| {rows} |

## Section 4: ROI
| Metric | Source | Target | Benchmark |
|--------|--------|--------|-----------|
| {rows} |

## Data Sources
{Integration details per source}

## Refresh Cadence
{Table with rationale}

## Alert Escalation
- **Red alert on {metric}:** {who gets notified, what action to take}

## Known Limitations
{Data quality issues, tracking gaps, manual dependencies}
```

## Key Principles

1. **Four sections, not forty metrics.** Activity, Efficiency, Pipeline, ROI. That's the full story. Adding more sections creates dashboards nobody reads.
2. **Every metric needs a target.** A number without context is not information. "Reply rate: 4.2%" means nothing. "Reply rate: 4.2% (target: 5%, yellow zone)" is actionable.
3. **Alerts drive action.** Green/yellow/red thresholds turn a dashboard from a reporting tool into a management tool. Without alerts, dashboards are just pretty charts.
4. **Design for the audience.** A founder needs a different view than a sales rep. Specify who uses this dashboard and what decisions they make with it.

## Anti-Patterns

- **The everything dashboard.** Tracking 50 metrics makes nothing visible. Pick the 12-15 metrics that drive decisions. Kill the rest.
- **No alert thresholds.** A dashboard without alerts requires someone to actively monitor it. Nobody does. Set thresholds so the dashboard tells you when something needs attention.
- **Manual data entry dependencies.** A dashboard that requires daily manual updates will stop being updated within 2 weeks. Automate data flow or reduce refresh frequency.

## What to Do Next

- Analyze **campaign performance** using this framework: `/skill campaign-analyzer`
- Audit **pipeline health**: `/skill pipeline-health-check`
- Track **event ROI** as a dashboard section: `/skill field-event-roi-tracker`

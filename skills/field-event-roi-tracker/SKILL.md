---
description: Create an event ROI tracking framework. Use when someone says "event ROI", "event tracking", "event metrics", "measure event success", "event cost analysis", "event attribution", or "conference ROI"
tools: Read, Write
---

# Field Event ROI Tracker

Create a framework to track ROI from field events. Defines cost categories, revenue attribution rules, lead scoring adjustments, reporting templates, and minimum ROI thresholds. The goal is to know within 90 days whether an event was worth attending.

## Inputs

- **Event types** (required) -- which events to track (conferences, trade shows, dinners, field events)
- **Budget context** (required) -- typical event spend range and annual event budget
- **Current tracking** (optional) -- what you already track and where (CRM, spreadsheet, nothing)
- **Revenue cycle** (optional) -- average deal cycle length (affects attribution window)

If event types or budget context is missing, ask: "I need to know which types of events you attend and your typical event budget. What's the context?"

## Steps

### Step 0 -- Check for Existing Output

Read `docs/analytics/event-roi-framework.md` if it exists. If found, present a summary and ask: "An event ROI framework already exists. Do you want me to (a) update it, (b) rebuild for new event types, or (c) keep it?"

### Step 1 -- Load Context

Read all available context:

1. `docs/analytics/*.md` -- existing analytics and reporting frameworks
2. `docs/content/event-playbook-*.md` -- event playbooks with goals
3. `docs/analytics/attribution-model.md` -- if an attribution model exists
4. `CLAUDE.md` -- project-level instructions

### Step 2 -- Define Cost Categories

Categorize all event costs:

| Category | Includes | Typical Range |
|----------|----------|--------------|
| Booth/sponsorship | Booth fee, sponsorship package, booth design | $2K-50K |
| Travel | Flights, hotels, ground transport, meals | $500-5K per person |
| Materials | Printed collateral, swag, giveaways | $500-5K |
| Staff time | Opportunity cost of staff attending (loaded cost per day) | $500-2K per person per day |
| Technology | Lead capture tools, badge scanners, event apps | $0-1K |
| Pre/post event | Outreach tools, follow-up campaign costs | $200-2K |

Rule: always include staff time. An event that "only costs $5K" but takes 4 people out of the field for 3 days costs far more than the booth fee.

### Step 3 -- Define Revenue Attribution Rules

Choose an attribution model for events:

**First-touch attribution:** The event gets full credit if it was the first meaningful interaction. Use when events are primarily for net-new pipeline.

**Multi-touch attribution:** The event gets partial credit alongside other touches. Use when events accelerate existing pipeline.

**Influenced attribution:** The event gets credit for any deal where a contact attended, regardless of other touches. Use for reporting total event impact.

Recommended approach: track all three, report primarily on influenced pipeline (most honest), and use first-touch for new pipeline sourced.

**Attribution window:** Set based on your deal cycle.
- Short sales cycle (< 30 days): 30-day attribution window
- Medium sales cycle (30-90 days): 90-day attribution window
- Long sales cycle (90+ days): 180-day attribution window

### Step 4 -- Create Lead Scoring Adjustments

Define how event leads get scored differently:

| Lead Action | Score Adjustment | Rationale |
|-------------|-----------------|-----------|
| Attended your session/demo | +20 points | High intent signal |
| Visited booth, asked questions | +15 points | Engaged interest |
| Badge scan only | +5 points | Minimal signal |
| Pre-scheduled meeting, attended | +25 points | Highest intent |
| Pre-scheduled meeting, no-show | +5 points (still interested) | Intent exists, timing didn't work |
| Requested follow-up at booth | +20 points | Active next step |

### Step 5 -- Design Reporting Template

Create the report structure:

**Event Summary:**
- Event name, dates, type of presence
- Total cost (broken down by category)
- Team members who attended

**Activity Metrics:**
- Leads captured (by Hot/Warm/Cold)
- Meetings held at event
- Demos delivered
- Follow-up meetings booked

**Efficiency Metrics:**
- Cost per lead (total cost / leads captured)
- Cost per qualified lead (total cost / hot + warm leads)
- Cost per meeting (total cost / meetings held + booked)
- Cost per opportunity (total cost / opportunities created within attribution window)

**Pipeline Metrics** (measured at 30/60/90 days):
- Pipeline sourced (first-touch)
- Pipeline influenced (any touch)
- Opportunities created
- Revenue closed

**ROI Calculation:**
- ROI = (Revenue attributed - Total cost) / Total cost x 100
- Breakeven: {revenue needed to cover costs}

### Step 6 -- Set Minimum ROI Threshold

Define the threshold for future event decisions:

- **Green (attend again):** 3x+ ROI (revenue attributed is 3x the total cost)
- **Yellow (evaluate):** 1x-3x ROI (covers costs but marginal return)
- **Red (don't attend):** Below 1x ROI (didn't cover costs)

For brand/awareness events where direct attribution is difficult:
- Minimum: cost per qualified lead must be below your average CAC
- Track qualitative signals: speaking invitations received, partnerships initiated, press mentions

### Step 7 -- Quality Gate

- [ ] All cost categories are defined (including staff time)
- [ ] Attribution model is chosen with rationale
- [ ] Attribution window matches deal cycle length
- [ ] Lead scoring adjustments are defined
- [ ] Reporting template includes activity, efficiency, and pipeline metrics
- [ ] ROI thresholds are set (green/yellow/red)
- [ ] Breakeven calculation is included
- [ ] No em dashes in any copy

## Output Format

Save to `docs/analytics/event-roi-framework.md`:

```markdown
# Event ROI Framework

Date: {Date}

## Cost Categories
| Category | Includes | How to Calculate |
|----------|----------|-----------------|
| {rows} |

## Attribution Model
- **Primary:** {model and rationale}
- **Attribution window:** {days}
- **Rules:** {how credit is assigned}

## Lead Scoring Adjustments
| Action | Score Adjustment |
|--------|-----------------|
| {rows} |

## Reporting Template

### Event Summary
{Fields to capture}

### Activity Metrics
{Metrics and definitions}

### Efficiency Metrics
{Calculations}

### Pipeline Metrics (30/60/90 day)
{What to measure at each interval}

### ROI Calculation
{Formula and breakeven}

## Decision Thresholds
- **Green (attend again):** {criteria}
- **Yellow (evaluate):** {criteria}
- **Red (skip next time):** {criteria}
```

## Key Principles

1. **Include staff time or the math lies.** A $5K booth that takes 4 people out of the field for 3 days actually costs $15K+. Ignoring opportunity cost inflates ROI artificially.
2. **Track to pipeline, not to leads.** Leads are an activity metric. Pipeline generated within the attribution window is the outcome metric. Optimize for downstream results.
3. **Set thresholds before the event.** Deciding ROI thresholds after you see the numbers is rationalization, not analysis. Commit to green/yellow/red criteria in advance.
4. **Measure at 90 days, not 90 minutes.** Post-event lead counts are not ROI. Pipeline generated and revenue closed within the attribution window is ROI.

## Anti-Patterns

- **Counting badge scans as leads.** A badge scan with no context is not a lead. It's a name. Only count leads that have qualification data attached.
- **Ignoring events that "feel" valuable.** If an event consistently produces good conversations but no pipeline, either the follow-up is broken or the event isn't as valuable as it feels. Measure.
- **One-size-fits-all thresholds.** A $2K local meetup and a $50K conference have different ROI expectations. Set thresholds relative to investment.

## What to Do Next

- Create an **event playbook** for your next event: `/skill event-gtm-playbook`
- Design an **attribution model** for all channels: `/skill attribution-modeler`
- Build a **reporting dashboard**: `/skill outbound-dashboard-spec`

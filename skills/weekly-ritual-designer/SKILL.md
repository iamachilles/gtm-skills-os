---
description: Design a GTM operating rhythm with weekly, monthly, and quarterly meetings. Use when someone says "weekly rituals", "operating rhythm", "meeting cadence", "GTM cadence", "pipeline review cadence", "sales meetings", or "team rhythm"
tools: Read, Write
---

# Weekly Ritual Designer

Design the GTM operating rhythm with five weekly meetings, monthly reviews, and quarterly planning sessions. Each meeting has defined attendees, agenda, duration, and expected outcomes.

An operating rhythm is what turns strategy into execution. Without it, teams react to whatever's loudest. With it, every week has a predictable structure that catches problems early, celebrates wins, and keeps the pipeline moving.

## Inputs

- **Team structure** (required) -- which roles exist (SDR, AE, AM, CSM, marketing, leadership)
- **Current meeting load** (optional) -- what meetings already exist
- **Key metrics** (optional) -- what the team tracks weekly
- **Time zones** (optional) -- team distribution for scheduling
- **Pain points** (optional) -- what's falling through the cracks today

If team structure is missing, ask: "I need your team structure to design the rhythm. Which roles exist on your GTM team?"

## Steps

### Step 0 -- Check for Existing Output

Read `docs/ops/weekly-rituals.md` if it exists. If found, present a summary and ask: "A meeting cadence already exists with {N} weekly meetings. Do you want me to (a) optimize the schedule, (b) redesign agendas, or (c) rebuild from scratch?"

### Step 1 -- Load Context

Read all available context:

1. `docs/ops/sales-process.md` -- what pipeline reviews should cover
2. `docs/analytics/forecast-model.md` -- forecast methodology
3. `docs/ops/handoff-process.md` -- marketing-sales touchpoints
4. `CLAUDE.md` -- project-level instructions

### Step 2 -- Define Weekly Meetings

Design five core weekly meetings:

**Monday: Pipeline Review (45 min)**
- Attendees: Sales manager + AEs
- Agenda: Review pipeline by stage, identify deals that moved/stalled, flag at-risk deals, set weekly priorities
- Expected outcomes: Every AE knows their top 3 deals for the week. Manager knows where to coach.
- Preparation: AEs update CRM deal stages and next steps before Monday 9am.

**Tuesday: Forecast Call (30 min)**
- Attendees: Sales leadership + AE managers
- Agenda: Review commit/best-case/pipeline categories, compare to target, flag gaps, agree on actions
- Expected outcomes: Forecast number locked for the week. Gap-closing actions assigned.
- Preparation: Managers submit team forecast by Tuesday 8am.

**Wednesday: Campaign Standup (30 min)**
- Attendees: Marketing + SDR leadership
- Agenda: Review campaign performance (leads, MQLs, conversion), upcoming launches, content needs, ABM program status
- Expected outcomes: Marketing and SDR aligned on lead quality and volume. Campaign adjustments decided.
- Preparation: Marketing updates campaign dashboard.

**Thursday: Deal Reviews (60 min)**
- Attendees: Sales manager + AEs (rotating 3-4 deals per week)
- Agenda: Deep dive on 3-4 specific deals. For each: stakeholder map, next steps, obstacles, what help is needed.
- Expected outcomes: Each reviewed deal has a clear action plan. Manager provides coaching on deal strategy.
- Preparation: Presenting AEs prepare one-page deal summary.

**Friday: Wins and Learnings (30 min)**
- Attendees: Full GTM team
- Agenda: Celebrate closed deals and major wins. Share one thing that worked and one that didn't. Shoutouts.
- Expected outcomes: Team morale boost. Lessons shared that prevent others from making the same mistakes.
- Preparation: None required. Keep it informal and positive.

### Step 3 -- Design Monthly Reviews

**Monthly Pipeline Review (90 min) -- First Monday of the month**
- Attendees: GTM leadership (VP Sales, VP Marketing, Head of CS)
- Agenda: Full pipeline health assessment, stage conversion analysis, velocity trends, coverage ratio vs. target, marketing attribution review
- Expected outcomes: Leadership aligned on pipeline health and gaps. Resource reallocation decisions made.

**Monthly Retrospective (60 min) -- Last Friday of the month**
- Attendees: Full GTM team
- Agenda: What worked, what didn't, what to change. Review experiments. Celebrate monthly wins.
- Expected outcomes: One process improvement committed for next month.

### Step 4 -- Design Quarterly Reviews

**Quarterly Business Review (QBR) -- First week of new quarter (3 hours)**
- Attendees: GTM leadership + executive team
- Agenda: Previous quarter results vs. targets, pipeline and forecast for new quarter, territory and capacity review, comp plan check, strategic initiative updates
- Expected outcomes: Quarter plan approved. Quotas confirmed. Strategic priorities set.

**Quarterly Planning Session (Half day) -- Second week of new quarter**
- Attendees: GTM leadership + team leads
- Agenda: Campaign planning, ABM account selection, content calendar, hiring plan, tool/process changes
- Expected outcomes: Execution plan for the quarter with owners and deadlines.

### Step 5 -- Create Agenda Templates

For each meeting, create a reusable agenda template with:

- Time allocations per section
- Required pre-work
- Decisions to be made (not just topics to discuss)
- Action item format (who, what, by when)

### Step 6 -- Quality Gate

- [ ] Five weekly meetings defined with distinct purposes (no overlap)
- [ ] Total weekly meeting time is under 4 hours per person (respect calendar space)
- [ ] Every meeting has defined attendees, agenda, duration, and expected outcomes
- [ ] Preparation requirements are specified (so meetings don't waste time on updates that should be async)
- [ ] Monthly and quarterly reviews exist for strategic alignment
- [ ] Friday meeting is morale-positive, not another status update
- [ ] No meeting requires more than 60 minutes weekly (except QBR)

If any check fails, fix it before proceeding.

## Output Format

Save to `docs/ops/weekly-rituals.md`:

```markdown
# GTM Operating Rhythm
Date: {Date}

## Weekly Schedule
| Day | Meeting | Duration | Attendees | Purpose |
|-----|---------|----------|-----------|---------|
| Monday | Pipeline Review | 45 min | {Roles} | {Purpose} |
| Tuesday | Forecast Call | 30 min | {Roles} | {Purpose} |
| Wednesday | Campaign Standup | 30 min | {Roles} | {Purpose} |
| Thursday | Deal Reviews | 60 min | {Roles} | {Purpose} |
| Friday | Wins and Learnings | 30 min | {Roles} | {Purpose} |

## Meeting Details

### Monday: Pipeline Review (45 min)
**Attendees:** {Names/roles}
**Pre-work:** {What to prepare}
**Agenda:**
1. (5 min) Pipeline snapshot: new, moved, stalled, closed
2. (20 min) At-risk deal review: one minute per flagged deal
3. (15 min) Weekly priorities: top 3 deals per AE
4. (5 min) Action items and close
**Expected outcomes:** {Outcomes}

[Continue for each meeting]

## Monthly Cadence
| Meeting | When | Duration | Attendees | Purpose |
|---------|------|----------|-----------|---------|

## Quarterly Cadence
| Meeting | When | Duration | Attendees | Purpose |
|---------|------|----------|-----------|---------|

## Calendar Rules
- No meetings before 9am or after 5pm local time
- Pipeline review data updated by Monday 9am
- Forecast submitted by Tuesday 8am
- Meetings start on time. Latecomers catch up via notes.
- Action items documented within 1 hour of meeting end
```

## Key Principles

1. **Meetings are for decisions, not updates.** If it can be shared async (dashboards, Slack, email), don't waste meeting time on it. Meetings are for discussion and decisions.
2. **Preparation makes meetings work.** A pipeline review where reps update CRM during the meeting is a waste. Pre-work is non-negotiable.
3. **Protect calendar space.** Under 4 hours of weekly meetings per person. Every additional meeting costs selling time. Be ruthless about value.
4. **Friday is for humans.** End the week on a positive note. Celebrate wins. Share learnings. Don't make Friday another status meeting.
5. **Cadence creates predictability.** When everyone knows what happens Monday, Wednesday, and Friday, problems surface faster because there's always a forum within 48 hours.

## Anti-Patterns

- **Meeting overload:** 8+ hours of weekly meetings. Reps spend more time in meetings than selling. Cut ruthlessly.
- **Status meetings disguised as strategy.** Reading dashboards out loud is not a meeting. Send a Loom or a Slack update.
- **No pre-work, so the first 15 minutes is catch-up.** If people aren't prepared, the meeting starts 15 minutes late every week. Enforce pre-work.

## What to Do Next

- Build the **sales process** these meetings review: `/skill sales-process-designer`
- Create the **forecast model** for Tuesday's call: `/skill forecast-model`
- Design the **handoff process** for Wednesday's standup: `/skill handoff-designer`

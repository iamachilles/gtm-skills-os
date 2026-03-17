---
description: Create a full event GTM strategy with pre-event, during-event, and post-event plans. Use when someone says "event strategy", "event playbook", "conference plan", "trade show plan", "event marketing", "event GTM", or "prepare for event"
tools: Read, Write
---

# Event GTM Playbook

Create a complete event GTM strategy covering pre-event outreach, during-event execution, and post-event follow-up. The goal is to turn event attendance into pipeline, not just badge scans.

## Inputs

- **Event name** (required) -- which event
- **Event details** (required) -- date, location, audience size, your presence (booth, speaking, attending)
- **Goals** (required) -- meetings booked, leads captured, pipeline target
- **Target accounts** (optional) -- specific companies or personas to prioritize
- **Budget** (optional) -- available spend

If event name or details are missing, ask: "I need the event name, dates, and how you'll be present (booth, speaking, just attending). What's the event?"

## Steps

### Step 0 -- Check for Existing Output

Read `docs/content/event-playbook-{event-slug}.md` if it exists. If found, present a summary and ask: "A playbook for this event already exists. Do you want me to (a) update it, (b) rebuild for a new year, or (c) keep it?"

### Step 1 -- Load Context

Read all available context:

1. `docs/gtm-triangle.md` -- positioning and ICP
2. `docs/sequences/*.md` -- existing outreach templates
3. `docs/analytics/event-roi-framework.md` -- ROI tracking approach
4. `CLAUDE.md` -- project-level instructions

### Step 2 -- Pre-Event Plan (4 Weeks Out)

**Week 4: Prospect List and Research**
- Build target account list from attendee list (if available) or likely attendees
- Identify 10-20 priority accounts to schedule meetings with
- Research each priority account: recent news, current challenges, mutual connections

**Week 3: Outreach Sequence**
- Email 1: Personalized meeting request referencing the event
- Email 2: Follow-up with specific reason to meet (insight, mutual connection, relevant case study)
- LinkedIn touch: Connect + message referencing the event
- Email 3: Final reminder with calendar link

**Week 2: Social Promotion**
- LinkedIn posts announcing attendance (2-3 posts)
- Comment on event-related content
- Share relevant content that positions you as worth meeting

**Week 1: Logistics**
- Confirm all scheduled meetings with calendar holds
- Prepare conversation starters for each priority account
- Print or prepare materials (one-pagers, business cards, demo devices)

### Step 3 -- During-Event Plan

**Booth/Session Strategy** (if applicable):
- Booth messaging: one-liner that stops foot traffic
- Demo flow: 60-second version (for passing interest) and 5-minute version (for engaged prospects)
- Qualification questions: 3 questions to separate buyers from browsers

**Lead Capture:**
- Method: badge scan + 3 qualification notes per lead
- Qualification notes: pain point mentioned, timeline, budget authority
- Real-time categorization: Hot (meeting scheduled), Warm (follow-up needed), Cold (nurture only)

**Conversation Starters:**
- 3 open-ended questions that surface pain points naturally
- 1 provocative stat or insight that starts a dialogue
- Transition phrase from casual conversation to business relevance

**Team Coordination:**
- Who staffs what and when
- Handoff process for qualified leads
- End-of-day debrief: leads captured, learnings, adjustments for tomorrow

### Step 4 -- Post-Event Plan (Within 72 Hours)

**Within 24 hours:**
- Email all hot leads with meeting follow-up (personalized, referencing conversation)
- Connect on LinkedIn with personal note referencing specific discussion
- Update CRM with all lead data and qualification notes

**Within 48 hours:**
- Email warm leads with relevant content or case study
- Share event recap on LinkedIn (tag relevant connections)

**Within 72 hours:**
- Email cold leads with nurture content
- Complete CRM updates for all leads
- Internal debrief: what worked, what didn't, recommendations for next event

**Follow-up Sequence (Week 1-4):**
- Week 1: Personalized follow-up referencing event conversation
- Week 2: Share relevant content or case study
- Week 3: Soft meeting request
- Week 4: Break-up email or long-term nurture

### Step 5 -- ROI Tracking Framework

Define how you'll measure event success:

| Metric | Target | How to Track |
|--------|--------|-------------|
| Meetings booked (pre-event) | {N} | Calendar |
| Meetings held (at event) | {N} | Manual count |
| Leads captured | {N} | Badge scans + notes |
| Follow-up meetings booked | {N} | CRM |
| Pipeline generated (90 days) | ${N} | CRM |
| Revenue closed (6 months) | ${N} | CRM |
| Cost per meeting | ${N} | Total cost / meetings |

### Step 6 -- Quality Gate

- [ ] Pre-event outreach starts 4 weeks before (not 4 days)
- [ ] Outreach sequence has at least 3 touches
- [ ] Lead capture includes qualification notes, not just badge scans
- [ ] Post-event follow-up plan has specific timelines (24h, 48h, 72h)
- [ ] ROI tracking framework is defined with targets
- [ ] Team roles are assigned
- [ ] No em dashes in any copy

## Output Format

Save to `docs/content/event-playbook-{event-slug}.md`:

```markdown
# Event Playbook: {Event Name}

Date: {Event dates}
Location: {City/Venue}
Presence: {Booth / Speaking / Attending}
Goals: {Key targets}

## Pre-Event (4 Weeks)
### Target Accounts
{Priority account list}
### Outreach Sequence
{Email and LinkedIn templates}
### Social Promotion
{Post schedule}
### Logistics Checklist
{What to prepare}

## During Event
### Booth/Session Plan
{Messaging, demo flow, qualification questions}
### Lead Capture Process
{Method, categorization, qualification notes}
### Conversation Starters
{Questions and talking points}
### Team Assignments
{Who does what}

## Post-Event (72 Hours)
### Follow-Up Timeline
{24h, 48h, 72h actions}
### Follow-Up Sequence
{Week 1-4 emails}
### CRM Updates
{What to log}

## ROI Tracking
| Metric | Target | Actual |
|--------|--------|--------|
| {rows} |

## Debrief Notes
{Fill after event: what worked, what didn't, next time}
```

## Key Principles

1. **The event starts 4 weeks before you arrive.** Most pipeline from events comes from pre-scheduled meetings, not walk-up conversations. Start outreach early.
2. **Qualification beats volume.** 10 qualified conversations beat 100 badge scans. Capture qualification notes, not just contact info.
3. **Follow up within 24 hours or don't bother.** After 72 hours, event leads go cold. The speed of follow-up matters more than the perfection of the email.
4. **Track to pipeline, not to leads.** The metric that matters is pipeline generated within 90 days, not "leads captured." Optimize for downstream outcomes.

## Anti-Patterns

- **The badge-scan-and-pray approach.** Scanning 500 badges with no notes, then sending the same generic email to everyone. This produces zero pipeline.
- **Last-minute planning.** Starting outreach the week of the event. Your target accounts are already fully booked.
- **No post-event follow-up plan.** Attending the event, having great conversations, then letting leads sit in a spreadsheet for two weeks.

## What to Do Next

- Design your **booth strategy**: `/skill booth-strategy`
- Write **event invitations**: `/skill event-invitation-writer`
- Track **event ROI**: `/skill field-event-roi-tracker`

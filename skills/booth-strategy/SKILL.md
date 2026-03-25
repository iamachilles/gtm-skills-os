---
name: booth-strategy
description: Plan a trade show booth strategy. Use when someone says "booth strategy", "trade show booth", "booth plan", "booth messaging", "exhibition plan", "booth design", or "trade show presence"
allowed-tools: Read, Write
metadata:
  author: Achille Morin-Lemoine
  version: "1.0.0"
---

# Booth Strategy

Plan a complete trade show booth strategy covering goals, messaging, demo flow, lead capture, staffing, and pre/post-event briefs for staff. The goal is to maximize qualified conversations, not foot traffic.

## Inputs

- **Event name** (required) -- which event
- **Booth details** (required) -- size, location, setup constraints
- **Goals** (required) -- meetings, leads, demos, brand impressions
- **Team** (required) -- who will staff the booth (names and roles)
- **Product to demo** (optional) -- specific product or feature to showcase
- **Budget** (optional) -- booth spend including design, travel, swag

If event name or booth details are missing, ask: "I need the event name, booth size, and who's staffing it. What are the details?"

## Steps

### Step 0 -- Check for Existing Output

Search the project for any existing output from a previous run of this skill (check common locations like `docs/`, the project root, or any organized output directory). If a previous version is found, present a summary and ask: "A booth strategy for this event already exists. Do you want me to (a) update it, (b) plan for a new year, or (c) keep it?" 

### Step 1 -- Load Context

Search the project for any available context. Look in the project root, `docs/`, or any organized directory. Read what you find:

1. **GTM Triangle** -- positioning and messaging
2. **Event Playbook Event** documents -- if an event playbook exists
3. **Sales** documents -- existing sales materials to adapt
4. `CLAUDE.md` -- project-level instructions

### Step 2 -- Define Booth Goals

Set 3-4 specific, measurable goals:

| Goal | Target | How to Measure |
|------|--------|---------------|
| Meetings booked at booth | {N} | Calendar entries |
| Qualified leads captured | {N} | Lead forms with qualification data |
| Demos delivered | {N} | Staff tally |
| Brand impressions | {N} | Foot traffic estimate |

Prioritize: meetings > qualified leads > demos > impressions. Vanity metrics (badge scans without context) don't count.

### Step 3 -- Design Messaging

**Banner/display copy:**
- Headline: one line that stops someone walking by (under 8 words)
- Subheadline: what you do and for whom (under 15 words)
- Supporting proof point: one metric or customer logo bar

**One-liner** (what staff say when someone approaches):
- Format: "We help {audience} {achieve outcome} by {approach}."
- Must be conversational, not a tagline. Staff should sound human, not scripted.

**Conversation starter** (how to engage passersby):
- A question that surfaces pain: "How are you currently handling {problem}?"
- A provocative stat: "Did you know that {surprising data point}?"
- A relevant giveaway trigger: "We're doing {demo/assessment/audit}. Want to see yours?"

### Step 4 -- Plan Demo Flow

**60-second demo** (for passing interest):
- Problem statement (10 sec)
- Show the one feature that solves it (30 sec)
- Result or proof point (10 sec)
- CTA: "Want me to show you how this works for {their specific case}?" (10 sec)

**5-minute demo** (for engaged prospects):
- Discovery: 2 questions to understand their situation (1 min)
- Problem validation: confirm the pain point (30 sec)
- Demo: show 2-3 features mapped to their stated problem (2 min)
- Proof: case study or metric relevant to their industry (30 sec)
- Next step: book a follow-up meeting on the spot (1 min)

Rule: the 5-minute demo should never become a 20-minute product tour. Keep it focused.

### Step 5 -- Design Lead Capture Process

**Capture method:**
- Badge scan + handwritten or typed qualification notes
- Or: tablet form with 3 required fields

**Qualification questions** (ask every lead):
1. What brought you to our booth? (identifies pain point)
2. How are you handling this today? (identifies current solution)
3. What's your timeline for making a change? (identifies urgency)

**Categorization** (mark immediately after conversation):
- **Hot:** Has budget, timeline, and authority. Book meeting now.
- **Warm:** Has pain and interest but missing budget or timeline. Follow up within 48h.
- **Cold:** Curious but no clear need. Add to nurture.

### Step 6 -- Create Staffing Plan

| Time Slot | Position 1 (Greeter) | Position 2 (Demo) | Position 3 (Closer) |
|-----------|----------------------|--------------------|--------------------|
| {Morning} | {Name} | {Name} | {Name} |
| {Afternoon} | {Name} | {Name} | {Name} |

Roles:
- **Greeter:** Engages passersby, asks conversation starter, routes to demo or closer
- **Demo person:** Delivers 60-sec or 5-min demo based on interest level
- **Closer:** Handles qualified prospects, books meetings, captures detailed notes

Rotation: switch every 2 hours to prevent fatigue.

### Step 7 -- Write Staff Briefs

**Pre-event brief** (send 3 days before):
- Event overview and goals
- Booth location and setup time
- Messaging and one-liner
- Demo flow (60-sec and 5-min versions)
- Lead capture process
- Staffing schedule
- Dress code and logistics

**Post-event brief** (send day after):
- Total leads captured by category
- Meetings booked
- Key learnings (what messaging resonated, common objections, competitor sightings)
- Follow-up assignments
- Debrief meeting date

### Step 8 -- Quality Gate

- [ ] Goals are specific and measurable (not "generate leads")
- [ ] Banner headline is under 8 words
- [ ] One-liner is conversational, not corporate
- [ ] Demo flows have specific time allocations
- [ ] Lead capture includes qualification questions
- [ ] Staffing plan has named people with assigned roles
- [ ] Pre-event and post-event briefs are written
- [ ] No em dashes in any copy

## Output Format

Save the output to your project. Suggested filename: `booth-strategy-{event-slug}.md`

```markdown
# Booth Strategy: {Event Name}

Date: {Event dates}
Booth: {Size, location}
Team: {Names}

## Goals
| Goal | Target |
|------|--------|
| {rows} |

## Messaging
### Banner Copy
{Headline, subheadline, proof point}
### One-Liner
{Conversational pitch}
### Conversation Starters
{3 options}

## Demo Flow
### 60-Second Version
{Script}
### 5-Minute Version
{Script}

## Lead Capture
### Qualification Questions
{3 questions}
### Categorization
{Hot/Warm/Cold criteria}

## Staffing Plan
{Schedule with roles}

## Pre-Event Brief
{Brief for staff}

## Post-Event Brief Template
{Template to fill after event}
```

## Key Principles

1. **Qualify, don't collect.** 50 qualified leads with notes beat 500 badge scans. Every conversation should produce actionable data.
2. **The one-liner is the most important asset.** If staff can't explain what you do in one sentence, no amount of booth design will help.
3. **Demos should be conversations, not presentations.** Start by asking about their problem, then show how you solve it. A demo that doesn't connect to their pain is a product tour nobody asked for.
4. **Staff energy is a finite resource.** Rotate every 2 hours. Tired staff deliver bad experiences.

## Anti-Patterns

- **The passive booth.** Staff standing behind a table waiting for people to approach. If you're not engaging passersby, you're furniture.
- **The 20-minute demo trap.** Starting a full product walkthrough for every person who stops by. Most need the 60-second version. Qualify before expanding.
- **No lead capture notes.** Scanning a badge without writing down what you discussed. That scan is worthless without context.

## What to Do Next

- Create the **full event playbook**: `/skill event-gtm-playbook`
- Write **event invitations** to drive booth traffic: `/skill event-invitation-writer`
- Track **event ROI**: `/skill field-event-roi-tracker`

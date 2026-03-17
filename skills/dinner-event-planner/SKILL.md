---
description: Plan an executive dinner event with guest selection, invitation sequence, and follow-up. Use when someone says "executive dinner", "dinner event", "VIP dinner", "prospect dinner", "account dinner", "intimate event", or "roundtable dinner"
tools: Read, Write
---

# Dinner Event Planner

Plan an executive dinner from guest selection through post-event follow-up. Executive dinners are the highest-conversion ABM tactic when done right: intimate, conversation-driven, no slides, no pitches, just a valuable evening that builds trust and accelerates relationships.

Hard cap: 8-12 guests maximum. Below 8, conversations feel forced. Above 12, it stops being intimate and becomes a networking event.

## Inputs

- **Event name/theme** (required) -- what the dinner is about
- **Target guest profile** (required) -- title, company stage, and relationship criteria
- **Date and location** (optional) -- when and where
- **Host(s)** (optional) -- who from your team will host
- **Budget** (optional) -- total event budget
- **Objective** (optional) -- relationship building, deal acceleration, or community building

If guest profile is missing, ask: "Who should be at this dinner? I need the target title level, company criteria, and ideal relationship stage (cold prospect, warm lead, existing customer)."

## Steps

### Step 0 -- Check for Existing Output

Read `docs/sales/dinner-event-{name-slug}.md` if it exists. If found, present a summary and ask: "A dinner event plan already exists for {name}. Do you want me to (a) update the guest list, (b) redesign the agenda, or (c) rebuild from scratch?"

### Step 1 -- Load Context

Read all available context:

1. `docs/account-tiering-model.md` -- identify Tier 1 accounts
2. `docs/sales/account-plays/*.md` -- relationship context per account
3. `docs/personas/*.md` -- understand the guest persona
4. `docs/sales/abm-campaign-*.md` -- active campaigns this supports
5. `CLAUDE.md` -- project-level instructions

### Step 2 -- Define Guest Criteria

Set specific, filterable criteria:

- **Title level:** VP+ or C-suite only (no managers, no ICs)
- **Company criteria:** Industry, size, stage that matches your ICP
- **Relationship stage:** Mix of warm prospects (60%), existing customers (30%), and strategic new targets (10%)
- **Geographic proximity:** Within reasonable travel distance of venue
- **Diversity of perspective:** Avoid filling the table with competitors. Mix industries or functions for richer conversation.

Build a guest list of 15-18 names (to account for 30-40% decline rate and reach your 8-12 target).

### Step 3 -- Design Invitation Sequence (3-Touch)

Create a three-touch invitation sequence:

**Touch 1 -- Personal Email (4-5 weeks before):**
- From the host personally, not from marketing
- Reference why this specific person was invited
- Describe the format (intimate dinner, no slides, conversation-driven)
- Name 2-3 confirmed guests to create social proof
- Clear RSVP mechanism

**Touch 2 -- LinkedIn Message (3 weeks before, if no response):**
- Short, conversational follow-up
- Add one more confirmed guest name
- Restate the value of attending

**Touch 3 -- Final Email (2 weeks before, if no response):**
- "Last few seats" framing
- Final confirmed guest list
- Deadline to RSVP

Each message must be under 150 words. The invitation should feel exclusive, not mass-produced.

### Step 4 -- Plan Agenda (No Slides)

Design a conversation-driven evening:

- **6:30 PM -- Arrivals and cocktails** (30 min): Casual mingling. Host makes personal introductions between guests who should know each other.
- **7:00 PM -- Seated dinner begins** (15 min): Host welcomes the group. Brief framing of the evening's theme. No company pitch.
- **7:15 PM -- Guided discussion round 1** (30 min): Opening question that gets everyone sharing. Industry challenge or trend.
- **7:45 PM -- Guided discussion round 2** (30 min): Deeper question tied to the theme. "What's working, what's not."
- **8:15 PM -- Open conversation** (30 min): Let the table go where it wants.
- **8:45 PM -- Wrap and next steps** (15 min): Host summarizes key takeaways. Mentions follow-up (content share, individual meetings).
- **9:00 PM -- Departures**

Total: 2.5 hours maximum. Respect everyone's time.

### Step 5 -- Create Conversation Starters and Talking Points

Write 5-7 discussion questions that:

- Are genuinely interesting to the guests (not leading questions about your product)
- Invite sharing of experience and perspective
- Build connection between guests (not just between guests and host)
- Naturally surface challenges your product/service addresses (without ever mentioning it)

Examples:
- "What's the biggest shift in how your team operates compared to two years ago?"
- "Where are you seeing the most resistance to change in your organization?"
- "What's one bet you're making this year that most of your peers aren't?"

### Step 6 -- Design Follow-Up Sequence

Post-event follow-up within 48 hours:

**Day 1 (next morning):**
- Personal email to each guest thanking them
- Reference one specific thing from their contribution to the conversation
- Share any promised resources or connections

**Day 3-5:**
- Send a summary of key themes discussed (positions you as the curator)
- Include a relevant content piece that extends the conversation

**Day 7-10:**
- Request 1:1 meeting with priority guests
- "Our conversation about {topic} stuck with me. I'd love to continue it and share {specific value}."

### Step 7 -- Quality Gate

- [ ] Guest list targets 8-12 attendees (hard cap)
- [ ] Invitation list has 15-18 names to account for declines
- [ ] Three-touch invitation sequence exists with escalating urgency
- [ ] Agenda has zero slides and zero product pitches
- [ ] Discussion questions are genuinely interesting, not leading
- [ ] Follow-up sequence includes personalized references to each guest's contributions
- [ ] Total event duration is 2.5 hours or less
- [ ] Guest mix includes existing customers for social proof

If any check fails, fix it before proceeding.

## Output Format

Save to `docs/sales/dinner-event-{name-slug}.md`:

```markdown
# Executive Dinner: {Event Name}
Date: {Date}
Location: {Venue}
Host(s): {Names}
Target attendance: {8-12}
Budget: ${Amount}

## Guest Criteria
- **Title:** {Level}
- **Company:** {Criteria}
- **Relationship mix:** {%}

## Guest List
| # | Name | Title | Company | Relationship | Status |
|---|------|-------|---------|-------------|--------|
| 1 | {Name} | {Title} | {Company} | {Stage} | Invited |

## Invitation Sequence

### Touch 1 -- Personal Email (Week -5)
**Subject:** {Subject line}
**Body:**
{Email text}

### Touch 2 -- LinkedIn Message (Week -3)
{Message text}

### Touch 3 -- Final Email (Week -2)
**Subject:** {Subject line}
**Body:**
{Email text}

## Evening Agenda
| Time | Activity | Notes |
|------|----------|-------|
| 6:30 PM | Arrivals and cocktails | {Host introduction plan} |
| 7:00 PM | Welcome | {Framing notes} |
| 7:15 PM | Discussion Round 1 | {Question} |
| 7:45 PM | Discussion Round 2 | {Question} |
| 8:15 PM | Open conversation | {Backup questions} |
| 8:45 PM | Wrap | {Closing notes} |

## Discussion Questions
1. {Question}
2. {Question}
3. {Question}
4. {Question}
5. {Question}

## Follow-Up Sequence
| Day | Action | Template |
|-----|--------|----------|
| 1 | Thank-you email | {Template} |
| 3-5 | Theme summary | {Template} |
| 7-10 | 1:1 request | {Template} |
```

## Key Principles

1. **No slides, no pitches, no logos.** The moment you project a slide, it becomes a sales event. Keep it conversational. Your brand is built through the quality of the experience.
2. **8-12 guests is the sweet spot.** Small enough that everyone speaks. Large enough that conversations are dynamic. This is non-negotiable.
3. **The follow-up is where deals start.** The dinner builds trust. The follow-up converts it. A dinner without follow-up is just an expensive meal.
4. **Mix your guests strategically.** Existing customers provide social proof. Warm prospects are most likely to attend. A few stretch invites show ambition.

## Anti-Patterns

- **Turning it into a pitch:** Showing slides, doing a product demo, or having a "brief presentation." Guests came for conversation, not a sales meeting.
- **Inviting too many people:** 15+ guests turns an intimate dinner into a networking event. Stick to the cap.
- **No follow-up:** Hosting a great dinner and then going silent. Every guest should hear from you within 48 hours with a personalized note.

## What to Do Next

- Design **account plays** for dinner attendees: `/skill account-play-designer`
- Write **executive briefings** for key guests: `/skill executive-briefing`
- Plan **gifting** as dinner follow-up: `/skill gifting-strategy`

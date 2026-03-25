---
name: webinar-planner
description: Plan a webinar end-to-end with agenda, promotion plan, follow-up sequence, and repurposing strategy. Use when someone says "plan a webinar", "webinar outline", "webinar agenda", "online event", "live session plan", or "virtual workshop"
allowed-tools: Read, Write
metadata:
  author: Achille Morin-Lemoine
  version: "1.0.0"
---

# Webinar Planner

Plan a webinar from concept to post-event follow-up. A webinar is not a slide presentation over Zoom. It's a live event that creates urgency, delivers value, and generates pipeline. This skill covers the full lifecycle: format, content, promotion, delivery, and repurposing.

## Inputs

- **Topic** (required) -- what the webinar covers
- **Speakers** (required) -- who is presenting (names, roles, expertise)
- **Target audience** (required) -- who should attend
- **Duration** (optional) -- target length in minutes (default: 45 minutes)
- **Format preference** (optional) -- solo, interview, panel, or workshop

If topic, speakers, or audience are missing, ask: "I need the webinar topic, who's speaking, and who it's for. What are you teaching, who's presenting, and who should be in the audience?"

## Steps

### Step 0 -- Check for Existing Output

Read content documents. If found, ask: "A webinar plan for [topic] already exists. Do you want me to (a) update the agenda, (b) revise the promotion plan, or (c) rebuild?"

### Step 1 -- Load Context

Read available context:

1. **Persona profiles** -- target audience profiles
2. **Content strategy** -- content positioning
3. **GTM Triangle** -- market positioning
4. **Value proposition mapping** -- value props
5. `CLAUDE.md` -- project-level instructions

### Step 2 -- Define Format

Choose the format based on topic and speakers:

**Solo Presentation** -- one speaker, deep expertise. Best for methodology reveals or data presentations. Risk: monotone delivery without interaction.

**Interview/Fireside Chat** -- host + guest. Best for thought leadership and borrowed audience. Risk: can feel unstructured without prep.

**Panel** -- moderator + 2-3 panelists. Best for multi-perspective topics. Risk: diffuse points and long answers.

**Workshop** -- interactive, attendees do exercises. Best for skill-building and tools. Risk: tech issues with interactive elements.

### Step 3 -- Write Title and Description

**Title:** Under 10 words, benefit-focused. State what the attendee will get, not what you'll talk about.
- Bad: "A Discussion on B2B Outbound Strategies"
- Good: "3 Outbound Plays That Book Meetings in 2024"

**Description (3 sections):**
1. The problem (why this matters now)
2. What you'll learn (3 bullet points, each starting with a verb)
3. Who this is for (specific roles or situations)

Keep description under 150 words.

### Step 4 -- Outline Agenda

Structure with timing for each section:

| Time | Section | Content | Notes |
|---|---|---|---|
| 0:00-2:00 | Welcome | Housekeeping, introduce speakers | Keep tight |
| 2:00-7:00 | Context Setting | Why this topic, why now | Data or story hook |
| 7:00-30:00 | Core Content | 3-4 main sections | The value delivery |
| 30:00-40:00 | Q&A | Audience questions | Seed 2-3 questions in advance |
| 40:00-45:00 | Wrap-up + CTA | Key takeaway, next step, offer | One clear CTA |

For the Core Content section, write a brief for each sub-section:
- What's covered
- Key takeaway
- Transition to next section
- Interaction point (poll, question, exercise)

### Step 5 -- Write Promotion Plan

**2-week promotion runway:**

**Week -2 (launch):**
- Registration page live with title, description, speakers, date/time
- Email 1 to list: announcement
- LinkedIn post 1: topic hook + registration link
- Speaker social posts (provide copy)

**Week -1 (build momentum):**
- Email 2: "Here's what we'll cover" (agenda teaser)
- LinkedIn post 2: specific insight preview
- LinkedIn post 3: speaker credibility + why this matters

**Day of:**
- Email 3: "Starting in 2 hours" reminder
- LinkedIn post: "Going live in 1 hour"

**Post-event (day of + day after):**
- Email 4: replay link + key takeaways (to attendees)
- Email 5: "You missed this" + replay link (to no-shows)

Write draft copy for each email subject line and LinkedIn post hook.

### Step 6 -- Design Follow-Up Sequence

**For attendees (3 emails over 5 days):**
1. Day 0: Replay + slides + key resources
2. Day 2: Deeper dive on one topic (link to blog or resource)
3. Day 5: CTA (book a call, download resource, join community)

**For no-shows (2 emails over 3 days):**
1. Day 1: Replay link + "Here's what you missed" summary
2. Day 3: Best insight from the webinar + CTA

### Step 7 -- Plan Repurposing

Map webinar content to derivative assets:
- Blog post summarizing key points
- 3-5 LinkedIn posts from specific insights
- Carousel from the framework or steps presented
- Short video clips (identify 2-3 clip-worthy moments in the agenda)
- Newsletter edition featuring the webinar content

### Step 8 -- Quality Gate

- [ ] Title is under 10 words and benefit-focused
- [ ] Description has problem, learning outcomes, and audience
- [ ] Agenda has timing for every section
- [ ] At least 2 interaction points in the agenda
- [ ] Promotion plan covers 2 weeks with specific touchpoints
- [ ] Follow-up sequences differentiate attendees from no-shows
- [ ] Repurposing plan identifies at least 5 derivative assets
- [ ] All email subject lines and LinkedIn hooks are drafted

If any check fails, fix it before proceeding.

## Output Format

Save the output to your project. Suggested filename: `webinar-{topic-slug}.md`

```markdown
# Webinar Plan: [Title]
Format: [Solo/Interview/Panel/Workshop] | Duration: [Min] | Speakers: [Names] | Date: [Date]

## Title and Description
**Title:** [Title] | **Description:** [Full description]

## Agenda
| Time | Section | Content | Interaction |
|---|---|---|---|
[Full agenda table with section briefs below]

## Promotion Plan
[Week -2, Week -1, Day Of: email subjects + LinkedIn hooks for each]

## Follow-Up Sequences
[Attendees: 3 emails | No-Shows: 2 emails -- subject lines and timing]

## Repurposing Plan
| Asset | Source Section | Priority |
|---|---|---|
[Derivative assets table]

## Logistics Checklist
[Registration, calendar invite, speaker prep, slides, recording, seeded Q&A]
```

## Key Principles

1. **The webinar starts at promotion, not at "welcome."** Half the battle is getting registrations. The promotion plan is as important as the content plan.
2. **Interaction prevents drop-off.** A webinar without polls, questions, or exercises loses 50% of attendees by the midpoint. Plan interaction every 10 minutes.
3. **No-shows are still leads.** Someone who registered but didn't attend expressed interest. The follow-up sequence for no-shows matters as much as the attendee sequence.
4. **One webinar, ten content pieces.** Every webinar should produce a month of derivative content. Plan for repurposing before you go live.

## Anti-Patterns

- **The 60-minute monologue:** No interaction, no Q&A, just slides. Attendees will leave after 15 minutes.
- **Zero follow-up:** Hosting the webinar and never contacting registrants again. The webinar is the beginning of the conversation, not the end.
- **Promoting to nobody:** Launching the registration page without a promotion plan. Two weeks of consistent multi-channel promotion is the minimum.

## What to Do Next

- Write **LinkedIn posts** for the promotion plan: `/skill write-linkedin-post`
- Create the **follow-up email sequence**: `/skill nurture-sequence-writer`
- Build **repurposed content** from the recording: `/skill content-repurposer`

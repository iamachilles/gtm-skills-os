---
description: Write follow-up sequences for inbound leads by source type. Use when someone says "inbound follow-up", "demo request follow-up", "content download follow-up", "webinar follow-up", "lead follow-up", "inbound sequence", or "respond to inbound"
tools: Read, Write
---

# Inbound Follow-Up Sequence

Write source-specific follow-up sequences for inbound leads: demo requests, content downloads, and webinar attendees. Each source type has different intent levels and requires a different cadence, tone, and qualification approach. The one constant: speed wins. A 5-minute response converts 10x better than 30 minutes.

## Inputs

- **Lead source** (required) -- demo request, content download, or webinar attendee
- **Content/event details** (optional) -- what they downloaded, which webinar they attended
- **Persona** (optional) -- who is the typical inbound lead for this source
- **Qualification criteria** (optional) -- what makes a lead sales-ready
- **Booking link** (optional) -- calendar URL for meeting CTAs

If lead source is missing, ask: "I need to know the lead source to write the right sequence. Is this for demo requests, content downloads, or webinar attendees?"

## Steps

### Step 0 -- Check for Existing Output

Read `docs/sequences/inbound-follow-up-{source-slug}.md` if it exists. If found, present a summary and ask: "An inbound follow-up sequence for this source already exists. Do you want me to (a) update content references, (b) refine copy, or (c) rebuild from scratch?"

### Step 1 -- Load Context

Read all available context:

1. `docs/personas/*.md` -- persona profiles for typical inbound leads
2. `docs/messaging-matrix.md` -- messaging for inbound personas
3. `docs/sales-narratives.md` -- narrative framing
4. `CLAUDE.md` -- project-level instructions

Identify the intent level for this source:
- Demo request = high intent (they asked to see the product)
- Content download = medium intent (they're researching)
- Webinar attendee = medium-low intent (they're learning, not necessarily buying)

### Step 2 -- Write Source-Specific Sequence

Write the full sequence for the specified lead source:

**Demo Request (High Intent)**

Touch 1 (within 5 minutes):
- Confirm receipt and express readiness to help
- Include 2-3 specific time slots or a booking link
- Reference what they requested: "You asked about {specific topic}"
- Under 60 words. Speed over polish.

Touch 2 (4 hours later, if no response):
- Add value: share a relevant resource or quick insight
- Repeat the booking link
- Under 60 words

Touch 3 (Next day):
- Different angle: share a proof point relevant to their likely situation
- Final booking push: "If this week doesn't work, here's my calendar for next week."
- Under 80 words

**Content Download (Medium Intent)**

Touch 1 (within 1 hour):
- Acknowledge the download. Don't gate-keep (they already have the content).
- Add something the content didn't cover: a related insight or companion resource
- No meeting CTA. Ask a qualifying question instead.
- Under 80 words

Touch 2 (Day 3):
- Share a related piece of content or an insight that builds on what they downloaded
- Include a qualifying question: "What prompted you to look into {topic}?"
- Under 80 words

Touch 3 (Day 7):
- Share a proof point or case study related to the content topic
- Soft CTA: "If you're evaluating options, happy to share what's worked for similar teams."
- Under 80 words

Touch 4 (Day 14):
- Direct but respectful CTA
- Reference the content journey: "Since you were looking into {topic}, thought a quick conversation might be useful."
- Under 80 words

**Webinar Attendee (Medium-Low Intent)**

Touch 1 (within 2 hours of webinar ending):
- Reference the webinar by name and a specific topic discussed
- Share the recording and/or slides
- No CTA. Pure value delivery.
- Under 80 words

Touch 2 (Day 3):
- Share a resource that goes deeper on a topic from the webinar
- Ask what resonated: "Any topics from the session that are relevant to what you're working on?"
- Under 80 words

Touch 3 (Day 7):
- Share a proof point or result related to the webinar content
- CTA: "Worth a 15-minute conversation to see if this applies to your situation?"
- Under 80 words

### Step 3 -- Include Qualification Questions

For each source type, embed 1-2 qualification questions across the sequence:

- Demo request: "What's driving the evaluation? Is there a timeline you're working toward?"
- Content download: "What prompted you to look into {topic}? Is this a priority right now?"
- Webinar attendee: "Are you actively exploring solutions in this space, or more in research mode?"

These questions serve dual purposes: they show genuine interest and they qualify the lead for sales handoff.

### Step 4 -- Define Handoff Criteria

Define when a lead is ready for sales:

| Signal | Action |
|--------|--------|
| Books a meeting | Sales takes over immediately |
| Replies with buying language ("evaluating," "timeline," "budget") | Sales takes over |
| Replies with interest but no urgency | Continue nurturing, flag for sales awareness |
| Downloads multiple content pieces | Flag as marketing-qualified, sales reviews |
| No response after full sequence | Enter long-term nurture |

### Step 5 -- Quality Gate

Run these checks before saving:

- [ ] Demo request Touch 1 goes out within 5 minutes
- [ ] Content download Touch 1 goes out within 1 hour
- [ ] Webinar follow-up Touch 1 goes out within 2 hours
- [ ] All touches are under 80 words (demo Touch 1-2 under 60)
- [ ] Demo sequence has 3 touches over 48 hours
- [ ] Content sequence has 4 touches over 14 days
- [ ] Webinar sequence has 3 touches over 7 days
- [ ] At least 1 qualifying question per source type
- [ ] Handoff criteria are defined with specific actions
- [ ] No em dashes in any copy
- [ ] No touch is a generic "thanks for downloading/attending"

If any check fails, fix it before proceeding.

## Output Format

Save to `docs/sequences/inbound-follow-up-{source-slug}.md`:

```markdown
# Inbound Follow-Up: {Source Type}
Date: {Date}
Intent level: {High/Medium/Medium-Low}
Total touches: {N}
Duration: {timeframe}

## Speed Requirements
- First response within: {5 min / 1 hour / 2 hours}
- Rationale: {why speed matters for this source}

## Sequence

### Touch 1 -- {Timing}
**Subject:** {subject line}
**Body:**
{Full email text}
Word count: {count}

### Touch 2 -- {Timing}
**Subject:** {subject line}
**Body:**
{Full email text}
Word count: {count}

[Continue for all touches]

## Qualification Questions
1. {Question and when to ask it}
2. {Question and when to ask it}

## Sales Handoff Criteria
| Signal | Action |
|--------|--------|
| Books meeting | Sales takes over |
| Buying language | Sales takes over |
| Interest, no urgency | Continue nurturing |
| Multiple downloads | Flag as MQL |
| No response | Enter long-term nurture |

## Post-Sequence
- Responders: {where they go}
- Non-responders: {where they go -- typically nurture sequence}
```

## Key Principles

1. **Inbound speed matters. A 5-minute response converts 10x better than 30 minutes.** For demo requests, this is non-negotiable. Automate Touch 1 if you have to.
2. **Match your intensity to their intent.** A demo request gets 3 touches in 48 hours. A webinar attendee gets 3 touches in 7 days. Different signals, different urgency.
3. **Qualify, don't interrogate.** Qualification questions should feel like genuine curiosity, not a form fill. Embed them naturally in value-adding emails.
4. **The handoff criteria prevent leads from dying.** Without clear rules for when sales takes over, leads fall into a gap between marketing and sales. Define the handoff and enforce it.
5. **Post-sequence routing is mandatory.** Every lead that finishes the sequence must go somewhere: active sales pipeline or long-term nurture. No orphaned leads.

## Anti-Patterns

- **Generic "thanks for downloading" emails.** If the first thing they read after downloading your guide is a bland confirmation, you've wasted the highest-attention moment in the journey.
- **Treating all inbound leads the same.** A demo request has 10x the intent of a webinar attendee. If they get the same sequence, you're under-serving high intent and over-pressuring low intent.
- **No follow-up after Touch 1.** One email after a demo request is not a sequence. It's a single point of failure. Build the cadence.

## What to Do Next

- Transition non-responders to **long-term nurture**: `/skill nurture-sequence-writer`
- Prepare **reply templates** for common inbound responses: `/skill reply-handler`
- Design **A/B test** to optimize response rates: `/skill ab-test-designer`

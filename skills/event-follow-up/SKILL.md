---
name: event-follow-up
description: Write post-event follow-up sequences for speakers, attendees, and booth visitors. Use when someone says "event follow-up", "conference follow-up", "post-event email", "trade show follow-up", "webinar follow-up", or "event outreach"
allowed-tools: Read, Write
metadata:
  author: Achille Morin-Lemoine
  version: "1.0.0"
---

# Event Follow-Up

Write a 3-touch post-event follow-up sequence with variants for speakers, attendees, and booth visitors. Events create a natural reason to connect. The follow-up sequence turns a brief interaction into a business conversation. Speed matters: the first touch goes out within 24 hours or the moment decays.

## Inputs

- **Event name** (required) -- the event you attended
- **Contact list** (optional) -- names, titles, companies of people you met
- **Notes** (optional) -- specific conversations, topics discussed, shared moments
- **Event theme** (optional) -- the main topic or industry focus
- **Your role at the event** (optional) -- speaker, attendee, exhibitor, sponsor

If event name is missing, ask: "I need the event name and any notes from your interactions. What event are we following up from?"

## Steps

### Step 0 -- Check for Existing Output

Search the project for any existing output from a previous run of this skill (check common locations like `docs/`, the project root, or any organized output directory). If a previous version is found, present a summary and ask: "An event follow-up sequence for this event already exists. Do you want me to (a) add new contact variants, (b) refine existing copy, or (c) rebuild from scratch?" 

### Step 1 -- Load Context

Search the project for any available context. Look in the project root, `docs/`, or any organized directory. Read what you find:

1. **Persona profiles** -- persona profiles for the contacts
2. **Messaging matrix** -- relevant messaging angles
3. `CLAUDE.md` -- project-level instructions

Group contacts by type: speakers, general attendees, booth visitors. Each group gets a different sequence variant.

### Step 2 -- Write Touch 1 (Within 24 Hours)

Write three variants of Touch 1:

**For Speakers:**
- Reference their talk or a specific point they made
- Connect that point to a shared interest or challenge
- Keep it brief. They got 50 of these. Stand out with specificity.
- Under 80 words

**For Attendees:**
- Reference a specific shared moment: a session you both attended, a conversation at lunch, a question from the audience
- If you didn't have a direct interaction, reference a shared session and add your perspective
- Under 80 words

**For Booth Visitors:**
- Reference what they asked about or showed interest in
- Provide the specific follow-up they were promised (demo, resource, pricing)
- Under 80 words

No CTA in Touch 1. This is about reconnecting, not selling.

### Step 3 -- Write Touch 2 (Day 3)

Add value related to the event theme:

- Share a resource, insight, or takeaway from the event
- Connect it to something relevant to their role
- Make it useful whether or not they engage further
- Under 80 words
- Soft CTA: "Thought this might be useful" or "Happy to share more on this"

Write one version that works across all contact types, with personalization fields for specifics.

### Step 4 -- Write Touch 3 (Day 7)

Transition to business value:

- Bridge from the event connection to a relevant business conversation
- Reference the shared context from the event to make it feel natural
- Clear CTA: suggest a specific meeting or call
- Under 80 words

Write one version that works across all contact types.

### Step 5 -- Quality Gate

Run these checks before saving:

- [ ] Touch 1 has three variants (speaker, attendee, booth visitor)
- [ ] Touch 1 goes out within 24 hours of the event
- [ ] Touch 1 contains no CTA (pure reconnection)
- [ ] Touch 2 adds genuine value related to the event theme
- [ ] Touch 3 has a clear, specific CTA
- [ ] All touches are under 80 words
- [ ] Each touch references the event specifically (not generic "nice to meet you")
- [ ] No em dashes in any copy
- [ ] Timing follows 24h, Day 3, Day 7 cadence

If any check fails, fix it before proceeding.

## Output Format

Save the output to your project. Suggested filename: `event-follow-up-{event-slug}.md`

```markdown
# Event Follow-Up: {Event Name}
Date: {Date}
Event date: {Event date}
Your role: {Speaker/Attendee/Exhibitor}

## Touch 1 -- Reconnect (Within 24 Hours)

### For Speakers
**Subject:** {subject line}
**Body:**
{Full email text}
Word count: {count}/80

### For Attendees
**Subject:** {subject line}
**Body:**
{Full email text}
Word count: {count}/80

### For Booth Visitors
**Subject:** {subject line}
**Body:**
{Full email text}
Word count: {count}/80

## Touch 2 -- Add Value (Day 3)
**Subject:** {subject line}
**Body:**
{Full email text}
Word count: {count}/80

## Touch 3 -- Business CTA (Day 7)
**Subject:** {subject line}
**Body:**
{Full email text}
Word count: {count}/80

## Contact Personalization Notes
| Contact | Type | Specific Reference | Priority |
|---------|------|--------------------|----------|
| {Name} | Speaker | {what to reference} | {High/Med/Low} |
| {Name} | Attendee | {what to reference} | {High/Med/Low} |

## Timing Checklist
- [ ] Touch 1 sent within 24 hours of event end
- [ ] Touch 2 scheduled for Day 3
- [ ] Touch 3 scheduled for Day 7
```

## Key Principles

1. **24-hour window is non-negotiable.** After 48 hours, event follow-ups feel stale. After a week, they're forgotten. Send Touch 1 within 24 hours.
2. **Specificity is your advantage.** Everyone sends "great meeting you at {event}." The person who references a specific talk, question, or conversation stands out.
3. **Reconnect before you sell.** Touch 1 has no CTA. You're rebuilding the connection, not monetizing it. The CTA comes in Touch 3 after you've added value.
4. **Events create permission.** A shared event is a legitimate reason to connect. Use it. Don't waste it on a generic template.

## Anti-Patterns

- **"Great meeting you at {event}."** This is the most common follow-up opening and the most forgettable. Reference something specific or don't reference the event at all.
- **Pitching in Touch 1.** The fastest way to undo the goodwill from a real interaction. Reconnect first, sell later.
- **Waiting a week to follow up.** By then, they've forgotten your face and your name. Speed is the variable you control.

## What to Do Next

- Add **personalization snippets** for each contact: `/skill outreach-personalizer`
- Write **individual cold emails** for high-priority contacts: `/skill cold-email-writer`
- Transition non-responders to a **nurture sequence**: `/skill nurture-sequence-writer`

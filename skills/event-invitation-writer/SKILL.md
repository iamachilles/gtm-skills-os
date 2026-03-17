---
description: Write event invitation email sequences. Use when someone says "event invitation", "invite to event", "event email", "event outreach", "event RSVP", "invite sequence", or "event save the date"
tools: Read, Write
---

# Event Invitation Writer

Write a 4-touch invitation sequence plus LinkedIn variant and day-before reminder. Each touch serves a distinct purpose, and the sequence builds urgency naturally without being pushy.

## Inputs

- **Event details** (required) -- name, date, time, location (or virtual link), agenda highlights
- **Guest list type** (required) -- prospects, customers, partners, or mixed
- **Event value prop** (required) -- why someone should attend (speaker, topic, networking, exclusivity)
- **Capacity** (optional) -- seat limit (creates natural urgency)
- **Speakers/agenda** (optional) -- notable speakers or agenda items to feature

If event details or guest list type is missing, ask: "I need the event details (name, date, location) and who you're inviting. What's the event?"

## Steps

### Step 0 -- Check for Existing Output

Read `docs/sequences/event-invitation-{event-slug}.md` if it exists. If found, present a summary and ask: "An invitation sequence for this event already exists. Do you want me to (a) update it, (b) write for a different audience, or (c) keep it?"

### Step 1 -- Load Context

Read all available context:

1. `docs/gtm-triangle.md` -- positioning context
2. `docs/content/event-playbook-{event-slug}.md` -- event playbook if it exists
3. `docs/sequences/*.md` -- existing sequences for tone consistency
4. `CLAUDE.md` -- project-level instructions

### Step 2 -- Write Touch 1: Save the Date (4 Weeks Out)

Purpose: get the date on their calendar before it fills up.

- **Subject line:** Short, event-focused. No hype.
- **Body:** 3-4 sentences max. What, when, where, why it matters. No full agenda yet.
- **CTA:** "Save the date" or "Mark your calendar." Not a full registration ask yet.
- **Tone:** Informational, not salesy. They're hearing about this for the first time.

### Step 3 -- Write Touch 2: Formal Invite (2 Weeks Out)

Purpose: full details and registration ask.

- **Subject line:** Specific benefit or speaker announcement
- **Body:** Full details. Agenda highlights, speaker bios (2 lines each), what attendees will walk away with. Address "why should I spend my time on this?"
- **CTA:** Clear registration link with deadline
- **Social proof:** If others have registered, mention it. "30 GTM leaders have already confirmed."

### Step 4 -- Write Touch 3: Reminder with Social Proof (1 Week Out)

Purpose: convert the maybes.

- **Subject line:** Urgency-driven. Reference speakers, limited seats, or agenda update.
- **Body:** New information (speaker announcement, agenda update, or attendee list highlight). Don't just repeat Touch 2.
- **CTA:** Register now + reason for urgency (limited seats, agenda finalizing)
- **Social proof:** Specific names or companies attending (with permission), or total registrations

### Step 5 -- Write Touch 4: Final Reminder (2 Days Out)

Purpose: last chance for fence-sitters.

- **Subject line:** Direct and final. "Last chance" or specific seat count remaining.
- **Body:** 2-3 sentences. Assume they've read previous emails. Just the essential details and the CTA.
- **CTA:** Register or reply to confirm
- **Urgency:** Specific (e.g., "4 seats remaining" not "spots are filling up")

### Step 6 -- Write LinkedIn Message Variant

Adapt the invitation for LinkedIn DM:

- **Format:** Under 300 characters for the initial message
- **Approach:** Personal, conversational. Reference a shared connection, mutual interest, or reason you thought of them specifically.
- **CTA:** "Would this be relevant for you?" not "Register here"
- **Follow-up:** One follow-up message if no response (3 days later)

### Step 7 -- Write Confirmed Attendee Reminder (Day Before)

Purpose: reduce no-shows and build excitement.

- **Subject line:** "See you tomorrow" or logistics-focused
- **Body:** Logistics (time, location/link, parking/access), what to prepare (if anything), agenda teaser
- **Tone:** Warm, excited, practical
- **CTA:** "Reply if anything changes" (lowers no-show barrier)

### Step 8 -- Quality Gate

- [ ] 4-touch sequence with distinct purpose per touch
- [ ] Each touch adds new information (not repetitive)
- [ ] Subject lines are specific and under 60 characters
- [ ] CTAs are clear and single per email
- [ ] LinkedIn variant is under 300 characters
- [ ] Day-before reminder includes logistics
- [ ] Social proof is included in Touches 2-3
- [ ] Urgency is specific, not generic ("4 seats left" not "hurry")
- [ ] No em dashes in any copy

## Output Format

Save to `docs/sequences/event-invitation-{event-slug}.md`:

```markdown
# Event Invitation Sequence: {Event Name}

Date: {Event date}
Audience: {Guest list type}
Capacity: {If applicable}

## Touch 1: Save the Date (4 Weeks Out)
**Send date:** {date}
**Subject:** {subject line}
**Body:**
{Email body}

## Touch 2: Formal Invite (2 Weeks Out)
**Send date:** {date}
**Subject:** {subject line}
**Body:**
{Email body}

## Touch 3: Reminder + Social Proof (1 Week Out)
**Send date:** {date}
**Subject:** {subject line}
**Body:**
{Email body}

## Touch 4: Final Reminder (2 Days Out)
**Send date:** {date}
**Subject:** {subject line}
**Body:**
{Email body}

## LinkedIn Message
**Initial message:**
{Under 300 characters}

**Follow-up (3 days later):**
{Under 300 characters}

## Confirmed Attendee Reminder (Day Before)
**Subject:** {subject line}
**Body:**
{Email body}
```

## Key Principles

1. **Each touch must add new information.** Sending the same email four times with different subject lines is not a sequence. Each touch should give a new reason to register.
2. **Specific urgency beats generic urgency.** "4 seats remaining" is compelling. "Spots are filling up fast" is noise everyone ignores.
3. **The LinkedIn variant is a conversation, not a broadcast.** Reference why you thought of them specifically. Mass-blast LinkedIn invitations get ignored.
4. **The day-before reminder prevents no-shows.** 20-40% of registrants don't show up. A logistics-focused reminder the day before reduces that significantly.
5. **Subject lines earn the open.** A vague subject line like "You're Invited" gets buried. A specific one like "ABM Workshop with [Speaker], March 15" gets opened.

## Anti-Patterns

- **The repeat-send sequence.** Sending the same email with a "Did you see my last email?" prefix. Each touch needs its own reason to exist.
- **Over-hyping a mediocre event.** If the event doesn't have genuine value, no amount of urgency language will fix attendance. Fix the event first.
- **Generic LinkedIn blasts.** Copy-pasting the same invitation to 200 connections. LinkedIn recipients can tell. Personalize or don't bother.

## What to Do Next

- Create the **full event playbook**: `/skill event-gtm-playbook`
- Design the **booth strategy**: `/skill booth-strategy`
- Track **event ROI** after the event: `/skill field-event-roi-tracker`

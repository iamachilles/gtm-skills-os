---
name: write-outbound-sequence
description: Create a multichannel outbound sequence with 8-12 touchpoints across email, LinkedIn, and phone
allowed-tools: Read, Write
metadata:
  author: Achille Morin-Lemoine
  version: "1.0.0"
---

# Write Outbound Sequence

Create a complete multichannel outbound sequence for a specific buyer persona. The sequence covers email, LinkedIn, and phone across 3-4 weeks with 8-12 touchpoints, conditional branches for different response scenarios, and persona-specific messaging throughout.

This is not a template with blanks to fill. Every touchpoint is fully written and ready to load into a sequencing tool.

## Inputs

- **Persona profile** (required) — who you're reaching out to (title, KPIs, pain points, goals)
- **Value proposition** (required) — what you're offering and why it matters to this persona
- **Proof points** (optional) — case studies, results, or data to reference
- **Tone** (optional) — conversational, formal, technical (default: conversational)
- **Offer/CTA** (optional) — what you're asking for (default: 15-minute conversation)
- **Company context** (optional) — industry, signals, or context that should inform personalization

## Steps

### Step 1 — Understand the Persona and Their Pain Points

Read the persona profile thoroughly. Identify:
- The primary pain point to lead with (the one that creates the most urgency)
- Secondary pain points for follow-up angles
- The language they use to describe their problems (not marketing language)
- What they've likely tried before that didn't work
- What "winning" looks like for them (their desired outcome)

The entire sequence should feel like it was written by someone who understands their job, not by someone selling a product.

### Step 2 — Define Channel Mix and Timing

Design the channel strategy:

**Email:** Primary channel for longer-form messaging. Best for sharing proof points and detailed value props.

**LinkedIn:** Connection request + short messages. Best for building familiarity and social proof. Keep messages under 300 characters for connection requests.

**Phone:** Best for breaking through when email and LinkedIn haven't gotten a response. Use after establishing some digital presence.

**Timing principles:**
- Don't front-load all touches in week 1. Spread the pressure.
- Alternate channels. Don't send 3 emails in a row.
- Leave 2-3 days between touches in early sequence, tighten to 1-2 days in final push.
- Send emails Tuesday through Thursday, 7-9 AM in the recipient's timezone.
- LinkedIn messages can go any day.
- Phone calls work best Tuesday-Thursday, 8-9 AM or 4-5 PM.

### Step 3 — Write Each Touchpoint

Write every touchpoint completely. Follow these rules:

**Email rules:**
- Subject lines: 4-7 words, lowercase, no clickbait. Reference the persona's world, not yours.
- Opening line: no "I hope this finds you well." Start with something relevant to them.
- Body: one idea per email. Short paragraphs. Specific over generic.
- CTA: one clear ask. Not "let me know if you'd like to chat or if there's someone else I should talk to or if you want me to send more info." Pick one.
- Signature: name, title, company. No inspirational quotes.
- Length: 50-120 words per email. Shorter is almost always better.

**LinkedIn rules:**
- Connection request: under 300 characters. Reference something specific (mutual connection, their content, a signal).
- Follow-up messages: conversational, not salesy. Treat it like a professional DM, not a cold email.
- No pitch in the connection request. The goal is to connect, not to sell.

**Phone rules:**
- Provide a call script outline, not a word-for-word script.
- Include: opening line, bridge question, value statement, ask.
- Plan for voicemail: write a 20-second voicemail script.

### Step 4 — Build the Cadence

Map each touchpoint to a specific day:

| Day | Channel | Touchpoint | Purpose |
|-----|---------|------------|---------|
| Day 1 | Email | Email 1 — Pain point + proof | Open the conversation |
| Day 2 | LinkedIn | Connection request | Build familiarity |
| Day 4 | Email | Email 2 — Different angle | Expand the value prop |
| Day 7 | LinkedIn | Follow-up message | Reinforce with social proof |
| Day 9 | Phone | Call 1 + voicemail | Break through digitally |
| Day 11 | Email | Email 3 — Case study | Provide proof |
| Day 15 | Email | Email 4 — New angle | Reframe the conversation |
| Day 18 | LinkedIn | Content share | Add value, stay visible |
| Day 21 | Phone | Call 2 + voicemail | Final push |
| Day 23 | Email | Email 5 — Breakup | Create urgency, give an easy out |

Adjust the exact cadence based on the persona's seniority and industry norms.

### Step 5 — Write Conditional Branches

Define what happens in these scenarios:

**If they reply positively:** Stop the sequence. Send a booking link with 2-3 time options. Confirm the meeting with a brief agenda.

**If they reply with an objection:** Provide 3-4 common objection responses:
- "Not the right time" — acknowledge, ask when to follow up, add to nurture
- "Not interested" — ask what they're focused on instead, offer to share relevant content
- "Send more info" — send a one-pager or case study, follow up in 3 days
- "Talk to [someone else]" — thank them, ask for a warm intro or permission to reference them

**If they open emails but don't reply:** Continue the sequence but reference the opens subtly. "Circling back on this since I know [topic] is relevant to what you're working on."

**If they don't open or engage at all:** Complete the sequence. Add to a monthly nurture campaign. Try again in 90 days with a fresh angle.

### Step 6 — Define Personalization Fields

Identify the fields that should be personalized per prospect:
- `{first_name}` — recipient's first name
- `{company}` — their company name
- `{signal}` — the specific trigger or signal that prompted outreach
- `{pain_point}` — their most likely pain point based on research
- `{proof_point}` — the most relevant case study for their industry/size
- `{mutual_connection}` — shared connection if applicable

Mark which touchpoints require manual personalization vs. which can be automated with merge fields.

## Output Format

```
# Outbound Sequence: [Persona Name]
Date: [Date]
Channels: Email, LinkedIn, Phone
Duration: [X weeks]
Total touchpoints: [X]

## Sequence Overview
[Brief description of the strategy and key messaging angles]

## Cadence Map
[Day-by-day table from Step 4]

## Touchpoints

### Day 1 — Email 1
**Subject:** [subject line]
**Body:**
[Full email text with personalization fields marked]

### Day 2 — LinkedIn Connection Request
[Full message text]

[Continue for all touchpoints]

## Conditional Branches

### Positive Reply
[Response template]

### Objection Handling
[Per-objection responses]

### No Engagement
[Nurture plan]

## Personalization Guide
[Which fields need manual research vs. automated merge]

## Metrics to Track
[Open rate, reply rate, meeting rate, per-touchpoint performance]
```

## Quality Checks

- Every touchpoint is fully written. No placeholders like "[insert value prop here]."
- Subject lines are 4-7 words and lowercase. No ALL CAPS or clickbait.
- Each email is under 120 words. Count them.
- No two consecutive emails use the same angle. Each adds a new perspective.
- LinkedIn connection request is under 300 characters.
- The breakup email creates urgency without being aggressive or guilt-tripping.
- Conditional branches cover all 4 scenarios (positive reply, objection, opens but no reply, no engagement).
- The sequence uses the persona's language, not product marketing language.
- No em dashes in any touchpoint copy.
- The cadence doesn't exceed 4 weeks total. After that, move to nurture.
- Personalization fields are clearly marked and the guide explains what each requires.

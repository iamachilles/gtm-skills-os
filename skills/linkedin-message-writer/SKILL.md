---
description: Write LinkedIn connection requests and follow-up message sequences. Use when someone says "linkedin message", "connection request", "linkedin outreach", "linkedin DM", "linkedin follow-up", or "linkedin sequence"
tools: Read, Write
---

# LinkedIn Message Writer

Write a LinkedIn connection request and a 3-step follow-up sequence for a specific persona. The connection request earns the conversation. The follow-ups build it. At no point does anyone get pitched in a connection request.

## Inputs

- **Persona** (required) -- who you're reaching out to (title, KPIs, pain points)
- **Reason to connect** (required) -- why you're reaching out (shared interest, mutual connection, their content, a signal)
- **Value to offer** (optional) -- insight, resource, or perspective you can share
- **Tone** (optional) -- conversational, formal (default: conversational)

If persona or reason is missing, ask: "I need the target persona and a specific reason to connect. Who are we reaching out to and why?"

## Steps

### Step 0 -- Check for Existing Output

Read `docs/sequences/linkedin-{persona-slug}.md` if it exists. If found, present a summary and ask: "A LinkedIn sequence for this persona already exists. Do you want me to (a) add new variants, (b) refine existing copy, or (c) rebuild from scratch?"

### Step 1 -- Load Context

Read all available context:

1. `docs/personas/{persona-slug}.md` -- persona language and interests
2. `docs/messaging-matrix.md` -- relevant messaging for this persona
3. `docs/sales-narratives.md` -- narrative framing if available
4. `CLAUDE.md` -- project-level instructions

Note the persona's likely LinkedIn behavior: do they post content? Share articles? Comment on industry topics? This shapes personalization.

### Step 2 -- Write Connection Request

Write the connection request following these rules:

- Hard cap: under 300 characters (LinkedIn's limit for connection notes)
- Reference something specific: their content, a mutual connection, a shared experience, or a relevant signal
- State a clear reason to connect that benefits them, not just you
- No pitch. No ask. No "I'd love to tell you about our solution."
- End with something that makes accepting feel natural, not transactional

Write 2 variants: one referencing their content/activity, one referencing a shared context or signal.

### Step 3 -- Write 3-Step Follow-Up Sequence

After they accept, write three follow-up messages:

**Day 2 -- Value Share**
- Share something genuinely useful: an article, insight, benchmark, or resource related to their role
- Keep it under 100 words
- No ask. Pure value. The goal is to establish that connecting with you was a good decision.

**Day 5 -- Insight or Question**
- Share a perspective on something relevant to their work or ask a thoughtful question about their priorities
- Show you understand their world
- Keep it under 80 words
- The question should be something they'd actually want to answer, not a setup for your pitch

**Day 10 -- Soft CTA**
- Reference the value you've shared or the conversation thread
- Make a low-friction ask: a 15-minute conversation, a specific resource you can share, or an introduction
- Keep it under 80 words
- The CTA should feel like a natural next step, not a sales ambush

### Step 4 -- Quality Gate

Run these checks before saving:

- [ ] Connection request is under 300 characters. Count them.
- [ ] Connection request contains no pitch, no product mention, no ask
- [ ] Each follow-up message is under 100 words
- [ ] Day 2 message delivers genuine value with no ask attached
- [ ] Day 5 message asks a question worth answering or shares a real insight
- [ ] Day 10 CTA is low-friction and feels earned by the prior messages
- [ ] Language matches LinkedIn's conversational tone, not email formality
- [ ] No em dashes in any copy
- [ ] No "I'd love to pick your brain" or "Can I get 15 minutes of your time?"

If any check fails, fix it before proceeding.

## Output Format

Save to `docs/sequences/linkedin-{persona-slug}.md`:

```markdown
# LinkedIn Sequence: {Persona Title}
Date: {Date}

## Connection Request

### Variant A (content-based)
{Message text}
Characters: {count}/300

### Variant B (signal-based)
{Message text}
Characters: {count}/300

## Follow-Up Sequence

### Day 2 -- Value Share
{Message text}
Word count: {count}

### Day 5 -- Insight or Question
{Message text}
Word count: {count}

### Day 10 -- Soft CTA
{Message text}
Word count: {count}

## Personalization Notes
- What to research before sending: {specific items to look up}
- Signals that make this sequence more relevant: {triggers}
- If they post actively: reference a specific post in the connection request
- If they don't post: use the signal-based variant
```

## Key Principles

1. **The connection request earns the conversation.** It is not the conversation. Don't try to sell, pitch, or qualify in 300 characters.
2. **Value before ask. Always.** The first two follow-ups deliver value with no strings attached. The CTA only works because you've already proven you're worth talking to.
3. **LinkedIn is not email.** Messages should read like professional DMs, not cold emails squeezed into a smaller box.
4. **Specificity signals effort.** "I saw your post about X" beats "I noticed we're in the same industry." The more specific, the higher the accept rate.

## Anti-Patterns

- **Pitching in the connection request.** The fastest way to get ignored. The request earns the conversation, it doesn't replace it.
- **"Just following up" as a follow-up.** Every message must add new value. If you have nothing new to say, wait until you do.
- **Copy-pasting email copy into LinkedIn.** Different channel, different tone, different expectations. Rewrite, don't resize.

## What to Do Next

- Write **cold email** to complement the LinkedIn touchpoint: `/skill cold-email-writer`
- Build **full multichannel sequence** with email + LinkedIn + phone: `/skill write-outbound-sequence`
- Add **personalization snippets** from prospect research: `/skill outreach-personalizer`

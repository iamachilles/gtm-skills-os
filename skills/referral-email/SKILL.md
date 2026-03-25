---
name: referral-email
description: Write an internal referral request with a forwardable message. Use when someone says "referral email", "ask for referral", "internal intro", "get introduced", "warm intro", "referral request", or "forward to the right person"
allowed-tools: Read, Write
metadata:
  author: Achille Morin-Lemoine
  version: "1.0.0"
---

# Referral Email

Write a referral request email that includes a self-contained forwardable message. The referral ask is simple and specific. The forwardable message works without context from the person forwarding it. The follow-up handles silence gracefully.

## Inputs

- **Contact name** (required) -- the person you're asking for the referral
- **Target person or role** (required) -- who you want to be introduced to
- **Context** (required) -- why you're asking this person and what connects you to the target
- **Value proposition** (optional) -- what you can offer the target person
- **Relationship context** (optional) -- how well you know the contact (met at event, mutual connection, existing customer)

If contact name, target, or context is missing, ask: "I need three things: who you're asking for the referral, who you want to reach, and why this person is the right one to ask."

## Steps

### Step 0 -- Check for Existing Output

Search the project for any existing output from a previous run of this skill (check common locations like `docs/`, the project root, or any organized output directory). If a previous version is found, present a summary and ask: "A referral request template already exists. Do you want me to (a) create a new one for a different contact, (b) refine the existing one, or (c) rebuild from scratch?" 

### Step 1 -- Load Context

Search the project for any available context. Look in the project root, `docs/`, or any organized directory. Read what you find:

1. **Persona profiles** -- target person's profile if available
2. **Messaging matrix** -- relevant messaging for the target persona
3. **Sales narratives** -- narrative context if available
4. `CLAUDE.md` -- project-level instructions

Understand the relationship dynamic: the contact is doing you a favor. The request must be easy to say yes to.

### Step 2 -- Write the Referral Ask

Write the email to the contact asking for the referral:

- Open with context (how you know them, what you appreciate)
- State the ask clearly in one sentence: who you want to reach and why
- Explain why you're asking them specifically (not just anyone)
- Include the forwardable message below the ask so they can copy-paste
- Make it easy: "If you're open to it, feel free to forward the message below. If not, no worries at all."
- Keep the ask portion under 100 words

### Step 3 -- Write the Forwardable Message

Write a self-contained message the contact can forward to the target:

Rules:
- Hard cap: under 80 words
- Must make complete sense without any context from the forwarder
- Include: who you are, why you're reaching out, one specific value statement, one clear CTA
- Don't assume the target knows anything about you
- Don't make the forwarder look bad by being salesy or aggressive
- The tone should make the forwarder proud to have made the introduction

### Step 4 -- Write Follow-Up If No Response

Write a single follow-up for if the contact doesn't respond within 5 days:

- Keep it under 50 words
- Acknowledge they're busy
- Repeat the ask briefly
- Offer an alternative: "If [target name] isn't the right person, I'd welcome any suggestion."
- No pressure. No guilt.

### Step 5 -- Quality Gate

Run these checks before saving:

- [ ] Referral ask is under 100 words
- [ ] Forwardable message is under 80 words
- [ ] Forwardable message is fully self-contained (no "as [contact] mentioned" or "like we discussed")
- [ ] The ask makes it easy to say yes or no without awkwardness
- [ ] The forwardable message wouldn't embarrass the forwarder
- [ ] Follow-up is under 50 words with no guilt or pressure
- [ ] No em dashes in any copy
- [ ] CTA in the forwardable message is specific and low-friction

If any check fails, fix it before proceeding.

## Output Format

Save the output to your project. Suggested filename: `referral-request.md`

```markdown
# Referral Request: {Contact Name} -> {Target Name/Role}
Date: {Date}

## The Ask (to {Contact Name})
**Subject:** {subject line}
**Body:**
{Full email text including the forwardable message section}

## Forwardable Message (standalone)
{The forwardable message on its own for easy copy-paste}
Word count: {count}/80

## Follow-Up (Day 5, if no response)
**Subject:** Re: {original subject}
**Body:**
{Follow-up text}
Word count: {count}/50

## Notes
- Best sent on: {suggested day/time}
- Relationship context: {how well you know the contact}
- Alternative contacts to ask if this doesn't work: {suggestions if available}
```

## Key Principles

1. **Make it easy to say yes.** The harder the referral is to execute, the less likely it happens. Include the forwardable message ready to copy-paste.
2. **The forwardable message represents the forwarder.** It will be sent with their name attached. Write it so they look good for making the introduction.
3. **Self-contained means truly self-contained.** The target should understand who you are, why you're reaching out, and what you want without any preamble from the forwarder.
4. **One ask, one person.** Don't ask for introductions to three people. Pick the most important one. You can always come back for more.

## Anti-Patterns

- **Vague asks.** "Could you introduce me to someone on your team?" is impossible to act on. Name the person or the specific role.
- **Long forwardable messages.** If it's over 80 words, the forwarder won't forward it. They'll think "I'll get to this later" and never will.

## What to Do Next

- Write **cold email** as a backup if the referral doesn't come through: `/skill cold-email-writer`
- Prepare **reply templates** for when the target responds: `/skill reply-handler`

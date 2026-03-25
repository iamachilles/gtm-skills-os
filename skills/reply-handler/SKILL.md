---
name: reply-handler
description: Generate response templates for 8 common reply types in outbound sequences. Use when someone says "reply templates", "reply handler", "objection responses", "how to respond", "handle replies", "response templates", or "outbound replies"
allowed-tools: Read, Write
metadata:
  author: Achille Morin-Lemoine
  version: "1.0.0"
---

# Reply Handler

Generate response templates for the 8 most common reply types in outbound sequences. Each template is under 60 words, ready to customize, and designed to advance the conversation or close it gracefully. The goal is never to win an argument. It's to move forward or move on.

## Inputs

- **Campaign context** (optional) -- what you're selling, to whom, and the CTA you used
- **Product/service** (optional) -- for competitor differentiation and value reframing
- **Booking link** (optional) -- calendar URL for meeting-related responses
- **Nurture content** (optional) -- resources to share in "not now" scenarios

No required inputs. This skill produces a universal template set. Provide context for more tailored responses.

## Steps

### Step 0 -- Check for Existing Output

Search the project for any existing output from a previous run of this skill (check common locations like `docs/`, the project root, or any organized output directory). If a previous version is found, present a summary and ask: "Reply templates already exist covering [N] reply types. Do you want me to (a) add new reply types, (b) refine existing templates, or (c) rebuild from scratch?" 

### Step 1 -- Load Context

Search the project for any available context. Look in the project root, `docs/`, or any organized directory. Read what you find:

1. **Messaging matrix** -- messaging to reference in responses
2. **Objection library** -- detailed objection handles if available
3. **Sales narratives** -- narrative framing for reframes
4. `CLAUDE.md` -- project-level instructions

### Step 2 -- Write Templates for All 8 Reply Types

Write a response template for each reply type:

**1. Interested -- Book Meeting**
- Acknowledge their interest without overselling
- Provide 2-3 specific time options or a booking link
- Confirm what the meeting will cover (brief agenda)
- Keep it under 60 words

**2. Not Now -- Nurture Entry**
- Respect their timing without pushing back
- Ask when would be a better time to revisit
- Offer to send a relevant resource in the meantime
- Add to nurture sequence with a specific follow-up date
- Keep it under 60 words

**3. Wrong Person -- Ask for Referral**
- Thank them for letting you know
- Ask who would be the right person for this topic
- Make the referral easy (offer to draft a forwardable message)
- Keep it under 60 words

**4. Send More Info -- Share Resource + Meeting CTA**
- Share one specific resource (case study, one-pager, or demo link)
- Don't dump everything you have. One asset, well-chosen.
- Include a soft CTA: "Happy to walk through this live if useful."
- Keep it under 60 words

**5. We Use Competitor -- Acknowledge + Differentiate**
- Acknowledge the competitor positively (never trash-talk)
- Differentiate on one specific dimension relevant to their pain
- Ask a question that surfaces a gap the competitor might have
- Keep it under 60 words

**6. Too Expensive -- Reframe Value**
- Don't defend the price. Reframe around the cost of not solving the problem.
- Reference a specific ROI data point if available
- Ask what they're comparing against (budget, competitor, or internal build)
- Keep it under 60 words

**7. Unsubscribe -- Remove Gracefully**
- Confirm removal immediately. No questions, no "are you sure?"
- Be professional and brief
- Leave the door open without being pushy
- Keep it under 40 words

**8. Hostile -- Disengage Politely**
- Do not engage with the hostility
- Apologize for the intrusion briefly
- Confirm removal from outreach
- Keep it under 40 words
- Never match their tone. Ever.

### Step 3 -- Quality Gate

Run these checks before saving:

- [ ] All 8 reply types are covered
- [ ] Every template is under 60 words (unsubscribe and hostile under 40)
- [ ] No template is defensive, argumentative, or guilt-tripping
- [ ] Interested template includes specific next step
- [ ] Wrong person template asks for a specific referral
- [ ] Competitor template doesn't trash-talk
- [ ] Unsubscribe and hostile templates confirm removal immediately
- [ ] No em dashes in any copy
- [ ] Each template can be customized in under 30 seconds

If any check fails, fix it before proceeding.

## Output Format

Save the output to your project. Suggested filename: `reply-templates.md`

```markdown
# Reply Templates
Date: {Date}
Campaign: {campaign context if provided}

## 1. Interested -- Book Meeting
**When to use:** They express interest in learning more or meeting.
**Template:**
{Template text}
Word count: {count}/60

## 2. Not Now -- Nurture Entry
**When to use:** They're not ready but didn't say no.
**Template:**
{Template text}
**Action:** Add to nurture, follow up on {suggested date}.
Word count: {count}/60

## 3. Wrong Person -- Ask for Referral
**When to use:** They say they're not the right contact.
**Template:**
{Template text}
Word count: {count}/60

## 4. Send More Info -- Share Resource + CTA
**When to use:** They ask for more information before committing.
**Template:**
{Template text}
**Attach:** {suggested resource}
Word count: {count}/60

## 5. We Use Competitor -- Acknowledge + Differentiate
**When to use:** They mention an existing solution.
**Template:**
{Template text}
Word count: {count}/60

## 6. Too Expensive -- Reframe Value
**When to use:** They push back on pricing.
**Template:**
{Template text}
Word count: {count}/60

## 7. Unsubscribe -- Remove Gracefully
**When to use:** They ask to stop receiving messages.
**Template:**
{Template text}
**Action:** Remove from all sequences immediately.
Word count: {count}/40

## 8. Hostile -- Disengage Politely
**When to use:** They respond with anger or aggression.
**Template:**
{Template text}
**Action:** Remove from all sequences. Flag in CRM. Do not re-engage.
Word count: {count}/40

## Quick Reference
| Reply Type | Goal | Max Words |
|-----------|------|-----------|
| Interested | Book meeting | 60 |
| Not now | Enter nurture | 60 |
| Wrong person | Get referral | 60 |
| Send info | Share resource + CTA | 60 |
| Competitor | Differentiate | 60 |
| Too expensive | Reframe value | 60 |
| Unsubscribe | Remove gracefully | 40 |
| Hostile | Disengage | 40 |
```

## Key Principles

1. **Speed wins on positive replies.** When someone says "interested," respond within the hour. Every hour of delay reduces conversion.
2. **Every reply is a data point.** "Not now" tells you timing. "Wrong person" gives you a referral path. "We use competitor" reveals the landscape. Extract value from every response.
3. **Hostile replies get zero energy.** Remove them, move on. No clever comeback is worth the risk.
4. **Templates are starting points.** Customize each one with specific details before sending. A template that looks like a template defeats the purpose.

## Anti-Patterns

- **Arguing with objections.** "But our product is better because..." never works. Acknowledge, reframe, ask a question.
- **Begging on unsubscribes.** "Are you sure? Let me send you one more thing." Respect the boundary immediately.
- **Matching hostile energy.** The moment you engage with aggression, you've lost. Disengage with professionalism and move on.

## What to Do Next

- Build **objection library** with deeper responses for sales calls: `/skill objection-library`
- Write **follow-up sequences** for "not now" replies: `/skill nurture-sequence-writer`
- Prepare **referral emails** for "wrong person" replies: `/skill referral-email`

---
description: Turn raw call notes into a structured meeting recap with action items. Trigger phrases — "meeting recap", "call recap", "summarize call", "write recap", "meeting notes", "recap email", "call summary"
tools: Read, Write
---

# Meeting Recap Writer

Turn raw call notes into a structured recap with key takeaways, action items, stakeholder alignment assessment, and a sendable email. This is a real-time tool designed for speed. No file save needed unless requested.

A good recap does three things: confirms what was agreed, assigns ownership, and surfaces what was left unsaid. Most recaps only do the first.

## Inputs

- **Call notes** (required) -- raw notes from the meeting (transcripts, bullet points, or stream-of-consciousness notes all work)
- **Meeting attendees** (optional) -- who was on the call and their roles
- **Meeting purpose** (optional) -- discovery, demo, negotiation, QBR, etc.
- **Recipient context** (optional) -- who will receive the recap email

If call notes are missing, ask: "Paste your call notes and I'll turn them into a structured recap. Raw notes, transcript, or bullet points all work."

## Steps

### Step 0 -- Idempotency Check

This skill outputs directly rather than saving to a file. If the user provides the same notes twice, produce a fresh recap (notes may have been updated).

### Step 1 -- Load Context

Read available context if it helps interpret the notes:

1. `docs/sales/deal-strategy-{deal-slug}.md` -- existing deal context
2. `CLAUDE.md` -- project-level instructions

Keep context loading minimal. This skill prioritizes speed.

### Step 2 -- Extract Key Takeaways

Read through the notes and extract the top 3-5 takeaways. Each takeaway must be:
- A concrete fact, decision, or insight (not a summary of what was discussed)
- Ordered by importance to the deal
- Written in one sentence

"They confirmed Q3 budget approval is in progress" is a takeaway.
"We discussed budget" is not.

### Step 3 -- Extract Action Items

Pull every action item with:
- **What:** The specific task
- **Who:** The person responsible (buyer-side or seller-side)
- **When:** Deadline or "ASAP" / "Before next call" if no date was stated

If an action item has no clear owner, flag it: "Owner TBD -- confirm in recap email."

### Step 4 -- Assess Stakeholder Alignment

Based on the notes, assess:
- **Aligned:** Who is clearly supportive and why
- **Not aligned:** Who raised concerns or pushed back
- **Missing:** Who should have been on the call but wasn't

This section surfaces the political dynamics that raw notes often bury.

### Step 5 -- Identify Next Steps

Define 1-3 concrete next steps:
- What happens next
- Who initiates it
- By when

Each next step must be specific enough to put on a calendar.

### Step 6 -- Write Recap Email

Write a professional recap email that can be sent to the prospect. Rules:
- Under 300 words total
- Friendly but professional tone
- Start with a thank-you line
- List key takeaways as bullet points
- List action items with owners
- End with confirmed next step
- No internal-only observations (stakeholder alignment stays out of the email)

### Step 7 -- Quality Gate

Before outputting, verify:

- [ ] Key takeaways are facts or decisions, not topic summaries
- [ ] Every action item has an owner (or is flagged as TBD)
- [ ] Recap email is under 300 words. Count them.
- [ ] No fabricated details. If something wasn't in the notes, it's not in the recap.
- [ ] Stakeholder alignment assessment is based on evidence from the notes, not assumptions
- [ ] Next steps include specific dates or timeframes
- [ ] Recap email contains nothing that shouldn't be shared with the prospect

If any check fails, fix it before proceeding.

## Output Format

Output directly (no file save by default):

```markdown
# Meeting Recap: {Company / Topic}
Date: {Date}
Attendees: {Names and roles}
Type: {Discovery / Demo / Negotiation / QBR / Other}

## Key Takeaways
1. {Takeaway -- concrete fact, decision, or insight}
2. {Takeaway}
3. {Takeaway}

## Action Items
| # | Action | Owner | Due |
|---|--------|-------|-----|
| 1 | {Task} | {Name} | {Date} |
| 2 | {Task} | {Name} | {Date} |
| 3 | {Task} | {Name} | {Date} |

## Stakeholder Alignment
- **Aligned:** {Who and evidence}
- **Concerns raised:** {Who and what they said}
- **Missing from call:** {Who should be engaged next}

## Next Steps
1. {Specific next step} -- {Owner} -- {By when}

---

## Sendable Recap Email

**Subject:** Recap: {Meeting topic} -- {Date}

Hi {Name},

{Thank you line.}

{1-2 sentences summarizing what was accomplished.}

**Key takeaways:**
- {Takeaway 1}
- {Takeaway 2}
- {Takeaway 3}

**Action items:**
- {Action} -- {Owner} -- {Due date}
- {Action} -- {Owner} -- {Due date}

**Next step:** {What happens next and when.}

{Closing line.}

{Signature}
```

## Key Principles

1. **Takeaways are decisions, not discussions.** "We discussed pricing" tells you nothing. "They confirmed budget of $50K and need a proposal by Friday" moves the deal.
2. **Every action item needs an owner.** Unowned action items don't get done. If ownership is unclear, flag it rather than skip it.
3. **The recap email is a commitment device.** Sending it creates shared accountability. That's why it matters more than internal notes.
4. **Speed is the feature.** This skill should take minutes, not hours. Don't over-polish.

## Anti-Patterns

- **Do NOT add information that wasn't in the notes.** If the notes don't mention competition, the recap doesn't mention competition. Fabricating details is dangerous.
- **Do NOT include internal-only observations in the sendable email.** Stakeholder alignment and political dynamics stay in the internal recap, never in the prospect-facing email.
- **Do NOT write a novel.** The recap email is under 300 words. Brevity signals professionalism.

## What to Do Next

- Analyze the call for **coaching insights**: `/skill sales-coaching-analyzer`
- Update the **deal strategy** based on what was learned: `/skill deal-strategy-advisor`
- Update the **mutual action plan** with new commitments: `/skill mutual-action-plan`

---
name: follow-up-sequence
description: Write a follow-up sequence for prospects who opened but didn't reply. Use when someone says "follow-up", "follow up sequence", "no reply", "opens no reply", "re-engage", "follow-up emails", or "nurture non-responders"
allowed-tools: Read, Write
metadata:
  author: Achille Morin-Lemoine
  version: "1.0.0"
---

# Follow-Up Sequence

Write a 4-touch follow-up sequence for prospects who opened your initial message but didn't reply. Each touch adds new value and uses a different angle. No "just following up." No "circling back." Every message earns its place in the inbox.

## Inputs

- **Original message** (required) -- the initial email or message that was sent
- **Persona** (required) -- who you're following up with (title, KPIs, pain points)
- **Proof points** (optional) -- additional case studies, metrics, or resources to share
- **Content assets** (optional) -- articles, benchmarks, or tools you can reference

If original message or persona is missing, ask: "I need the original message that was sent and the target persona to write follow-ups. Can you share both?"

## Steps

### Step 0 -- Check for Existing Output

Search the project for any existing output from a previous run of this skill (check common locations like `docs/`, the project root, or any organized output directory). If a previous version is found, present a summary and ask: "A follow-up sequence for this persona already exists. Do you want me to (a) add new touches, (b) refine existing copy, or (c) rebuild from scratch?" 

### Step 1 -- Load Context

Search the project for any available context. Look in the project root, `docs/`, or any organized directory. Read what you find:

1. **Persona profiles** -- the original email for reference
2. **Persona profiles** -- persona profile
3. **Messaging matrix** -- alternative messaging angles
4. **Sales narratives** -- narrative framing if available
5. `CLAUDE.md` -- project-level instructions

Identify which angles the original message used so the follow-ups can introduce new ones.

### Step 2 -- Map the Follow-Up Angles

Each follow-up must use a different angle from the original and from each other:

- **Touch 2 (Day 3):** New angle. Something the original didn't cover.
- **Touch 3 (Day 7):** Add value. Share an insight, resource, or benchmark.
- **Touch 4 (Day 14):** Social proof. "A company like yours did X."
- **Touch 5 (Day 21):** Breakup. Loss aversion. Leave the door open.

Define the specific angle for each touch before writing.

### Step 3 -- Write Touch 2 (Day 3) -- New Angle

Rules:
- Lead with a different pain point or opportunity than the original
- Don't reference the original email ("I sent you an email last week")
- Keep it under 80 words
- One clear CTA, same or different from the original
- Must stand alone. If they didn't read the first email, this still makes sense.

### Step 4 -- Write Touch 3 (Day 7) -- Add Value

Rules:
- Lead with something useful: a benchmark, article, framework, or data point
- The value must be relevant to their role regardless of whether they buy
- Brief context for why you're sharing it (1 sentence)
- Soft CTA: "Thought this might be useful. Happy to share more context if relevant."
- Keep it under 80 words

### Step 5 -- Write Touch 4 (Day 14) -- Social Proof

Rules:
- Reference a specific company or result (with permission/anonymized if needed)
- Connect the proof to this persona's situation: "They were dealing with [same problem you likely face]"
- Keep it under 80 words
- CTA: "Worth a conversation to see if this applies to you?"

### Step 6 -- Write Touch 5 (Day 21) -- Breakup

Rules:
- Acknowledge this is the last message (for now)
- Use subtle loss aversion: reference what they might miss, not what you're taking away
- Leave the door open with a clear, no-pressure way to re-engage
- Keep it under 60 words
- No guilt-tripping. No passive aggression. No "I guess you're not interested."

### Step 7 -- Quality Gate

Run these checks before saving:

- [ ] No follow-up says "just following up" or "circling back"
- [ ] Each touch uses a genuinely different angle
- [ ] Touch 2 is under 80 words
- [ ] Touch 3 is under 80 words and delivers real value
- [ ] Touch 4 is under 80 words and includes a specific proof point
- [ ] Touch 5 is under 60 words with no guilt or passive aggression
- [ ] Each touch can stand alone without the prior messages
- [ ] Timing follows Day 3, 7, 14, 21 cadence
- [ ] No em dashes in any copy
- [ ] Language matches the persona's vocabulary

If any check fails, fix it before proceeding.

## Output Format

Save the output to your project. Suggested filename: `follow-up-{persona-slug}.md`

```markdown
# Follow-Up Sequence: {Persona Title}
Date: {Date}
Original message reference: {file path or summary}

## Timing Map
| Touch | Day | Angle | Purpose |
|-------|-----|-------|---------|
| 2 | Day 3 | New angle | Re-engage with different pain point |
| 3 | Day 7 | Value add | Build credibility with useful content |
| 4 | Day 14 | Social proof | Show relevant results |
| 5 | Day 21 | Breakup | Close loop, leave door open |

## Touch 2 -- New Angle (Day 3)
**Subject:** {subject line}
**Body:**
{Full email text}
Word count: {count}/80

## Touch 3 -- Value Add (Day 7)
**Subject:** {subject line}
**Body:**
{Full email text}
Word count: {count}/80

## Touch 4 -- Social Proof (Day 14)
**Subject:** {subject line}
**Body:**
{Full email text}
Word count: {count}/80

## Touch 5 -- Breakup (Day 21)
**Subject:** {subject line}
**Body:**
{Full email text}
Word count: {count}/60
```

## Key Principles

1. **Each touch must add NEW value.** If you can't articulate what's new in this follow-up, don't send it. Repetition is not persistence.
2. **Stand-alone messages win.** Each follow-up should make sense even if they never read the previous ones. Don't build on a foundation that may not exist.
3. **The breakup is the most important email.** It often gets the highest reply rate. Write it with care, not frustration.
4. **Timing creates rhythm, not pressure.** The spacing (3, 7, 14, 21) gives breathing room while maintaining presence. Tighter spacing signals desperation.

## Anti-Patterns

- **"Just following up."** This phrase communicates "I have nothing new to say but I'm emailing you anyway." Every touch must earn its inbox space.
- **"Circling back on my last email."** Same problem. The reader knows you sent a last email. Tell them something new.
- **Guilt-trip breakups.** "I guess timing isn't right" or "I'll assume you're not interested" are passive-aggressive. Close with grace.

## What to Do Next

- Generate **subject line variants** for A/B testing each touch: `/skill subject-line-generator`
- Design **A/B test** to optimize the sequence: `/skill ab-test-designer`
- Transition non-responders to a **long-term nurture**: `/skill nurture-sequence-writer`

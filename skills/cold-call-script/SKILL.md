---
description: Generate a cold call script with opener, qualifying questions, objection handles, and voicemail. Use when someone says "cold call script", "call script", "phone script", "cold calling", "voicemail script", or "call talk track"
tools: Read, Write
---

# Cold Call Script

Generate a complete cold call script for a specific persona. Includes an opening, permission-based opener, qualifying questions, objection handles for the top 3 objections, a close, and a voicemail script. This is a structured guide, not a word-for-word read-aloud.

## Inputs

- **Persona** (required) -- who you're calling (title, KPIs, pain points)
- **Pain points** (required) -- the top 2-3 problems to probe
- **Value proposition** (optional) -- what you offer and how it helps
- **Proof points** (optional) -- specific results to reference if asked
- **Common objections** (optional) -- known pushback to prepare for

If persona or pain points are missing, ask: "I need the target persona and their top pain points to write the script. Who are we calling and what problems should we probe?"

## Steps

### Step 0 -- Check for Existing Output

Read `docs/sequences/cold-call-{persona-slug}.md` if it exists. If found, present a summary and ask: "A cold call script for this persona already exists. Do you want me to (a) update objection handles, (b) refine the opener, or (c) rebuild from scratch?"

### Step 1 -- Load Context

Read all available context:

1. `docs/personas/{persona-slug}.md` -- persona profile, language, priorities
2. `docs/messaging-matrix.md` -- relevant messaging for this persona
3. `docs/objection-library.md` -- known objections and responses if available
4. `docs/sales-narratives.md` -- narrative framing if available
5. `CLAUDE.md` -- project-level instructions

Focus on how this persona talks about their problems. The script should mirror their language, not your marketing copy.

### Step 2 -- Write the Opening (Under 15 Seconds)

The opening must include:
- Your name
- Your company
- The reason you're calling (specific to them, not generic)

The entire opening should take under 15 seconds to say aloud. Write two variants:

**Variant A -- Permission-based:**
"Hi {first_name}, this is {your_name} from {company}. Did I catch you at a bad time?"

**Variant B -- Pattern interrupt:**
"Hi {first_name}, this is {your_name} from {company}. You and I haven't spoken before, but I'm calling because {specific reason tied to their role or a signal}."

### Step 3 -- Write Qualifying Questions

Write 3 qualifying questions focused on their pain points. Each question should:
- Be open-ended (not yes/no)
- Reveal the depth of the problem
- Use their language, not yours
- Lead naturally into your value proposition without forcing it

Order them from broadest (easy to answer) to most specific (reveals buying intent).

### Step 4 -- Write Objection Handles

Write responses for the top 3 objections:

For each objection:
1. **Acknowledge** -- validate their concern without being defensive
2. **Reframe** -- shift the perspective with a question or insight
3. **Bridge** -- connect back to the conversation

Common objections to prepare for: "Not interested," "We already have something," "Send me an email," "Not the right time," "Too expensive." Pick the 3 most likely for this persona.

### Step 5 -- Write the Close

Write two closing options:

**If the call is going well:** Ask for a specific next step with a specific time. "Would [day] at [time] work for a 20-minute deeper dive?"

**If the call is lukewarm:** Ask a permission-based question to keep the door open. "Would it be fair to send you [specific resource] and check back in [timeframe]?"

### Step 6 -- Write Voicemail Script

Write a voicemail script following these rules:
- Hard cap: under 30 seconds (~75 words)
- Include: your name, company, one specific reason to call back, your phone number (spoken twice)
- The reason to call back should create curiosity, not pitch a product
- End with your number. Speak it slowly. Repeat it.

### Step 7 -- Quality Gate

Run these checks before saving:

- [ ] Opening is under 15 seconds when read aloud (~35 words)
- [ ] Voicemail is under 30 seconds (~75 words)
- [ ] All 3 qualifying questions are open-ended
- [ ] Objection handles follow acknowledge-reframe-bridge structure
- [ ] Language matches the persona's vocabulary
- [ ] No jargon or buzzwords the persona wouldn't use
- [ ] No em dashes in any copy
- [ ] The script reads like a conversation guide, not a teleprompter

If any check fails, fix it before proceeding.

## Output Format

Save to `docs/sequences/cold-call-{persona-slug}.md`:

```markdown
# Cold Call Script: {Persona Title}
Date: {Date}

## Opening (under 15 seconds)

### Variant A -- Permission-Based
{Script text}

### Variant B -- Pattern Interrupt
{Script text}

## Qualifying Questions
1. {Question 1 -- broadest}
2. {Question 2 -- mid-level}
3. {Question 3 -- most specific}

## Objection Handles

### "{Objection 1}"
- **Acknowledge:** {response}
- **Reframe:** {response}
- **Bridge:** {response}

### "{Objection 2}"
- **Acknowledge:** {response}
- **Reframe:** {response}
- **Bridge:** {response}

### "{Objection 3}"
- **Acknowledge:** {response}
- **Reframe:** {response}
- **Bridge:** {response}

## Close

### Strong Interest
{Close script}

### Lukewarm Interest
{Close script}

## Voicemail Script
{Full voicemail script}
Word count: {count}/75
```

## Key Principles

1. **Under 15 seconds or you lose them.** The opening is a gate, not a pitch. Get through it fast.
2. **Questions reveal more than statements.** A good qualifying question uncovers pain you can solve. A statement just tells them what you think.
3. **Objections are buying signals.** "Not interested" means "you haven't given me a reason." Handle it, don't hang up.
4. **The voicemail is a separate art.** It's not a compressed version of the call. It's a curiosity hook designed to earn a callback.

## Anti-Patterns

- **Reading the script verbatim.** This is a guide, not a teleprompter. If it sounds rehearsed, the prospect checks out.
- **Pitching before qualifying.** Never present your solution before understanding their problem. You'll pitch the wrong thing.
- **Leaving a voicemail that's a mini-pitch.** Nobody calls back a stranger who just pitched them. Create curiosity instead.

## What to Do Next

- Write **cold email** to follow up after the call: `/skill cold-email-writer`
- Build **full multichannel sequence** with phone touchpoints: `/skill write-outbound-sequence`
- Prepare **objection library** for the full team: `/skill objection-library`

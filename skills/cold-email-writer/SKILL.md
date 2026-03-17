---
description: Write a high-converting cold email using PAS or AIDA framework. Use when someone says "cold email", "write email", "outbound email", "prospecting email", "PAS email", "AIDA email", or "email copy"
tools: Read, Write
---

# Cold Email Writer

Write a complete cold email with subject line variants using the PAS (Problem-Agitate-Solve) or AIDA (Attention-Interest-Desire-Action) framework. Produces three email variants and three subject line options, all ready to load into a sequencing tool.

The framework choice is deliberate: PAS when the persona has an acute, well-understood pain. AIDA when the opportunity is aspirational or the pain isn't yet felt.

## Inputs

- **Persona** (required) -- who you're emailing (title, KPIs, pain points)
- **Pain point** (required) -- the specific problem to lead with
- **Value proposition** (required) -- what you offer and why it matters to this persona
- **Proof point** (required) -- one specific result, metric, or case study
- **Messaging matrix** (optional) -- if exists, pull cell content for this persona
- **Tone** (optional) -- conversational, formal, technical (default: conversational)

If persona or pain point is missing, ask: "I need the target persona and their primary pain point to write the email. Who are we writing to and what problem are we leading with?"

## Steps

### Step 0 -- Check for Existing Output

Read `docs/sequences/cold-email-{persona-slug}.md` if it exists. If found, present a summary and ask: "A cold email for this persona already exists with [N] variants. Do you want me to (a) add new variants, (b) refine existing copy, or (c) rebuild from scratch?"

### Step 1 -- Load Context

Read all available context:

1. `docs/messaging-matrix.md` -- pull the relevant persona x pillar cell if it exists
2. `docs/personas/{persona-slug}.md` -- persona language, KPIs, objections
3. `docs/value-prop-matrix.md` -- feature-benefit-value mapping
4. `docs/sales-narratives.md` -- narrative framing if available
5. `CLAUDE.md` -- project-level instructions

Identify the persona's language patterns. Cold emails that use the reader's vocabulary convert. Marketing speak kills reply rates.

### Step 2 -- Choose Framework

Select the framework based on the pain point:

**PAS (Problem-Agitate-Solve)** -- use when:
- The persona already feels the pain
- The problem is urgent or getting worse
- There's a clear cost of inaction

**AIDA (Attention-Interest-Desire-Action)** -- use when:
- The opportunity is forward-looking
- The persona doesn't yet know they have the problem
- The value is aspirational (growth, competitive advantage)

State which framework you chose and why.

### Step 3 -- Write the Email

Write one complete email following these rules:

**Subject line:** 2-6 words, lowercase, no clickbait, no punctuation tricks. Reference the persona's world, not yours.

**Opening line:** Personalized and specific. Connect to something real about the prospect's situation, role, or company.

**Pain/opportunity bridge:** 1-2 sentences linking their situation to the problem (PAS) or opportunity (AIDA).

**Value statement:** One sentence explaining what you do in terms of the outcome they care about.

**Proof point:** One specific number, result, or named reference. Not "we help companies like yours" but "we helped [Company] reduce [metric] by [X]% in [timeframe]."

**CTA:** One ask. Low friction. Not "let me know if you'd like to chat or if there's someone else." Pick one action.

### Step 4 -- Generate 3 Variants

Create three distinct variants of the email:

- **Variant A:** Lead with the pain point (most direct)
- **Variant B:** Lead with the proof point (credibility-first)
- **Variant C:** Lead with a question or insight (curiosity-driven)

Each variant must use a different opening line and angle. The CTA can stay the same.

### Step 5 -- Generate 3 Subject Lines

Write three subject line options:

1. One that references the persona's pain point
2. One that references the proof point or result
3. One that asks a question relevant to their role

### Step 6 -- Quality Gate

Run these checks before saving:

- [ ] Every email body is under 120 words. Count them.
- [ ] Every subject line is 2-6 words and lowercase
- [ ] No email starts with "I hope this email finds you well"
- [ ] No email contains "I noticed your company is growing"
- [ ] No email contains "I'd love to pick your brain"
- [ ] Each variant uses a genuinely different angle, not just rephrased words
- [ ] The proof point includes a specific number or named reference
- [ ] The CTA is a single, low-friction ask
- [ ] No em dashes in any copy
- [ ] Language matches how the persona talks, not how marketers write

If any check fails, fix it before proceeding.

## Output Format

Save to `docs/sequences/cold-email-{persona-slug}.md`:

```markdown
# Cold Email: {Persona Title}
Date: {Date}
Framework: {PAS or AIDA} -- {one-line rationale}

## Subject Line Options
1. {subject line 1}
2. {subject line 2}
3. {subject line 3}

## Variant A -- Pain-Led
**Subject:** {subject line}
**Body:**
{Full email text}

## Variant B -- Proof-Led
**Subject:** {subject line}
**Body:**
{Full email text}

## Variant C -- Curiosity-Led
**Subject:** {subject line}
**Body:**
{Full email text}

## Personalization Fields
- `{first_name}` -- recipient's first name
- `{company}` -- their company name
- `{signal}` -- trigger event or specific observation
- `{proof_point}` -- most relevant case study for their industry

## A/B Testing Recommendation
- Test subject lines 1 vs 2 first (minimum 100 sends per variant)
- Winner becomes control, test against subject line 3
- Track reply rate, not just open rate
```

## Key Principles

1. **Under 120 words or it won't get read.** Mobile screens show 3-4 sentences before the fold. That's your entire canvas.
2. **One idea per email.** Don't pitch, prove, and ask in the same breath. Pick the one thing that earns the reply.
3. **Proof beats promises.** "We helped [Company] do [X]" is ten times stronger than "We can help you do [X]."
4. **The subject line earns the open. The first line earns the read.** Everything else earns the reply.
5. **Write like a human, not a brand.** If you wouldn't say it in a conversation, don't put it in the email.

## Anti-Patterns

- **"I hope this email finds you well."** It finds everyone well. It tells the reader nothing. It wastes their first line of attention.
- **"I noticed your company is growing."** Every company is growing or trying to. This signals zero research.
- **"I'd love to pick your brain."** This asks for free consulting disguised as networking. Respect their time with a specific ask.

## What to Do Next

- Write **follow-up sequence** for non-replies: `/skill follow-up-sequence`
- Generate **subject line variants** for A/B testing: `/skill subject-line-generator`
- Add **personalization snippets** from prospect research: `/skill outreach-personalizer`
- Build **full multichannel sequence** around this email: `/skill write-outbound-sequence`

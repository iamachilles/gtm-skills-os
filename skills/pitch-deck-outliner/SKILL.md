---
name: pitch-deck-outliner
description: Generate a persona-tailored pitch deck outline with slide-by-slide content and speaker notes. Use when someone says "pitch deck", "deck outline", "sales deck", "presentation outline", "build a deck", or "pitch structure"
allowed-tools: Read, Write
metadata:
  author: Achille Morin-Lemoine
  version: "1.0.0"
---

# Pitch Deck Outliner

Generate a persona-tailored pitch deck outline with content and speaker notes for each slide. This is not a generic "problem/solution/traction" template. It's a narrative-driven deck structure where every slide advances the buyer's thinking from "I have this problem" to "I need to act now."

Each persona gets their own deck outline because different buyers need different entry points and different proof. The VP of Sales deck leads with pipeline metrics. The CFO deck leads with forecast risk. Same product, different story, different slide order.

## Inputs

- **Target persona** (required) -- which buyer this deck is for (title, KPIs, key concerns)
- **GTM Triangle or positioning** (required) -- market change, thesis, and proof
- **Value propositions** (required) -- feature/benefit/value mapping for this persona
- **Case studies or proof points** (optional) -- specific results to feature
- **Sales narratives** (optional) -- the narrative framework to follow
- **Objection data** (optional) -- top objections to preempt
- **Meeting context** (optional) -- first meeting, deep-dive, executive briefing, etc.

If persona or positioning are missing, ask: "I need a target persona and your positioning to build the deck. Do you have docs/personas/ and docs/gtm-triangle.md, or should I work from what you can share?"

## Steps

### Step 0 -- Check for Existing Output

Search the project for any existing output from a previous run of this skill (check common locations like `docs/`, the project root, or any organized output directory). If a previous version is found, present a summary and ask: "A pitch deck outline for [persona] already exists with [N] slides. Do you want me to (a) update specific slides, (b) restructure the flow, or (c) rebuild from scratch?" 

### Step 1 -- Load Context

Search the project for any available context. Look in the project root, `docs/`, or any organized directory. Read what you find:

1. **GTM Triangle** -- positioning and market change
2. **Persona profiles** -- detailed persona profile
3. **Value proposition mapping** -- value props for this persona
4. **Sales narratives** -- narrative structure if available
5. **Case studies** -- proof points for the Proof slide
6. **Objection library** -- objections to preempt
7. `CLAUDE.md` -- project-level instructions

For the target persona, extract:
- Their primary KPI (this drives slide 1)
- Their top 2 pain points (these drive slides 2-3)
- Their top 2 objections (these drive slide 7)
- Their evaluation criteria (this shapes the proof slide)

### Step 2 -- Choose Deck Flow

Select the appropriate flow based on meeting context:

**First Meeting (8 slides)** -- the default flow:
1. The Problem (market shift)
2. Who's Affected (persona pain)
3. Current Alternatives (why they fall short)
4. Our Approach (unique solution)
5. How It Works (3 key capabilities)
6. Proof (case study or data)
7. Objection Preemption (address top 2)
8. The Ask (clear CTA)

**Executive Briefing (6 slides)** -- for C-level, skip the details:
1. Market Shift + Business Impact
2. The Gap in Current Approaches
3. Our Approach (principle, not features)
4. Proof (results only)
5. Why Now
6. The Ask

**Deep Dive (10 slides)** -- for technical evaluators or champions building a case:
1. The Problem
2. Who's Affected
3. Current Alternatives
4. Our Approach
5. How It Works (Capability 1)
6. How It Works (Capability 2)
7. How It Works (Capability 3)
8. Proof (multiple case studies)
9. Implementation and Timeline
10. The Ask

### Step 3 -- Write Slide Content

For each slide, write three components:

**Slide Title** (max 8 words)
- Must be a claim or insight, not a label
- Bad: "Our Solution." Good: "Forecast accuracy starts at data capture."
- The title sequence alone should tell the story

**Slide Content** (3-5 bullet points or 2-3 short paragraphs)
- What the audience sees on screen
- Minimal text, maximum impact
- Include specific data points where available
- Hard cap: 50 words per slide of visible content

**Speaker Notes** (75-150 words)
- What the presenter says while this slide is up
- Include the key message, transition to next slide, and anticipated questions
- Write in natural speaking voice, not corporate language
- Include the "bridge" sentence that connects to the next slide

### Step 4 -- Validate Narrative Flow

Read just the slide titles in sequence. They should tell a complete story:

1. Does the sequence move from problem to solution to proof to action?
2. Does each slide create a need for the next?
3. Would the audience feel compelled to stay through all slides?
4. Does the final slide create urgency to act?

If the title sequence doesn't flow as a story, restructure.

### Step 5 -- Add Interaction Points

Mark 2-3 slides where the presenter should pause and engage the audience:
- Discovery questions to ask
- Polls or reactions to solicit
- Moments to reference something the buyer said earlier

Decks that are monologues lose attention. Interaction points turn a presentation into a conversation.

### Step 6 -- Quality Gate

Run these checks before saving:

- [ ] Every slide title is a claim or insight, not a label (no "About Us" or "Our Team")
- [ ] Slide content is 50 words or fewer per slide
- [ ] Speaker notes are 75-150 words per slide
- [ ] The title sequence reads as a coherent story when listed alone
- [ ] Proof slide contains at least one specific number from a case study or data point
- [ ] Objection preemption slide addresses the top 2 objections for this persona
- [ ] CTA matches the persona's authority level and the meeting context
- [ ] At least 2 interaction points are marked
- [ ] The deck would take 15-25 minutes to present (not 5, not 45)

If any check fails, fix it before proceeding.

## Output Format

Save the output to your project. Suggested filename: `pitch-deck-{persona-slug}.md`

```markdown
# Pitch Deck: [Persona Title]
Meeting Type: [First Meeting / Executive Briefing / Deep Dive]
Estimated Duration: [15-25 minutes]
Date: [Date]

## Deck Summary
**Story in one sentence:** [What this deck argues]
**Key proof point:** [The single most compelling piece of evidence]
**CTA:** [What you want the audience to do after]

## Title Sequence
1. [Slide 1 title]
2. [Slide 2 title]
3. [Slide 3 title]
4. [Slide 4 title]
5. [Slide 5 title]
6. [Slide 6 title]
7. [Slide 7 title]
8. [Slide 8 title]

---

## Slide 1: [Title]

**Content:**
- [Bullet 1]
- [Bullet 2]
- [Bullet 3]

**Speaker Notes:**
[75-150 words of what to say]

**Transition:** [Bridge sentence to next slide]

---

## Slide 2: [Title]

**Content:**
[Same structure]

**Speaker Notes:**
[75-150 words]

[INTERACTION POINT] Ask: "[Question to engage the audience]"

**Transition:** [Bridge to next slide]

---

[Continue for all slides]

---

## Appendix: Backup Slides
### If asked about [Topic 1]
[Content for backup slide]

### If asked about [Topic 2]
[Content for backup slide]

## Customization Notes
- [What to change based on specific company research]
- [What to add if you have a relevant case study for their industry]
- [What to remove if it's a time-constrained meeting]
```

## Key Principles

1. **Slide titles tell the story.** If you read only the titles and skip everything else, the argument should still make sense. Titles are claims, not labels.
2. **The buyer's problem comes before your solution.** At least 30% of the deck should be about their world before you introduce yourself.
3. **Less text, more conversation.** Slides with walls of text get read silently. Slides with 3 bullets get discussed.
4. **Proof before the ask.** Never ask for something (a meeting, a pilot, a signature) without first proving you've earned it.
5. **Every deck is a conversation tool, not a document.** If the deck works without a presenter, it has too much text.

## Anti-Patterns

- **The "About Us" opener:** Starting with your company history, team size, or funding round. Nobody cares until they know you understand their problem.
- **Feature tours:** A slide for every feature. This is a product demo, not a pitch. Focus on 3 capabilities maximum.
- **One-size-fits-all decks:** Using the same deck for the VP of Sales and the CFO. If the proof points and language don't change, the deck isn't persona-tailored.

## What to Do Next

- Write a **custom demo script** that follows this deck's narrative: `/skill custom-demo-script`
- Create a **proposal** that formalizes the ask: `/skill proposal-writer`
- Build **objection handlers** for the most likely pushback after the deck: `/skill objection-library`

---
name: workshop-designer
description: Design a hands-on workshop with exercises and takeaway materials. Use when someone says "design a workshop", "workshop outline", "hands-on session", "training workshop", "workshop plan", "interactive session", or "workshop agenda"
allowed-tools: Read, Write
metadata:
  author: Achille Morin-Lemoine
  version: "1.0.0"
---

# Workshop Designer

Design a hands-on workshop with clear learning objectives, structured agenda, practical exercises, takeaway materials, and a post-workshop conversion path. A great workshop leaves attendees with something they built, not just something they heard.

## Inputs

- **Topic** (required) -- what the workshop teaches
- **Audience** (required) -- who attends (role, experience level, what they need)
- **Duration** (required) -- total time (typical: 60 min, 90 min, half-day, full-day)
- **Format** (optional) -- in-person, virtual, or hybrid
- **Conversion goal** (optional) -- what you want attendees to do after (book a call, start a trial, hire you)

If topic, audience, or duration is missing, ask: "I need the topic, who the audience is, and how long the workshop is. What are the details?"

## Steps

### Step 0 -- Check for Existing Output

Search the project for any existing output from a previous run of this skill (check common locations like `docs/`, the project root, or any organized output directory). If a previous version is found, present a summary and ask: "A workshop design on this topic already exists. Do you want me to (a) update it, (b) redesign for a different audience, or (c) keep it?" 

### Step 1 -- Load Context

Search the project for any available context. Look in the project root, `docs/`, or any organized directory. Read what you find:

1. **GTM Triangle** -- positioning (workshop should reinforce your methodology)
2. **Case studies** -- examples to reference during instruction
3. **Talk** documents -- related talks that could inform content
4. `CLAUDE.md` -- project-level instructions

### Step 2 -- Define Learning Objectives

Write exactly 3 learning objectives. Each must be:
- **Specific:** not "understand ABM" but "build a target account list for their top 10 accounts"
- **Achievable:** completable within the workshop time
- **Measurable:** you can see the output (a filled template, a written draft, a completed audit)

Format: "By the end of this workshop, attendees will have {specific deliverable}."

### Step 3 -- Design Agenda

Allocate time using this ratio:
- **Intro:** 10% of total time
- **Instruction:** 30% of total time
- **Hands-on exercise:** 40% of total time
- **Debrief:** 10% of total time
- **Next steps:** 10% of total time

**For a 90-minute workshop:**

| Block | Time | Activity |
|-------|------|----------|
| Intro | 10 min | Welcome, objectives, what they'll walk away with |
| Instruction Block 1 | 15 min | Teach concept 1 with example |
| Exercise 1 | 20 min | Apply concept 1 to their own situation |
| Instruction Block 2 | 15 min | Teach concept 2 with example |
| Exercise 2 | 15 min | Apply concept 2 to their own situation |
| Debrief | 10 min | Share results, Q&A, peer feedback |
| Next steps | 5 min | What to do after, conversion CTA |

Scale proportionally for other durations. For full-day workshops, add a third instruction/exercise block and longer breaks.

### Step 4 -- Create Exercises

For each exercise, define:

**Exercise {N}: {Name}**
- **Objective:** What they'll produce
- **Input:** What they need (their data, a template, a scenario)
- **Instructions:** Step-by-step (numbered, specific)
- **Time:** How long they have
- **Deliverable:** What they should have at the end
- **Facilitation notes:** How to help people who get stuck

Rules:
- Every exercise must produce a tangible output (not just "discuss" or "think about")
- Provide a worked example so they can see what "done" looks like
- Include a fallback scenario for people who don't have their own data

### Step 5 -- Design Takeaway Materials

Create materials attendees keep after the workshop:

1. **Template/worksheet:** The exercise templates, blank, for them to reuse
2. **Checklist:** Key steps summarized as a one-page checklist
3. **Reference card:** Quick-reference with frameworks, formulas, or key concepts

Each material should be useful standalone. Someone who missed the workshop should still find value in the template.

### Step 6 -- Plan Post-Workshop Conversion Path

Design the path from attendee to customer/client:

- **Immediate** (end of workshop): CTA to book a 1:1 consultation, start a trial, or join a community
- **Day 1:** Follow-up email with workshop materials + recording (if virtual) + CTA
- **Week 1:** Email with additional resources related to what they learned + soft CTA
- **Week 2:** Check-in email asking about progress on their workshop output + offer to help

The conversion path should feel like continued support, not a sales sequence.

### Step 7 -- Quality Gate

- [ ] Exactly 3 learning objectives, each specific and measurable
- [ ] Time allocation follows the 10/30/40/10/10 ratio (within 5%)
- [ ] Every exercise produces a tangible deliverable
- [ ] Exercises include worked examples and fallback scenarios
- [ ] Takeaway materials work standalone
- [ ] Post-workshop conversion path is designed
- [ ] Total time adds up to the stated duration
- [ ] No em dashes in any copy

## Output Format

Save the output to your project. Suggested filename: `workshop-{topic-slug}.md`

```markdown
# Workshop: {Title}

Date: {Date}
Duration: {Time}
Audience: {Who}
Format: {In-person / Virtual / Hybrid}

## Learning Objectives
1. {Objective 1 with specific deliverable}
2. {Objective 2 with specific deliverable}
3. {Objective 3 with specific deliverable}

## Agenda
| Time | Block | Activity |
|------|-------|----------|
| {rows} |

## Instruction Blocks
### Block 1: {Topic}
{Key concepts, examples, transition to exercise}

### Block 2: {Topic}
{Key concepts, examples, transition to exercise}

## Exercises
### Exercise 1: {Name}
- **Objective:** {deliverable}
- **Instructions:** {numbered steps}
- **Time:** {minutes}
- **Worked example:** {complete example}
- **Facilitation notes:** {how to help}

### Exercise 2: {Name}
{Same structure}

## Takeaway Materials
### Template
{Description and structure}
### Checklist
{One-page summary}
### Reference Card
{Quick-reference content}

## Post-Workshop Conversion
- **End of workshop CTA:** {specific ask}
- **Day 1 email:** {content + CTA}
- **Week 1 email:** {content + CTA}
- **Week 2 email:** {content + CTA}

## Facilitation Notes
- Room setup: {requirements}
- Tech requirements: {tools needed}
- Common questions: {anticipated Q&A}
```

## Key Principles

1. **Exercises are the workshop.** The instruction exists to make the exercises possible. If you cut time, cut instruction, not exercises. People learn by doing.
2. **Three objectives maximum.** Every additional objective dilutes focus. If you can't cover it in 3, you need a longer workshop or a narrower scope.
3. **Tangible outputs create value.** Attendees should leave with something they made: a completed template, a draft strategy, an audit of their own data. "I learned a lot" is forgettable. "I built my target account list" is lasting.
4. **The conversion path is earned, not pushed.** A great workshop creates demand naturally. The CTA should feel like the logical next step, not a sales pitch stapled to the end.

## Anti-Patterns

- **The lecture with a Q&A.** Calling it a "workshop" but spending 80% of the time talking. If attendees aren't building something, it's a presentation.
- **Exercises without examples.** Telling people to "fill in the template" without showing a completed version first. Worked examples reduce friction dramatically.
- **Overscoping.** Trying to teach everything you know in 90 minutes. Teach 2-3 things well. Leave them wanting more.

## What to Do Next

- Outline a **conference talk** version of this content: `/skill conference-talk-outliner`
- Write **event invitations** to fill seats: `/skill event-invitation-writer`
- Create a **blog post** from workshop content: `/skill blog-post-writer`

---
description: Generate discovery questions using MEDDIC, BANT, or SPICED frameworks. Trigger phrases — "discovery questions", "MEDDIC questions", "BANT questions", "SPICED questions", "qualification questions", "discovery call prep", "conversation flow"
tools: Read, Write
---

# Discovery Question Set

Generate a structured set of discovery questions organized by a proven sales qualification framework. Produces a conversation flow with follow-up branches, not just a flat list of questions. The goal is to walk out of discovery with a complete picture of the deal, not a checklist of questions asked.

Good discovery feels like a conversation. Bad discovery feels like an interrogation.

## Inputs

- **Persona** (required) -- who you're having the discovery conversation with (title, role context)
- **Framework** (required) -- MEDDIC, BANT, or SPICED
- **Industry/vertical** (optional) -- helps tailor questions to their context
- **Known context** (optional) -- anything already learned from prior conversations

If persona is missing, ask: "Who is the discovery call with? I need their role to tailor the questions."
If framework is missing, ask: "Which framework do you want: MEDDIC (complex enterprise deals), BANT (transactional/mid-market), or SPICED (customer-centric/consultative)?"

## Steps

### Step 0 -- Check for Existing Output

Read `docs/sales/discovery-{persona-slug}.md` if it exists. If found, present a summary and ask: "A discovery question set for {persona} already exists using {framework}. Do you want me to (a) add questions for a different framework, (b) refine existing questions, or (c) rebuild from scratch?"

### Step 1 -- Load Context

Read available context files:

1. `docs/icp.md` -- qualification criteria
2. `docs/gtm-triangle.md` -- positioning context
3. `docs/personas/{persona-slug}.md` -- persona details, pains, KPIs
4. `CLAUDE.md` -- project-level instructions

### Step 2 -- Select and Structure Framework

Build the question set organized by framework categories:

**MEDDIC:**
- **M**etrics -- How they measure success, what numbers matter
- **E**conomic Buyer -- Who controls the budget, how decisions get made
- **D**ecision Criteria -- What they'll evaluate solutions against
- **D**ecision Process -- Steps from evaluation to signed contract
- **I**dentify Pain -- The specific problem driving the initiative
- **C**hampion -- Who will sell internally on your behalf

**BANT:**
- **B**udget -- Financial capacity and allocation
- **A**uthority -- Decision-making power and process
- **N**eed -- Problem severity and urgency
- **T**imeline -- When they need a solution and key dates

**SPICED:**
- **S**ituation -- Current state, what they have today
- **P**ain -- What's broken or underperforming
- **I**mpact -- Business consequences of the pain
- **C**ritical Event -- Deadline or trigger forcing action
- **E**xpected Decision -- How they'll choose and who's involved
- **D**ecision Criteria -- What matters most in their evaluation

### Step 3 -- Write Questions per Category

For each framework category, write 3-4 questions that:
- Are open-ended (no yes/no questions)
- Use the persona's language, not sales jargon
- Progress from broad to specific within each category
- Reference the persona's likely KPIs and concerns

### Step 4 -- Add Follow-Up Branches

For each primary question, add 2 follow-up paths:
- **If positive/engaged:** A deeper question that expands the conversation
- **If vague/resistant:** A reframe that approaches from a different angle

This creates a conversation tree, not a linear script.

### Step 5 -- Build Qualification Checklist

Create a binary checklist that a rep fills out after the call:
- One checkbox per framework category
- Each item states what "qualified" looks like for that category
- Include a scoring guide: "If fewer than X categories are qualified, the deal needs more discovery before advancing"

### Step 6 -- Quality Gate

Before saving, verify:

- [ ] Every question is open-ended. Zero yes/no questions.
- [ ] Questions use persona language, not internal jargon
- [ ] Each framework category has 3-4 primary questions
- [ ] Every primary question has follow-up branches for both positive and resistant responses
- [ ] Qualification checklist has clear pass/fail criteria
- [ ] Questions progress logically within each category (broad to specific)
- [ ] No generic questions that could apply to any persona in any industry

If any check fails, fix it before proceeding.

## Output Format

Save to `docs/sales/discovery-{persona-slug}.md`:

```markdown
# Discovery Questions: {Persona Title}
Date: {Date}
Framework: {MEDDIC / BANT / SPICED}

## Conversation Flow

### {Category 1: e.g., Metrics}
**Goal:** {What you need to learn from this section}

**Q1:** {Primary question}
- If engaged: {Follow-up to go deeper}
- If vague: {Reframe from different angle}

**Q2:** {Primary question}
- If engaged: {Follow-up}
- If vague: {Reframe}

**Q3:** {Primary question}
- If engaged: {Follow-up}
- If vague: {Reframe}

### {Category 2}
**Goal:** {What you need to learn}

{Same structure}

[Repeat for all framework categories]

## Qualification Checklist
After the call, assess each category:

- [ ] {Category 1}: {What "qualified" looks like -- e.g., "Can state specific metric they're trying to improve"}
- [ ] {Category 2}: {Qualification criteria}
- [ ] {Category 3}: {Qualification criteria}
- [ ] {Category 4}: {Qualification criteria}
- [ ] {Category 5}: {Qualification criteria}
- [ ] {Category 6}: {Qualification criteria}

**Scoring:** {X}+ categories qualified = advance to next stage. Fewer = schedule follow-up discovery or disqualify.

## Conversation Tips
- {Tip specific to this persona -- e.g., "VPs of Sales respond better to revenue impact than efficiency gains"}
- {Tip on pacing -- e.g., "Don't rush past Pain. This persona needs to feel heard before they'll share process details"}
- {Tip on what to avoid}
```

## Key Principles

1. **Discovery is a conversation, not an interrogation.** If you're reading questions off a list, you're doing it wrong. These are starting points for natural dialogue.
2. **Listen more than you ask.** The follow-up branches exist because the best next question depends on what they just said.
3. **Qualify out early.** The checklist exists to prevent bad-fit deals from clogging the pipeline. It's better to disqualify in discovery than lose in negotiation.
4. **Persona language matters.** A CFO and a VP of Engineering have different vocabularies for the same problem. Use theirs.
5. **Pain before solution.** Never present your solution during discovery. The goal is to understand, not to pitch.

## Anti-Patterns

- **Do NOT generate yes/no questions.** "Do you have budget?" teaches you nothing. "How does your team typically fund new initiatives in this area?" opens a conversation.
- **Do NOT use sales jargon.** "What's your decision process?" is better than "Can you walk me through your procurement workflow?"
- **Do NOT create a flat list.** Questions without follow-up branches produce robotic conversations. The branching structure is the whole point.

## What to Do Next

- Build a **pre-call brief** for a specific prospect: `/skill pre-call-brief`
- Analyze call results with **deal strategy advisor**: `/skill deal-strategy-advisor`
- Get coaching on the discovery call: `/skill sales-coaching-analyzer`

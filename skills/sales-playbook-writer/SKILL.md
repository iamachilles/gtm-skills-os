---
description: Write a comprehensive sales playbook for a market segment with talk tracks, demo flow, objection handling, and close process. Trigger phrases — "sales playbook", "write playbook", "playbook for {segment}", "sales process", "selling guide", "rep onboarding"
tools: Read, Write
---

# Sales Playbook Writer

Write a complete sales playbook for a specific market segment. Covers qualification criteria, stage-by-stage talk tracks, demo flow design, objection cheat sheet, and close process. This is the document a new rep reads in their first week and references throughout their first quarter.

A playbook is not a script. It's a decision framework that helps reps navigate conversations with confidence. The best playbooks capture what top performers do instinctively and make it teachable.

## Inputs

- **Segment details** (required) -- who this playbook targets (industry, company size, use case, persona)
- **Sales process** (required) -- stages of the deal cycle (e.g., discovery, demo, proposal, negotiation, close)
- **Product/service overview** (required) -- what you sell and key value propositions
- **Common objections** (optional) -- objections the team already encounters
- **Competitive landscape** (optional) -- who you compete against in this segment
- **Win/loss patterns** (optional) -- what correlates with winning or losing in this segment
- **Existing content** (optional) -- case studies, battlecards, messaging docs to reference

If segment details or sales process is missing, ask: "I need to know (1) who this playbook targets (segment, persona, company profile) and (2) your sales stages from first touch to close. What does the process look like?"

## Steps

### Step 0 -- Check for Existing Output

Read `docs/sales/playbook-{segment-slug}.md` if it exists. If found, present a summary and ask: "A playbook for {segment} already exists. Do you want me to (a) update specific sections, or (b) rebuild from scratch?"

### Step 1 -- Load Context

Read all available context files:

1. `docs/icp.md` -- ideal customer profile
2. `docs/gtm-triangle.md` -- positioning and messaging
3. `docs/personas/` -- all persona files
4. `docs/messaging-matrix.md` -- persona x pillar messaging
5. `docs/sales-narratives.md` -- narrative framing
6. `docs/sales/battlecards/` -- competitive intel
7. `docs/competitors/competitive-analysis.md` -- competitive landscape
8. `CLAUDE.md` -- project-level instructions

### Step 2 -- Define Qualification Criteria

Write clear qualification gates:

**Pursue when:**
- 3-5 criteria that indicate a good-fit prospect
- Each criterion is observable (can be verified in research or discovery)
- Include both firmographic (company size, industry) and behavioral (trigger events, pain signals)

**Disqualify when:**
- 3-5 red flags that indicate a bad fit
- Each is specific enough that a rep can identify it early
- Include both hard disqualifiers (wrong size, wrong industry) and soft ones (no budget, no urgency)

**ICP fit score:** Quick 1-5 scoring rubric the rep can use after first contact

### Step 3 -- Write Stage-by-Stage Talk Tracks

For each sales stage, write a talk track that includes:

**Discovery:**
- Primary objective (what you need to learn)
- Opening talk track (how to start the conversation)
- 5 key questions to ask (with follow-up branches)
- Signals that the prospect is qualified to advance
- Common pitfalls at this stage

**Demo:**
- Primary objective (what the prospect needs to believe)
- Opening frame (set context before showing anything)
- Demo flow: what to show first, second, third (sequence matters)
- Handling "can you show me X?" requests (how to redirect vs. accommodate)
- Key moments to pause and check for reactions
- Signals that the demo landed

**Proposal:**
- Primary objective (get agreement on scope and budget range)
- How to present pricing (anchor high, options framework)
- What to include vs. leave for negotiation
- How to handle "send me the proposal and we'll review"
- Signals that the proposal is advancing

**Negotiation/Close:**
- Primary objective (reach agreement, not just concede)
- Common negotiation tactics buyers use and how to respond
- What to give vs. what to protect
- How to create urgency without being pushy
- Close techniques appropriate for this segment
- Trial / pilot / direct close: which path fits this segment

### Step 4 -- Design Demo Flow

Create a structured demo flow:

1. **Context setting** (2 minutes) -- frame the demo around their specific problem
2. **Core workflow** (10 minutes) -- show the primary use case end-to-end
3. **Differentiator moments** (5 minutes) -- features that competitors don't have
4. **Results/proof** (3 minutes) -- show outcomes similar customers achieved
5. **Q&A buffer** (10 minutes) -- handle questions and objections

For each section:
- What to show
- What to say
- What reactions to watch for
- How to handle "can you show me X?" (redirect to after the core flow, or accommodate if it's on the critical path)

### Step 5 -- Build Objection Cheat Sheet

Write the top 10 objections for this segment with responses:

For each objection:
- **The objection** (as the prospect actually says it)
- **What it really means** (the underlying concern)
- **Response framework** (acknowledge, reframe, prove, confirm)
- **Specific response** (what to actually say)
- **Proof point** (case study, metric, or reference to cite)

Order by frequency: most common first.

### Step 6 -- Define Close Process

Document the end-game:
- **Trial/pilot criteria:** When to offer, scope, duration, success metrics
- **Direct close criteria:** When to skip trial and go direct
- **Procurement navigation:** Common procurement steps and how to manage them
- **Contract playbook:** Standard terms, acceptable concessions, non-negotiables
- **Handoff to implementation:** What happens after signature

### Step 7 -- Quality Gate

Before saving, verify:

- [ ] Qualification criteria are specific and observable, not vague
- [ ] Every sales stage has a talk track with opening, questions, signals, and pitfalls
- [ ] Demo flow has a timed structure with specific content for each section
- [ ] All 10 objections include the full response framework (acknowledge, reframe, prove, confirm)
- [ ] Close process covers trial, direct, and procurement paths
- [ ] Talk tracks sound conversational, not scripted
- [ ] Competitive references are factual and sourced
- [ ] A new rep could follow this playbook on day one

If any check fails, fix it before proceeding.

## Output Format

Save to `docs/sales/playbook-{segment-slug}.md`:

```markdown
# Sales Playbook: {Segment Name}
Date: {Date} | Target: {Segment description}

## Qualification
**Pursue when:** {3-5 observable criteria with verification method}
**Disqualify when:** {3-5 red flags with reasoning}
**Quick Fit Score:** 5 (perfect) to 1 (disqualify) with one-line criteria per score

## Stage Talk Tracks
For each stage (Discovery, Demo, Proposal, Close): objective, opening talk track, key questions with follow-up branches, advance signals, and pitfalls to avoid.

## Demo Flow
Timed sections: Context Setting (2 min), Core Workflow (10 min), Differentiators (5 min), Proof (3 min), Q&A (10 min). Each with what to show, what to say, and how to handle "show me X" requests.

## Objection Cheat Sheet
Top 10 objections, each with: the objection as spoken, underlying concern, response (acknowledge + reframe + prove), and proof point.

## Competitive Quick Reference
Per competitor: their pitch, your counter, trap question.

## Close Process
Trial/pilot criteria and structure, direct close criteria, procurement navigation steps.

## Metrics to Track
| Metric | Target | Why It Matters |
|--------|--------|---------------|
| {Stage conversion rates, win rate, cycle length, deal size} | {X} | {Context} |
```

## Key Principles

1. **A playbook is a decision framework, not a script.** Reps who read from scripts sound robotic. Reps who understand the framework adapt to any conversation.
2. **Sequence matters in demos.** What you show first shapes how the prospect evaluates everything after. Lead with the problem, not the product.
3. **Objection handling is a skill, not a list.** The response framework (acknowledge, reframe, prove, confirm) matters more than memorizing specific responses.
4. **Qualification saves more deals than closing skills.** Time spent on bad-fit prospects is time not spent on good-fit ones. Make disqualification easy.
5. **Update quarterly.** Markets change, competitors evolve, and your team learns. A playbook that hasn't been updated in 6 months is a liability.
6. **Top performers write the playbook.** The best playbooks capture what the best reps do naturally. Interview your top performers and codify their instincts.

## Anti-Patterns

- **Do NOT write a product manual disguised as a playbook.** A playbook is about selling, not about features. Lead with problems and outcomes, not capabilities.
- **Do NOT include generic objection responses.** "That's a great question" followed by a feature dump is not objection handling. Every response must acknowledge the concern first.
- **Do NOT create a playbook without competitive context.** Reps will face competition. Ignoring it doesn't make it go away.

## What to Do Next

- Build **battlecards** for competitors mentioned in the playbook: `/skill battlecard-generator`
- Create **discovery question sets** for specific personas: `/skill discovery-question-set`
- Design **custom demo scripts** for key segments: `/skill custom-demo-script`
- Build an **objection library** from real call data: `/skill objection-library`

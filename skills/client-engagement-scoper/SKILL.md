---
name: client-engagement-scoper
description: Scope a client engagement with deliverables, timeline, and pricing. Use when someone says "scope engagement", "client proposal", "scope project", "write proposal", "engagement scope", "project scope", or "client scoping"
allowed-tools: Read, Write
metadata:
  author: Achille Morin-Lemoine
  version: "1.0.0"
---

# Client Engagement Scoper

Scope a client engagement from discovery through proposal. Runs through scoping questions, defines deliverables and timeline, sets scope boundaries, determines pricing, and produces a ready-to-send proposal.

## Inputs

- **Client info** (required) -- company name, size, industry, what they do
- **Initial needs** (required) -- what they've asked for or what problem they described
- **Your services** (required) -- what you offer and typical pricing ranges
- **Discovery notes** (optional) -- notes from an initial conversation
- **Budget signals** (optional) -- any indication of budget or expectations

If client info or needs are missing, ask: "I need to know who the client is and what they've asked for. What's the context?"

## Steps

### Step 0 -- Check for Existing Output

Search the project for any existing output from a previous run of this skill (check common locations like `docs/`, the project root, or any organized output directory). If a previous version is found, present a summary and ask: "A scope for this client already exists. Do you want me to (a) update it, (b) scope a new engagement, or (c) keep it?" 

### Step 1 -- Load Context

Search the project for any available context. Look in the project root, `docs/`, or any organized directory. Read what you find:

1. **GTM Triangle** -- your positioning and ICP
2. **Proposals** documents -- prior proposals for format consistency
3. **Case studies** -- relevant proof points
4. **Productized Offer** documents -- productized offerings that might fit
5. `CLAUDE.md` -- project-level instructions

### Step 2 -- Run Discovery (10 Scoping Questions)

List the 10 questions needed to scope this engagement:

1. **Problem:** What specific problem are you trying to solve?
2. **Impact:** What happens if you don't solve it in the next 6 months?
3. **Current state:** What have you tried so far? What worked, what didn't?
4. **Success metrics:** How will you measure whether this engagement worked?
5. **Timeline:** When do you need results by? Is there a hard deadline?
6. **Stakeholders:** Who else is involved in this decision? Who will we work with day-to-day?
7. **Resources:** What internal resources (people, data, tools) are available?
8. **Budget:** What budget range have you allocated for this?
9. **Scope boundaries:** What's explicitly out of scope or someone else's responsibility?
10. **Decision process:** What's your process for approving this? Timeline for deciding?

For each question, note the answer if provided or mark as "[Needed from client]."

### Step 3 -- Define Deliverables

List every deliverable with specificity:

| # | Deliverable | Description | Format | Milestone |
|---|------------|-------------|--------|-----------|
| 1 | {name} | {exactly what they receive} | {doc, deck, system, etc.} | {when} |
| {rows} |

Rules:
- Every deliverable must be tangible and verifiable (the client can see it, review it, approve it)
- No vague deliverables ("strategic guidance" is not a deliverable. "GTM strategy document with ICP definition, messaging framework, and channel plan" is.)

### Step 4 -- Set Timeline with Milestones

| Week | Milestone | Deliverables | Client Action Needed |
|------|-----------|-------------|---------------------|
| 1-2 | {phase 1} | {outputs} | {inputs needed from client} |
| 3-4 | {phase 2} | {outputs} | {inputs needed from client} |
| {rows} |

Include client dependencies. If the timeline slips because the client doesn't provide inputs on time, the scope document should make that clear.

### Step 5 -- Define Scope Boundaries

**What's included:**
- {Specific item 1}
- {Specific item 2}
- {Specific item 3}

**What's explicitly NOT included:**
- {Exclusion 1} -- {why}
- {Exclusion 2} -- {why}
- {Exclusion 3} -- {why}

Rules:
- The exclusions list is more important than the inclusions list. Ambiguity about what's out of scope causes scope creep, conflict, and unprofitable engagements.
- If the client commonly asks for something that's out of scope, list it explicitly.

### Step 6 -- Set Pricing

Choose a pricing model:

**Fixed price:** Best for well-defined scope with clear deliverables. Price based on value delivered, not hours.

**Monthly retainer:** Best for ongoing work with variable scope. Define included hours or activities per month.

**Hybrid:** Fixed price for Phase 1 (defined scope) + retainer for Phase 2 (ongoing support).

For each model, calculate:
- Your cost (hours x internal rate)
- Client value (what this is worth to them in revenue, savings, or risk reduction)
- Price (set between cost and value, weighted toward value)

### Step 7 -- Write Proposal

Structure the proposal:

1. **Understanding** (2-3 sentences): Restate their problem in their language. Show you listened.
2. **Approach** (1 paragraph): How you'll solve it. Reference methodology.
3. **Deliverables** (table): What they'll receive, when.
4. **Timeline** (table): Milestones and dependencies.
5. **Investment** (pricing): What it costs and what's included.
6. **What's not included** (list): Clear exclusions.
7. **About you** (2-3 sentences + proof point): Why you're the right fit.
8. **Next steps** (1 sentence): How to proceed.

### Step 8 -- Quality Gate

- [ ] All 10 scoping questions are addressed (answered or flagged as needed)
- [ ] Every deliverable is tangible and verifiable
- [ ] Timeline includes client dependencies
- [ ] Exclusions list is specific (not "anything not mentioned")
- [ ] Pricing is set based on value, not just hours
- [ ] Proposal starts with their problem, not your credentials
- [ ] Proof point or relevant case study is included
- [ ] No em dashes in any copy

## Output Format

Save the output to your project. Suggested filename: `scope-{client-slug}.md`

```markdown
# Engagement Proposal: {Client Name}

Date: {Date}
Status: Draft / Sent / Accepted / Declined

## Understanding
{2-3 sentences restating their problem}

## Approach
{How you'll solve it}

## Deliverables
| # | Deliverable | Description | Timeline |
|---|------------|-------------|----------|
| {rows} |

## Timeline
| Week | Milestone | Client Input Needed |
|------|-----------|-------------------|
| {rows} |

## Investment
{Pricing with what's included}

## What's Not Included
{Specific exclusions}

## Why Us
{2-3 sentences + proof point}

## Next Steps
{How to proceed}

---

## Internal: Scoping Notes
{Answers to 10 scoping questions}
{Open questions for client}
{Risk factors}
```

## Key Principles

1. **Start with their problem, not your solution.** The proposal opens by demonstrating you understand their situation. If they don't feel heard, they won't read the rest.
2. **Exclusions prevent scope creep.** Being explicit about what's NOT included is more important than listing what is. Every ambiguity becomes an expectation the client holds you to.
3. **Price on value, not hours.** A GTM strategy that helps a company close $500K in new revenue is not worth $5K because it took 20 hours. Price relative to the outcome.
4. **Client dependencies are scope protection.** If the engagement stalls because the client doesn't provide data for 3 weeks, the timeline should reflect that risk explicitly.
5. **Every deliverable must be tangible.** If you can't show it, email it, or present it, it's not a deliverable. It's an activity.

## Anti-Patterns

- **The vague proposal.** "We'll provide strategic consulting and ongoing support." This scopes nothing and sets up misaligned expectations.
- **Hourly pricing for strategic work.** Billing by the hour for strategy incentivizes slow work and undervalues insight. Price by deliverable or by value.
- **No exclusions.** A proposal without exclusions means everything is in scope. You will do free work.

## What to Do Next

- Generate a **Statement of Work** from this scope: `/skill sow-generator`
- Write a **case study** relevant to this client's problem: `/skill case-study-builder`
- Build a **productized offer** from this engagement pattern: `/skill service-productizer`

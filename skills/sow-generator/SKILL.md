---
name: sow-generator
description: Generate a Statement of Work from engagement details. Use when someone says "statement of work", "SOW", "write SOW", "generate SOW", "contract scope", "engagement agreement", or "formal scope document"
allowed-tools: Read, Write
metadata:
  author: Achille Morin-Lemoine
  version: "1.0.0"
---

# SOW Generator

Generate a Statement of Work that formalizes an engagement with clear objectives, scope, timeline, acceptance criteria, payment terms, and change process. This is the document both parties sign, so precision matters.

## Inputs

- **Engagement details** (required) -- client, scope, deliverables, timeline, pricing
- **Proposal** (optional) -- an approved proposal to formalize into a SOW
- **Special terms** (optional) -- any non-standard terms (IP ownership, confidentiality, exclusivity)

If engagement details are missing, ask: "I need the client name, scope, deliverables, timeline, and pricing to generate the SOW. What are the details?"

## Steps

### Step 0 -- Check for Existing Output

Search the project for any existing output from a previous run of this skill (check common locations like `docs/`, the project root, or any organized output directory). If a previous version is found, present a summary and ask: "A SOW for this client already exists. Do you want me to (a) update it, (b) create a new one for a different engagement, or (c) keep it?" 

### Step 1 -- Load Context

Search the project for any available context. Look in the project root, `docs/`, or any organized directory. Read what you find:

1. **Scope Client** documents -- approved proposal
2. **Sow** documents -- prior SOWs for format consistency
3. `CLAUDE.md` -- project-level instructions

### Step 2 -- Write Objectives

Define 3-5 measurable objectives:

1. {Objective with specific outcome}
2. {Objective with specific outcome}
3. {Objective with specific outcome}

Each objective must be:
- Measurable (you can evaluate whether it was achieved)
- Time-bound (tied to a milestone)
- Directly connected to a deliverable

### Step 3 -- Write Scope Section

**Deliverables:**

| # | Deliverable | Description | Acceptance Criteria | Due Date |
|---|------------|-------------|-------------------|----------|
| 1 | {name} | {specific description} | {how client approves} | {date} |
| {rows} |

**Exclusions:**

The following are explicitly excluded from this engagement:
- {Exclusion 1}
- {Exclusion 2}
- {Exclusion 3}

Any work outside the defined deliverables requires a Change Order (see Change Process).

### Step 4 -- Write Timeline

| Phase | Dates | Deliverables | Dependencies |
|-------|-------|-------------|-------------|
| Kickoff | {date} | Kickoff meeting, access provisioned | Client provides: {inputs} |
| Phase 1 | {dates} | {deliverables} | Client provides: {inputs} by {date} |
| Phase 2 | {dates} | {deliverables} | Client approves Phase 1 deliverables |
| Completion | {date} | Final deliverables, handoff | Client provides final feedback |

Include a delay clause: "If client-dependent inputs are delayed beyond {N} business days from the agreed date, the timeline will shift accordingly."

### Step 5 -- Write Acceptance Criteria

For each deliverable, define how it gets approved:

1. Deliverable is submitted to {client contact} via {method}
2. Client has {N} business days to review and provide feedback
3. Consultant addresses feedback within {N} business days
4. If no feedback is received within the review period, the deliverable is considered accepted
5. Maximum {N} rounds of revision per deliverable

### Step 6 -- Write Payment Terms

| Milestone | Amount | Due Date | Trigger |
|-----------|--------|----------|---------|
| Signing | {%} of total | Upon signing | SOW execution |
| Phase 1 complete | {%} of total | {date} | Phase 1 deliverables accepted |
| Completion | {%} of total | {date} | All deliverables accepted |

Common structures:
- **50/50:** 50% upfront, 50% on completion
- **Milestone-based:** Payment tied to specific deliverables
- **Monthly retainer:** Fixed monthly amount with scope definition

Include: payment method, invoice terms (Net 15/30), late payment terms.

### Step 7 -- Write Change Process

Define how scope changes are handled:

1. Either party may request a change to scope, timeline, or deliverables
2. The requesting party submits a Change Order describing: what changes, impact on timeline, impact on cost
3. Both parties must approve the Change Order in writing before work begins
4. No additional work will be performed without an approved Change Order
5. Verbal agreements do not constitute Change Orders

### Step 8 -- Quality Gate

- [ ] Objectives are measurable and time-bound
- [ ] Every deliverable has acceptance criteria
- [ ] Exclusions are listed explicitly
- [ ] Timeline includes client dependencies and delay clause
- [ ] Payment terms are tied to milestones
- [ ] Change process is defined
- [ ] Review periods and revision limits are specified
- [ ] No em dashes in any copy

## Output Format

Save the output to your project. Suggested filename: `sow-{client-slug}.md`

```markdown
# Statement of Work: {Client Name}

Date: {Date}
Engagement: {Title}
Consultant: {Your name/company}
Client: {Client name}
Duration: {Start to End}
Total Investment: ${amount}

## 1. Objectives
{3-5 measurable objectives}

## 2. Scope

### 2.1 Deliverables
| # | Deliverable | Description | Acceptance Criteria | Due |
|---|------------|-------------|-------------------|-----|
| {rows} |

### 2.2 Exclusions
{What is NOT included}

## 3. Timeline
| Phase | Dates | Deliverables | Dependencies |
|-------|-------|-------------|-------------|
| {rows} |

**Delay clause:** {terms}

## 4. Acceptance Criteria
{Review process, timelines, revision limits}

## 5. Payment Terms
| Milestone | Amount | Due | Trigger |
|-----------|--------|-----|---------|
| {rows} |

**Invoice terms:** {Net 15/30}
**Late payment:** {terms}

## 6. Change Process
{How scope changes are requested, evaluated, and approved}

## 7. General Terms
- **Confidentiality:** {terms}
- **IP Ownership:** {who owns the work product}
- **Termination:** {conditions and notice period}
- **Limitation of Liability:** {terms}

## Signatures
Consultant: ______________________ Date: ______
Client: _________________________ Date: ______
```

## Key Principles

1. **The SOW protects both parties.** It's not adversarial. Clear terms prevent misunderstandings that damage the relationship. Ambiguity helps nobody.
2. **Acceptance criteria prevent endless revisions.** Without defined review periods and revision limits, a deliverable is never "done." Specify the process.
3. **Payment tied to milestones aligns incentives.** You deliver, they pay. Neither party carries all the risk. Milestone payments keep the engagement on track.
4. **The change process is the most important section.** Scope creep kills profitability. A clear change process gives you a professional way to say "that's additional work" without conflict.
5. **Exclusions are contractual.** If it's not in the exclusions and the client expects it, you have a problem. List everything that could be assumed but isn't included.

## Anti-Patterns

- **The handshake agreement.** "We'll figure out the details as we go" is how engagements go wrong. Formalize the scope before starting work.
- **Unlimited revisions.** Not specifying revision limits means the client can iterate forever. Cap revisions (typically 2 rounds) and charge for additional rounds.
- **100% payment on completion.** Puts all risk on the consultant. If the client disappears or delays, you've done months of work for free. Always collect something upfront.

## What to Do Next

- Scope the engagement first if not done: `/skill client-engagement-scoper`
- Write **client progress reports** during the engagement: `/skill client-report-writer`
- Build a **case study** after the engagement: `/skill case-study-from-engagement`

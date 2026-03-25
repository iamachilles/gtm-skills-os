---
name: sales-process-designer
description: Design a sales process with stages, entry/exit criteria, and automation triggers. Use when someone says "sales process", "sales stages", "pipeline stages", "deal stages", "sales methodology", "sales workflow", or "CRM stages"
allowed-tools: Read, Write
metadata:
  author: Achille Morin-Lemoine
  version: "1.0.0"
---

# Sales Process Designer

Design a complete sales process with 5-7 defined stages, each with entry criteria, exit criteria, required activities, automation triggers, and expected duration. Also defines pipeline rules for stale deals, commit categories, and stage-specific coaching guidance.

A good sales process makes every rep operate like your best rep. A bad one (or no process at all) means each rep invents their own, and you can't diagnose where deals die.

## Inputs

- **Sales motion** (required) -- inbound, outbound, PLG, channel, or hybrid
- **Average deal size** (required) -- determines process complexity
- **Average sales cycle** (required) -- weeks or months from first touch to close
- **Team structure** (optional) -- SDR/AE split, AM involvement, SE support
- **CRM in use** (optional) -- Salesforce, HubSpot, Pipedrive, etc.
- **Existing process** (optional) -- current stages to refine

If sales motion is missing, ask: "What's your primary sales motion (inbound, outbound, PLG, hybrid) and typical deal size? This determines how many stages we need."

## Steps

### Step 0 -- Check for Existing Output

Search the project for any existing output from a previous run of this skill (check common locations like `docs/`, the project root, or any organized output directory). If a previous version is found, present a summary and ask: "A sales process already exists with {N} stages. Do you want me to (a) refine criteria, (b) add automation triggers, or (c) rebuild from scratch?" 

### Step 1 -- Load Context

Search the project for any available context. Look in the project root, `docs/`, or any organized directory. Read what you find:

1. ICP document or gtm triangle.md documents -- qualification criteria
2. **Persona profiles** -- buying committee context
3. **Handoff Process** documents -- marketing-to-sales handoff if exists
4. **Deal Desk Playbook** documents -- pricing and approval workflows
5. `CLAUDE.md` -- project-level instructions

### Step 2 -- Define Sales Stages

Design 5-7 stages based on the sales motion. Standard framework:

1. **Qualified** -- Lead meets ICP criteria and has expressed interest or been prospected
2. **Discovery** -- First meeting held, pain confirmed, budget/timeline explored
3. **Evaluation** -- Demo or proof of value delivered, stakeholders engaged
4. **Proposal** -- Pricing and terms presented, decision criteria confirmed
5. **Negotiation** -- Terms being finalized, legal/procurement involved
6. **Closed Won** -- Contract signed, handoff to CS initiated
7. **Closed Lost** -- Deal lost, reason documented

Adjust stage count based on deal complexity. Under $10K ACV: 4-5 stages. $10K-100K: 5-6 stages. $100K+: 6-7 stages.

### Step 3 -- Define Entry and Exit Criteria Per Stage

For each stage, specify:

- **Entry criteria:** What must be true for a deal to enter this stage (observable, not assumed)
- **Exit criteria:** What must be completed before moving to the next stage
- **Required activities:** Specific actions the rep must take in this stage
- **Required fields:** CRM fields that must be populated before stage change
- **Automation triggers:** What happens automatically when a deal enters this stage

Entry criteria must be verifiable. "Prospect is interested" is not entry criteria. "Prospect attended demo and asked follow-up questions" is.

### Step 4 -- Set Expected Duration Per Stage

For each stage, define:

- **Expected duration:** Days or weeks a deal should spend here
- **Stale threshold:** When the deal is flagged as stuck (typically 1.5x expected duration)
- **Action when stale:** What happens (manager alert, required action, automatic downgrade)

### Step 5 -- Define Pipeline Rules

Set operational rules for the pipeline:

- **Commit categories:** Commit (90%+ confidence), Best Case (50-89%), Pipeline (20-49%), Upside (<20%)
- **Stale deal policy:** Deals with no activity for {N} days get flagged, then downgraded, then closed
- **Stage skip policy:** Which stages can be skipped (if any) and what justification is required
- **Multi-threading requirement:** By Evaluation stage, minimum 2 contacts engaged
- **Close date hygiene:** Close dates can't be pushed more than {N} times without manager approval

### Step 6 -- Add Stage-Specific Coaching Prompts

For each stage, add 2-3 questions a manager should ask during deal reviews:

- **Discovery:** "What's the cost of doing nothing? Who else is involved in this decision?"
- **Evaluation:** "Have we engaged the economic buyer? What's their evaluation criteria?"
- **Proposal:** "What's the decision timeline? What could block this deal?"
- **Negotiation:** "Who from procurement is involved? What are the remaining objections?"

### Step 7 -- Quality Gate

- [ ] 5-7 stages defined (not fewer, not more)
- [ ] Every stage has entry criteria, exit criteria, and required activities
- [ ] Entry criteria are observable and verifiable, not subjective
- [ ] Expected duration is set for every stage
- [ ] Stale deal thresholds and actions are defined
- [ ] Pipeline rules cover commit categories, stage skipping, and close date hygiene
- [ ] Coaching prompts exist for each active stage
- [ ] The process matches the sales motion (don't design an enterprise process for a PLG motion)

If any check fails, fix it before proceeding.

## Output Format

Save the output to your project. Suggested filename: `sales-process.md`

```markdown
# Sales Process
Date: {Date}
Sales Motion: {Type}
Average Deal Size: ${Amount}
Average Cycle: {Duration}

## Stage Overview
| # | Stage | Entry Criteria | Expected Duration | Stale Threshold |
|---|-------|---------------|-------------------|-----------------|

## Detailed Stage Definitions

### Stage 1: {Name}
- **Entry criteria:** {Observable criteria}
- **Exit criteria:** {What must be done}
- **Required activities:** {Specific actions}
- **Required CRM fields:** {Fields}
- **Automation triggers:** {What fires}
- **Expected duration:** {Days/weeks}
- **Stale at:** {Days}
- **Coaching questions:**
  - {Question 1}
  - {Question 2}

[Repeat for each stage]

## Pipeline Rules
- **Commit categories:** {Definitions}
- **Stale deal policy:** {Rules}
- **Stage skip policy:** {Rules}
- **Multi-threading:** {Requirements}
- **Close date hygiene:** {Rules}

## Stage Conversion Benchmarks
| From → To | Target Rate | Red Flag Below |
|-----------|------------|----------------|
```

## Key Principles

1. **Entry criteria must be observable.** "Prospect has budget" is unverifiable. "Prospect confirmed budget range in discovery call" is observable. If you can't see it, you can't enforce it.
2. **Fewer stages, strictly enforced, beat more stages loosely followed.** Five stages where every deal meets entry criteria is better than eight stages where reps skip three.
3. **The process should match the buyer's journey, not your internal org chart.** Stages should reflect how buyers decide, not how your team is structured.
4. **Stale deal management is the highest-leverage pipeline rule.** Deals that sit in one stage forever pollute your forecast and waste rep attention.

## Anti-Patterns

- **Stage inflation:** Moving deals forward to hit pipeline targets without meeting exit criteria. This is the most common and most damaging pipeline problem.
- **No stale deal policy:** Letting deals sit in "Proposal" for 6 months because the rep "has a feeling." Set thresholds and enforce them.
- **Process designed for the CRM, not the rep:** If reps need to fill 15 fields to move a deal, they won't move deals. Keep required fields minimal and meaningful.

## What to Do Next

- Design the **marketing-to-sales handoff** that feeds this process: `/skill handoff-designer`
- Build a **forecast model** based on these stages: `/skill forecast-model`
- Create a **deal desk playbook** for pricing in later stages: `/skill deal-desk-playbook`

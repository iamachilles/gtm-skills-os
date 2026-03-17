---
description: Generate a mutual action plan (MAP) to drive a deal to close. Trigger phrases — "mutual action plan", "MAP", "close plan", "deal timeline", "path to close", "buying process", "joint execution plan"
tools: Read, Write
---

# Mutual Action Plan

Generate a deal MAP (Mutual Action Plan) that works backwards from the target close date. Maps every milestone, assigns owners on both sides, flags dependencies, and identifies risks. A MAP is a shared commitment, not a seller's wishlist.

The MAP is the single most effective tool for preventing deals from stalling. If both sides agree to the plan, the deal has momentum. If the buyer won't commit to a MAP, that tells you something important about the deal.

## Inputs

- **Deal details** (required) -- company name, solution being sold, deal size
- **Target close date** (required) -- when the deal needs to close
- **Key stakeholders** (required) -- who's involved on both sides
- **Current stage** (optional) -- where the deal is today
- **Known requirements** (optional) -- security review, legal, procurement specifics
- **Blockers** (optional) -- anything already identified as a risk

If target close date is missing, ask: "When does this deal need to close? I'll work backwards from that date to build the plan."

## Steps

### Step 0 -- Check for Existing Output

Read `docs/sales/map-{deal-slug}.md` if it exists. If found, present a summary and ask: "A MAP for this deal already exists (dated {date}). Do you want me to (a) update with new milestones, or (b) rebuild from scratch?"

### Step 1 -- Load Context

Read available context files:

1. `docs/icp.md` -- typical buying process for this ICP
2. `docs/gtm-triangle.md` -- solution context
3. `docs/sales/deal-strategy-{deal-slug}.md` -- existing deal analysis if available
4. `CLAUDE.md` -- project-level instructions

### Step 2 -- Work Backwards from Close Date

Starting from the target close date, work backwards through standard milestones. Assign realistic durations to each:

1. **Final sign-off** -- the actual signature (Day 0)
2. **Legal/procurement review** -- contract redlines, MSA negotiation (typically 1-2 weeks)
3. **Security review** -- InfoSec questionnaire, compliance check (typically 1-3 weeks)
4. **Business case approved** -- economic buyer signs off on budget (typically 1 week)
5. **Technical validation** -- POC, pilot, or technical deep-dive (typically 1-3 weeks)
6. **Stakeholder alignment** -- all decision-makers agree on direction (typically 1 week)
7. **Proposal delivered** -- formal proposal or SOW sent (current stage or earlier)

Adjust durations based on deal complexity, company size, and any known procurement requirements.

### Step 3 -- Assign Owners

For each milestone, assign:
- **Buyer-side owner:** Who on their team is responsible
- **Seller-side owner:** Who on your team is responsible
- **Action items:** Specific tasks for each owner
- **Due date:** Calculated from the backwards timeline

Both sides must have skin in the game. If all action items are on the seller side, it's not a mutual plan.

### Step 4 -- Map Dependencies

Identify what must happen before each milestone can start:
- Which milestone blocks which
- External dependencies (budget cycles, board meetings, fiscal year timing)
- Information needed from the buyer before you can proceed
- Internal approvals needed on either side

### Step 5 -- Flag Risks

For each milestone, assess:
- What could cause delay
- How likely the delay is
- Buffer time already built in
- Contingency action if delayed

Identify the single biggest risk to the timeline and recommend a specific mitigation.

### Step 6 -- Quality Gate

Before saving, verify:

- [ ] Timeline works backwards from close date with realistic durations
- [ ] Every milestone has both a buyer-side and seller-side owner
- [ ] Dependencies are mapped. No milestone floats independently.
- [ ] At least 3 risks are identified with mitigations
- [ ] Buffer time is built into the most unpredictable milestones (legal, security)
- [ ] The plan is genuinely mutual. Both sides have action items throughout.
- [ ] Due dates don't fall on weekends or known holidays

If any check fails, fix it before proceeding.

## Output Format

Save to `docs/sales/map-{deal-slug}.md`:

```markdown
# Mutual Action Plan: {Company Name}
Deal: {Solution/Scope}
Target Close Date: {Date}
Created: {Date}

## Stakeholders

**Buyer Side:**
| Name | Role | Responsibility |
|------|------|---------------|
| {Name} | {Title} | {What they own in this process} |

**Seller Side:**
| Name | Role | Responsibility |
|------|------|---------------|
| {Name} | {Title} | {What they own in this process} |

## Timeline

| # | Milestone | Owner (Buyer) | Owner (Seller) | Due Date | Status |
|---|-----------|--------------|----------------|----------|--------|
| 1 | {Milestone} | {Name} | {Name} | {Date} | Not Started |
| 2 | {Milestone} | {Name} | {Name} | {Date} | Not Started |
| 3 | {Milestone} | {Name} | {Name} | {Date} | Not Started |
| 4 | {Milestone} | {Name} | {Name} | {Date} | Not Started |
| 5 | {Milestone} | {Name} | {Name} | {Date} | Not Started |

## Action Items by Milestone

### Milestone 1: {Name} -- Due {Date}
**Buyer actions:**
- [ ] {Action item} -- {Owner}
- [ ] {Action item} -- {Owner}

**Seller actions:**
- [ ] {Action item} -- {Owner}
- [ ] {Action item} -- {Owner}

**Depends on:** {Prerequisite or "None -- can start immediately"}

[Repeat for each milestone]

## Dependencies Map
- {Milestone X} requires {Milestone Y} to be complete
- {External dependency}: {Description and expected date}
- {Blocker}: {What could hold things up}

## Risk Register

| Risk | Impact | Likelihood | Buffer Built | Mitigation |
|------|--------|-----------|-------------|------------|
| {Risk 1} | {H/M/L} | {H/M/L} | {Days} | {Action} |
| {Risk 2} | {H/M/L} | {H/M/L} | {Days} | {Action} |
| {Risk 3} | {H/M/L} | {H/M/L} | {Days} | {Action} |

## Biggest Risk to Timeline
{One paragraph: the single most likely thing to derail the timeline, and the specific action to prevent it}

## Review Cadence
{How often to review this plan -- e.g., "Weekly 15-min check-in every Tuesday at 2pm"}
```

## Key Principles

1. **Work backwards, not forwards.** Starting from the close date and working backwards reveals whether the timeline is realistic. Starting from today and working forward produces wishful thinking.
2. **Mutual means mutual.** If the buyer won't commit to their action items, the deal isn't real. A one-sided plan is just a to-do list.
3. **Buffer the unpredictable.** Legal, security, and procurement timelines are rarely faster than expected. Build in buffer where it matters most.
4. **The MAP is a qualifying tool.** A buyer who engages with the MAP is serious. A buyer who won't look at it is telling you something.
5. **Review weekly.** A MAP that isn't actively tracked becomes decoration. Schedule a recurring check-in.

## Anti-Patterns

- **Do NOT create a seller-only action plan.** If fewer than 40% of action items are on the buyer side, the plan isn't mutual and won't create accountability.
- **Do NOT assume standard timelines.** Ask the prospect about their specific procurement process. Every company's legal and security review is different.
- **Do NOT skip the risk register.** Optimism bias kills deal timelines. Name the risks explicitly.

## What to Do Next

- Build a **champion enablement kit** to help your internal advocate: `/skill champion-enablement-kit`
- Write the **proposal** referenced in the MAP: `/skill proposal-writer`
- Get a **deal strategy** assessment: `/skill deal-strategy-advisor`

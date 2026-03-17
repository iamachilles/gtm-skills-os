---
description: Design the marketing-to-sales handoff with MQL criteria, SLA, and routing rules. Use when someone says "lead handoff", "MQL handoff", "marketing to sales", "lead routing", "handoff process", "lead SLA", or "lead qualification handoff"
tools: Read, Write
---

# Handoff Designer

Design the marketing-to-sales handoff process with MQL criteria, response SLA, routing rules, feedback loops, and escalation paths. This is the most common failure point in GTM: marketing generates leads that sales ignores, or sales gets leads that aren't qualified.

The fix is a contract between marketing and sales. Marketing commits to quality criteria. Sales commits to response time. Both commit to a feedback loop that improves quality over time.

## Inputs

- **Lead scoring model** (required) -- how leads are scored (or criteria to build one)
- **Sales team structure** (required) -- who receives leads (SDR, AE, or both)
- **Current handoff process** (optional) -- what exists today and where it breaks
- **CRM/automation tools** (optional) -- what systems manage the handoff
- **Volume estimates** (optional) -- how many leads per month

If lead scoring is missing, ask: "I need your lead scoring criteria or MQL definition. What combination of firmographic fit and behavioral signals qualifies a lead for sales?"

## Steps

### Step 0 -- Check for Existing Output

Read `docs/ops/handoff-process.md` if it exists. If found, present a summary and ask: "A handoff process already exists. Do you want me to (a) tighten MQL criteria, (b) update routing rules, or (c) rebuild from scratch?"

### Step 1 -- Load Context

Read all available context:

1. `docs/icp.md` or `docs/gtm-triangle.md` -- ICP criteria
2. `docs/ops/sales-process.md` -- what happens after handoff
3. `docs/personas/*.md` -- who becomes an MQL
4. `docs/ops/territory-plan.md` -- territory routing context
5. `CLAUDE.md` -- project-level instructions

### Step 2 -- Define MQL Criteria

Set the threshold that triggers a handoff. MQL = lead score threshold + behavior trigger:

**Lead Score (Firmographic Fit):**
- ICP match: industry, company size, role, seniority
- Score 1-100 based on weighted criteria
- Minimum score threshold: {N} points

**Behavior Triggers (any one of these + score threshold = MQL):**
- Requested demo or pricing
- Downloaded 3+ content pieces in 30 days
- Attended webinar and asked a question
- Visited pricing page 2+ times
- Replied to outbound sequence

The combination matters. High firmographic score + low behavior = nurture. Low firmographic score + high behavior = disqualify. Both high = MQL.

### Step 3 -- Set Response SLA

Define the contract for response time:

- **Hot leads** (demo request, pricing inquiry): Under 4 hours during business hours
- **Warm leads** (content engagement, webinar): Under 24 hours
- **Inbound from Tier 1 accounts:** Under 2 hours, alert to AE immediately

SLA starts when the lead is routed, not when it's created. Track SLA compliance as a team metric.

Define consequences for SLA breach: lead reassigned after {N} hours, manager alert, weekly compliance report.

### Step 4 -- Design Routing Rules

Define how leads are assigned:

- **By territory:** Route to the rep who owns that account/territory
- **By tier:** Tier 1 account leads go directly to AE. Others go to SDR.
- **Round-robin:** Distribute evenly across available reps (for unassigned territories)
- **Capacity-based:** Route to rep with lowest current lead count

Handle edge cases:
- Lead from an existing customer: route to AM/CSM, not SDR
- Lead from a Tier 1 target account: alert the AE regardless of behavior score
- Multiple leads from same company: route to same rep

### Step 5 -- Create Feedback Loop

Design the bidirectional feedback mechanism:

**Sales to Marketing (per lead):**
- **Accepted:** Lead meets criteria, working it
- **Rejected (with reason):** Wrong persona, bad timing, not decision maker, competitor, already in pipeline
- Required within 48 hours of receiving the lead

**Marketing actions on feedback:**
- High rejection rate from a source: investigate and fix or remove
- Common rejection reason: adjust MQL criteria to filter earlier
- Monthly feedback review meeting between marketing and sales leaders

Track: acceptance rate (target >70%), rejection reasons, time-to-follow-up, conversion from MQL to opportunity.

### Step 6 -- Define Escalation Path

When the process breaks:

- **SLA breach:** Auto-reassign to backup rep, notify manager
- **High rejection rate (>40%):** Trigger criteria review meeting
- **Rep not logging feedback:** Manager escalation after 3 missed responses
- **Lead quality dispute:** Escalate to marketing + sales leadership for criteria adjustment

### Step 7 -- Quality Gate

- [ ] MQL criteria combine firmographic score AND behavioral trigger (not one alone)
- [ ] SLA is under 4 hours for hot leads and under 24 hours for warm leads
- [ ] Routing handles edge cases (existing customers, Tier 1 accounts, multiple leads)
- [ ] Feedback loop requires sales to accept or reject with reason within 48 hours
- [ ] Acceptance rate target is defined (>70%)
- [ ] Escalation path covers SLA breach, high rejection, and quality disputes
- [ ] The process can be automated in the existing CRM/tools

If any check fails, fix it before proceeding.

## Output Format

Save to `docs/ops/handoff-process.md`:

```markdown
# Marketing-to-Sales Handoff
Date: {Date}
CRM: {System}
Volume: {N} leads/month

## MQL Definition

### Lead Score Criteria
| Criteria | Weight | Scoring |
|----------|--------|---------|

**Minimum score threshold:** {N} points

### Behavior Triggers
| Trigger | Alone Sufficient? | Notes |
|---------|-------------------|-------|

**MQL = Score >= {N} + at least one behavior trigger**

## Response SLA
| Lead Type | SLA | Breach Action |
|-----------|-----|---------------|
| Hot (demo/pricing) | <4 hours | Reassign |
| Warm (content) | <24 hours | Manager alert |
| Tier 1 account | <2 hours | AE + manager alert |

## Routing Rules
| Condition | Route To | Method |
|-----------|----------|--------|

## Feedback Loop
### Sales Response (required within 48 hours)
- **Accepted:** {What happens next}
- **Rejected:** {Required: select reason}

### Rejection Reasons
1. Wrong persona / title
2. Bad timing / not in market
3. Not decision maker
4. Competitor / vendor
5. Already in pipeline
6. Does not meet ICP

### Monthly Review
- **Metrics:** Acceptance rate, conversion rate, time-to-follow-up
- **Target acceptance rate:** >70%
- **Action trigger:** Acceptance rate drops below 60%

## Escalation Path
| Trigger | Action | Owner |
|---------|--------|-------|
```

## Key Principles

1. **MQL is a contract, not a guess.** Both teams must agree on what qualifies. If marketing says "they downloaded a whitepaper" and sales says "that's not a lead," the contract is broken.
2. **Speed matters more than perfection.** A 4-hour response to a B+ lead beats a 48-hour response to an A+ lead. Speed is the single biggest predictor of conversion.
3. **Feedback loops fix quality over time.** The first version of MQL criteria will be wrong. The feedback loop is how it gets right.
4. **Route to the right person, not just any person.** A Tier 1 account lead that lands on the wrong SDR wastes the most valuable lead in your pipeline.

## Anti-Patterns

- **No feedback mechanism:** Marketing sends leads and never hears what happened. Quality never improves because no one measures it.
- **Over-qualified MQLs:** Setting criteria so high that marketing delivers 10 leads per month. Sales is happy with quality but starving for volume. Balance both.
- **SLA without enforcement:** Setting a 4-hour SLA and never tracking compliance. An unenforced SLA is a suggestion.

## What to Do Next

- Design the **sales process** that takes over after handoff: `/skill sales-process-designer`
- Build a **forecast model** from handoff-to-close: `/skill forecast-model`
- Plan **capacity** based on lead volume: `/skill capacity-planner`

---
description: Create a customer success plan with goals, KPIs, milestones, and QBR format. Use when someone says "success plan", "customer success plan", "QBR template", "customer goals", "success metrics", "customer KPIs", or "quarterly business review"
tools: Read, Write
---

# Success Plan Template

Create a customer success plan built around the customer's objectives (not yours) with measurable KPIs, quarterly milestones, risk identification, QBR format, and an executive summary template. The success plan is the single document that aligns your team and the customer on what "success" looks like.

A success plan without customer goals is a vendor management document. A success plan with customer goals is a partnership roadmap. This skill forces the distinction.

## Inputs

- **Customer name** (required) -- who the plan is for
- **Customer goals** (required) -- what the customer wants to achieve (in their words)
- **Products/services in use** (required) -- what they bought
- **Contract details** (optional) -- ACV, contract length, renewal date
- **Key stakeholders** (optional) -- customer-side contacts and their roles
- **Current performance data** (optional) -- baseline metrics to improve from

If customer goals are missing, ask: "What does this customer want to achieve? I need their objectives in their own words, not what we want them to achieve."

## Steps

### Step 0 -- Check for Existing Output

Read `docs/ops/success-plan-template.md` if it exists. If found, present a summary and ask: "A success plan template already exists. Do you want me to (a) update KPIs, (b) redesign the QBR format, or (c) rebuild from scratch?"

### Step 1 -- Load Context

Read all available context:

1. `docs/ops/customer-onboarding.md` -- onboarding milestones achieved
2. `docs/ops/customer-health-model.md` -- health dimensions to track
3. `docs/ops/upsell-triggers.md` -- expansion opportunities
4. `CLAUDE.md` -- project-level instructions

### Step 2 -- Define Customer Goals

Translate customer objectives into structured goals:

For each goal:
- **Goal statement:** In the customer's language, what they want to accomplish
- **Why it matters:** Business impact if achieved
- **How your product helps:** Connection between their goal and your value
- **Measurement:** How progress is tracked
- **Timeline:** When they expect to see results

Limit to 3-5 goals. More than 5 dilutes focus and makes tracking impossible.

### Step 3 -- Set KPIs

For each goal, define 1-2 measurable KPIs:

| Goal | KPI | Baseline | Target | Timeline | Measurement Frequency |
|------|-----|----------|--------|----------|----------------------|

KPI requirements:
- Must be measurable with available data
- Must have a clear baseline (where they are today)
- Must have a specific target (not "improve" but "increase by 20%")
- Must have a timeline (not "eventually" but "by end of Q3")

### Step 4 -- Plan Quarterly Milestones

Break goals into quarterly progress markers:

**Q1 Milestones:**
- {Milestone 1}: What should be achieved by end of Q1
- {Milestone 2}: What progress looks like
- Expected KPI levels: {Interim targets}

**Q2 Milestones:**
- {Milestone 3}: Building on Q1 progress
- {Milestone 4}: New capabilities or workflows enabled
- Expected KPI levels: {Interim targets}

**Q3 Milestones:**
- {Milestone 5}: Approaching target performance
- Expected KPI levels: {Near-target values}

**Q4 Milestones:**
- {Milestone 6}: Full target achievement
- Success criteria met: {Specific outcomes}

Milestones should be reviewed and adjusted each quarter based on actual progress.

### Step 5 -- Identify Risks and Mitigation

Document known risks to success:

| Risk | Probability | Impact | Mitigation | Owner |
|------|------------|--------|-----------|-------|
| Champion leaves | Medium | High | Multi-thread to 2+ stakeholders | CSM |
| Low adoption | Medium | High | Training program, usage incentives | CSM + Training |
| Technical integration issues | Low | Medium | Dedicated SE support, escalation path | SE |
| Budget cut | Low | High | Demonstrate ROI before budget review | CSM + AE |
| Scope creep | Medium | Medium | Regular goal review, change management | CSM |

For each risk: what would trigger it, how you'd detect it early, and the specific action to mitigate.

### Step 6 -- Design QBR Format

Create a quarterly business review template:

**QBR Structure (60 minutes):**

1. **(5 min) Goals recap:** Remind everyone what we're working toward
2. **(15 min) Results review:** KPI progress vs. targets with visualizations
3. **(10 min) What worked:** Highlight wins and positive trends
4. **(10 min) What needs attention:** Gaps, risks, and areas for improvement
5. **(10 min) Next quarter plan:** Updated milestones and priorities
6. **(5 min) Expansion discussion:** Natural place to discuss new use cases or capabilities
7. **(5 min) Action items:** Clear next steps with owners and deadlines

QBR rules:
- Customer presents their perspective first (not just your slides)
- No surprises: share data before the meeting so discussion is productive
- Executive sponsor attends at least 2 QBRs per year

### Step 7 -- Create Executive Summary Template

Design a one-page executive summary for stakeholders who don't attend QBRs:

- **Account status:** Green/Yellow/Red with one-line explanation
- **Goal progress:** Each goal with current vs. target KPI
- **Key wins this quarter:** 2-3 specific achievements
- **Risks:** Top risk and mitigation status
- **Next quarter focus:** Top 2 priorities
- **Expansion opportunity:** If applicable, one-line description

### Step 8 -- Quality Gate

- [ ] Goals are in the customer's language, not your product language
- [ ] 3-5 goals maximum (focused, not comprehensive)
- [ ] Every KPI has a baseline, target, and timeline
- [ ] Quarterly milestones exist for at least the next 2 quarters
- [ ] At least 3 risks identified with mitigation plans
- [ ] QBR format is under 60 minutes with clear time allocations
- [ ] Executive summary fits on one page
- [ ] The plan would make sense to the customer if they read it (no internal jargon)

If any check fails, fix it before proceeding.

## Output Format

Save to `docs/ops/success-plan-template.md`:

```markdown
# Customer Success Plan: {Customer Name}
Date: {Date}
CSM: {Name}
Contract: ${ACV} | Renews: {Date}

## Customer Goals
### Goal 1: {Goal in customer's words}
- **Business impact:** {Why it matters}
- **Our role:** {How we help}
- **KPI:** {Metric} | Baseline: {Current} | Target: {Goal} | By: {Date}

### Goal 2: {Goal}
[Same structure]

### Goal 3: {Goal}
[Same structure]

## KPI Dashboard
| Goal | KPI | Baseline | Current | Target | Status |
|------|-----|----------|---------|--------|--------|

## Quarterly Milestones
### Q{N} ({Dates})
- [ ] {Milestone 1}
- [ ] {Milestone 2}
- KPI targets: {Interim targets}

### Q{N+1} ({Dates})
[Same structure]

## Risk Register
| Risk | Probability | Impact | Mitigation | Owner | Status |
|------|------------|--------|-----------|-------|--------|

## QBR Agenda Template
| Time | Topic | Owner | Notes |
|------|-------|-------|-------|
| 0:00 | Goals recap | CSM | {Notes} |
| 0:05 | Results review | CSM + Customer | {Notes} |
| 0:20 | What worked | Customer | {Notes} |
| 0:30 | What needs attention | Both | {Notes} |
| 0:40 | Next quarter plan | CSM | {Notes} |
| 0:50 | Expansion discussion | CSM | {Notes} |
| 0:55 | Action items | Both | {Notes} |

## Executive Summary (One-Pager)
**Status:** {Green/Yellow/Red}
**Goal Progress:** {Summary}
**Key Wins:** {2-3 bullets}
**Top Risk:** {Risk and status}
**Next Quarter:** {Focus areas}
**Expansion:** {Opportunity if applicable}

## Key Stakeholders
| Name | Title | Role | Engagement Level |
|------|-------|------|-----------------|
```

## Key Principles

1. **Customer goals, not your goals.** "Increase product adoption" is your goal. "Reduce manual reporting time by 50%" is theirs. The plan must be built around their objectives.
2. **Measurable or meaningless.** Every goal needs a KPI with a number and a date. "Improve efficiency" is unmeasurable. "Reduce report generation from 4 hours to 1 hour by Q3" is actionable.
3. **QBRs are for strategic alignment, not status updates.** If the QBR is just reading metrics, send a report instead. QBRs should be discussions about direction and decisions.
4. **The plan evolves.** A static success plan is a dead document. Update goals, KPIs, and milestones every quarter based on actual results and changing priorities.
5. **Risks are features, not bugs.** Documenting risks shows maturity. Customers appreciate proactive risk management more than pretending everything is perfect.

## Anti-Patterns

- **Vendor-centric plans.** Success plans that list your features and adoption targets instead of the customer's business goals. If the customer wouldn't recognize their objectives in the plan, it's wrong.
- **No baseline data.** Setting targets without knowing where the customer starts. "Improve by 20%" from what? Establish baselines before setting targets.
- **Quarterly reviews without quarterly plans.** Reviewing the same goals and KPIs without updating milestones. The plan should evolve based on what you learned.

## What to Do Next

- Design **customer onboarding** that feeds this plan: `/skill customer-onboarding-planner`
- Build a **health scoring model** aligned with these KPIs: `/skill customer-health-scorer`
- Map **expansion opportunities** from successful goals: `/skill account-expansion-planner`

---
name: compensation-modeler
description: Design a sales compensation plan with base/variable split, accelerators, and payout modeling. Use when someone says "comp plan", "compensation model", "sales comp", "commission structure", "incentive plan", "quota and comp", "OTE", or "sales incentives"
allowed-tools: Read, Write
metadata:
  author: Achille Morin-Lemoine
  version: "1.0.0"
---

# Compensation Modeler

Design a sales compensation plan for a specific role with base/variable split, quota, accelerators, SPIFs, and modeled payouts at multiple attainment levels. The output is a plan document a rep can understand and a finance team can budget against.

Comp plans drive behavior. If you pay for meetings, reps book meetings. If you pay for revenue, reps close deals. If you pay for nothing in particular, reps do nothing in particular. This skill forces deliberate design of what you're incentivizing.

## Inputs

- **Role** (required) -- SDR, AE, AM, CSM, or hybrid
- **OTE range** (required) -- on-target earnings for this role
- **Quota** (required) -- what the rep is measured on and the target number
- **Company stage** (optional) -- startup, growth, enterprise (affects plan complexity)
- **Team size** (optional) -- how many reps on this plan
- **Existing plan** (optional) -- current comp structure to refine

If role or OTE is missing, ask: "Which role are we designing comp for, and what's the target OTE? I also need the quota metric (revenue, meetings, etc.) and target."

## Steps

### Step 0 -- Check for Existing Output

Search the project for any existing output from a previous run of this skill (check common locations like `docs/`, the project root, or any organized output directory). If a previous version is found, present a summary and ask: "A compensation model already exists for {role}. Do you want me to (a) adjust accelerators, (b) add a new role, or (c) rebuild from scratch?" 

### Step 1 -- Load Context

Search the project for any available context. Look in the project root, `docs/`, or any organized directory. Read what you find:

1. **Sales Process** documents -- what the team is executing
2. **Territory Plan** documents -- quota context and territory balance
3. **Capacity Plan** documents -- headcount and productivity assumptions
4. `CLAUDE.md` -- project-level instructions

### Step 2 -- Define Base/Variable Split

Set the split based on role:

| Role | Typical Split | Rationale |
|------|--------------|-----------|
| SDR | 60/40 or 70/30 | Higher base because SDRs don't control close. Variable rewards pipeline generation. |
| AE | 50/50 | Equal weight. Variable is meaningful enough to drive urgency. |
| AM/CSM | 70/30 or 80/20 | Higher base because retention is relationship-driven. Variable rewards expansion. |

Calculate: Base salary = OTE x base percentage. Variable = OTE x variable percentage.

### Step 3 -- Design Quota and Commission Rate

Define the primary quota metric and rate:

- **Quota metric:** ARR booked, ACV closed, meetings set, pipeline generated, net retention
- **Quota target:** ${Amount} per {period}
- **Commission rate at 100%:** Variable pay / quota target = rate per unit
- **Payment frequency:** Monthly, quarterly, or upon booking

For AEs: commission rate = variable compensation / annual quota. Example: $75K variable / $750K quota = 10% commission rate.

### Step 4 -- Design Accelerators

Create a tiered commission structure above quota:

| Attainment | Rate Multiplier | Effective Rate |
|-----------|----------------|----------------|
| 0-80% | 1.0x (or 0.8x if using a floor) | {Rate} |
| 80-100% | 1.0x | {Rate} |
| 100-120% | 1.5x | {Rate} |
| 120-150% | 2.0x | {Rate} |
| 150%+ | 2.0x (capped or uncapped) | {Rate} |

Design considerations:
- **Floor:** Some plans pay nothing below 50% attainment. Harsh but controls cost.
- **Kicker at 100%:** Some plans add a bonus for hitting exactly 100% (encourages precision).
- **Cap vs. uncapped:** Uncapped plans attract top performers. Capped plans control cost. Choose deliberately.

### Step 5 -- Add SPIFs for Strategic Behaviors

Design 1-3 SPIFs (Sales Performance Incentive Funds) for specific behaviors:

- **Multi-year deal SPIF:** Extra {$X or %} for 2+ year contracts (improves retention)
- **New logo SPIF:** Bonus for net-new customers vs. expansion (drives growth)
- **Strategic product SPIF:** Bonus for selling a specific product or service (drives adoption)
- **Speed SPIF:** Bonus for deals closed within {N} days of creation (improves velocity)

SPIFs should be temporary (1 quarter) and address a specific business need. Permanent SPIFs become expected comp.

### Step 6 -- Model Payouts at Multiple Attainment Levels

Calculate total compensation at 80%, 100%, 120%, and 150% attainment:

| Attainment | Quota Hit | Base | Variable | SPIFs | Total Comp | % of OTE |
|-----------|-----------|------|----------|-------|-----------|----------|
| 80% | ${Amount} | ${Amount} | ${Amount} | ${Amount} | ${Amount} | {%} |
| 100% | ${Amount} | ${Amount} | ${Amount} | ${Amount} | ${Amount} | 100% |
| 120% | ${Amount} | ${Amount} | ${Amount} | ${Amount} | ${Amount} | {%} |
| 150% | ${Amount} | ${Amount} | ${Amount} | ${Amount} | ${Amount} | {%} |

Validate: at 100% attainment, total comp should equal OTE. At 150%, top performers should earn 1.5-2x OTE.

### Step 7 -- Quality Gate

- [ ] Base/variable split is appropriate for the role
- [ ] Commission rate math checks out (variable / quota = rate)
- [ ] Accelerators create meaningful upside above quota (at least 1.5x rate)
- [ ] Payout at 100% equals OTE (basic math validation)
- [ ] Payout at 150% is attractive enough to retain top performers (1.5-2x OTE)
- [ ] SPIFs address specific, current business needs (not permanent entitlements)
- [ ] The plan is simple enough to explain in 5 minutes

If any check fails, fix it before proceeding.

## Output Format

Save the output to your project. Suggested filename: `compensation-model.md`

```markdown
# Compensation Model: {Role}
Date: {Date}
OTE: ${Amount}
Base/Variable Split: {Ratio}

## Plan Structure
- **Base salary:** ${Amount}
- **Variable (at 100%):** ${Amount}
- **Quota metric:** {Metric}
- **Quota target:** ${Amount} per {period}
- **Commission rate:** {%} per ${unit}
- **Payment frequency:** {Frequency}

## Commission Tiers
| Attainment | Rate Multiplier | Effective Rate |
|-----------|----------------|----------------|

## SPIFs
| SPIF | Trigger | Reward | Duration |
|------|---------|--------|----------|

## Payout Model
| Attainment | Quota Hit | Base | Variable | SPIFs | Total | % of OTE |
|-----------|-----------|------|----------|-------|-------|----------|
| 80% | | | | | | |
| 100% | | | | | | |
| 120% | | | | | | |
| 150% | | | | | | |

## Plan Rules
- **Floor:** {Minimum attainment for variable pay}
- **Cap:** {Capped or uncapped}
- **Clawback:** {Policy for churned deals}
- **Payment timing:** {When commission is paid}
- **Quota credit:** {What counts toward quota}
```

## Key Principles

1. **Comp drives behavior, period.** Whatever you pay for is what reps will optimize for. If you pay for meetings, expect lots of low-quality meetings. Design accordingly.
2. **Simplicity wins.** If a rep can't calculate their commission in their head, the plan is too complex. Complex plans create confusion and distrust.
3. **Accelerators retain top performers.** If your best rep earns the same commission rate above quota as below, they'll leave for a company that rewards outperformance.
4. **Model the math before launching.** Every comp plan looks reasonable in theory. Model payouts at 80%, 100%, 120%, and 150% to catch unintended consequences.
5. **SPIFs are temporary by design.** A SPIF that runs for four consecutive quarters is just comp. Use them for specific, time-bound behavior changes.

## Anti-Patterns

- **Equal pay for unequal performance.** Flat commission rates with no accelerators. Top performers subsidize average performers and eventually leave.
- **Unmeasurable quotas.** Setting quotas on metrics the rep can't track in real time. If they can't see how close they are to quota, the incentive doesn't work.
- **Frequent plan changes.** Changing comp plans every quarter destroys trust. Design a plan that works for a full year minimum.

## What to Do Next

- Design **territories** that align with these quotas: `/skill territory-planner`
- Model **headcount** based on these economics: `/skill capacity-planner`
- Build the **sales process** reps will execute: `/skill sales-process-designer`

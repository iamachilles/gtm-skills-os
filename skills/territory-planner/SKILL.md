---
description: Design sales territories with account distribution, capacity modeling, and quota setting. Use when someone says "territory plan", "territory design", "sales territories", "territory mapping", "account distribution", "rep assignment", or "territory balance"
tools: Read, Write
---

# Territory Planner

Design balanced sales territories with segmentation, account distribution, capacity modeling per rep, and quotas. The goal is that no territory has 3x the pipeline of another, every rep has a fair shot at quota, and coverage matches your GTM priorities.

Territory imbalance is the silent killer of sales teams. If one rep has 500 accounts and another has 50, no comp plan or coaching will fix the performance gap. This skill makes imbalance visible and fixable.

## Inputs

- **Total account list** (required) -- all accounts to distribute
- **Segmentation preference** (required) -- geographic, vertical, account-based, named accounts, or hybrid
- **Number of reps** (required) -- headcount to distribute across
- **Revenue targets** (optional) -- total and per-rep quota targets
- **Historical data** (optional) -- win rates, deal sizes, cycle times by segment
- **Existing territories** (optional) -- current assignments to refine

If account list or rep count is missing, ask: "I need your total account list and number of reps to design territories. How many accounts and how many reps?"

## Steps

### Step 0 -- Check for Existing Output

Read `docs/ops/territory-plan.md` if it exists. If found, present a summary and ask: "A territory plan already exists with {N} territories. Do you want me to (a) rebalance accounts, (b) adjust quotas, or (c) rebuild from scratch?"

### Step 1 -- Load Context

Read all available context:

1. `docs/account-tiering-model.md` -- tier distribution
2. `docs/icp.md` or `docs/gtm-triangle.md` -- ICP criteria
3. `docs/ops/sales-process.md` -- sales cycle expectations
4. `docs/ops/capacity-plan.md` -- capacity modeling if exists
5. `CLAUDE.md` -- project-level instructions

### Step 2 -- Choose Segmentation Model

Select and justify one approach:

- **Geographic:** Split by region. Best for field sales or when market dynamics vary by location.
- **Vertical/Industry:** Split by industry. Best when domain expertise drives win rates.
- **Account-based/Named:** Assign specific accounts to reps. Best for enterprise with <200 total accounts.
- **Hybrid:** Combine two approaches (e.g., vertical within geography). Best for large teams.

The right model depends on: team size, account volume, sales motion, and what drives win rates.

### Step 3 -- Distribute Accounts

Assign accounts to territories using these balancing criteria:

- **Account count:** Within 20% variance across territories
- **Revenue potential:** Total addressable value within 25% variance
- **Tier distribution:** Each territory gets proportional Tier 1/2/3 accounts
- **Pipeline balance:** Existing pipeline distributed evenly (not all open deals in one territory)

If perfect balance is impossible, prioritize revenue potential balance over account count.

### Step 4 -- Model Capacity Per Rep

For each territory, calculate:

- **Total accounts:** How many accounts the rep manages
- **Active accounts:** How many they can meaningfully engage (typically 30-50 for AEs, 200-300 for SDRs)
- **Required touches:** Based on tier (Tier 1: 15+ touches/month, Tier 2: 8-10, Tier 3: 2-4)
- **Available capacity:** Working hours minus internal meetings, admin, and travel
- **Utilization:** Required effort vs. available capacity (should be 70-85%)

Flag territories where required effort exceeds capacity (rep will be overwhelmed) or is below 50% (rep is under-utilized).

### Step 5 -- Set Quotas Per Territory

Design quota based on territory potential, not equal distribution:

- **Base method:** Territory revenue potential x expected win rate x coverage factor
- **Sanity check:** Compare to historical performance in similar territories
- **Ramp adjustment:** New hires get 50% quota month 2, 75% month 3, 100% month 4+
- **Stretch target:** 110-120% of base quota for accelerator triggers

Ensure quotas are achievable: at least 3x pipeline coverage vs. quota.

### Step 6 -- Validate Balance

Run the balance check:

| Metric | Lowest Territory | Highest Territory | Variance | Pass? |
|--------|-----------------|-------------------|----------|-------|

- Account count variance: target <20%
- Revenue potential variance: target <25%
- Pipeline coverage variance: target <30%
- Capacity utilization: all territories between 60-90%

If any metric fails, rebalance by moving accounts between territories.

### Step 7 -- Quality Gate

- [ ] Segmentation model is justified with reasoning, not just default
- [ ] Account count variance is under 20% across territories
- [ ] Revenue potential variance is under 25%
- [ ] Each territory has proportional Tier 1/2/3 accounts
- [ ] Capacity utilization is 60-90% for every territory
- [ ] Quotas are set per territory with 3x pipeline coverage minimum
- [ ] No territory has more than 3x the accounts of another

If any check fails, rebalance before proceeding.

## Output Format

Save to `docs/ops/territory-plan.md`:

```markdown
# Territory Plan
Date: {Date}
Segmentation: {Model}
Total Accounts: {N}
Total Reps: {N}

## Territory Summary
| Territory | Rep | Accounts | Tier 1 | Tier 2 | Tier 3 | Revenue Potential | Quota |
|-----------|-----|----------|--------|--------|--------|------------------|-------|

## Balance Check
| Metric | Min | Max | Variance | Target | Status |
|--------|-----|-----|----------|--------|--------|

## Territory Details

### Territory 1: {Name}
- **Rep:** {Name}
- **Accounts:** {N} ({Tier breakdown})
- **Revenue potential:** ${Amount}
- **Quota:** ${Amount}
- **Capacity utilization:** {%}
- **Key accounts:** {Top 5 by tier}
- **Notes:** {Special considerations}

[Repeat for each territory]

## Quota Framework
- **Base method:** {Formula}
- **Ramp schedule:** {50/75/100 timeline}
- **Minimum pipeline coverage:** 3x quota
- **Stretch target:** {%} for accelerators

## Rules
- **Territory changes:** {When and how accounts move}
- **New account assignment:** {How incoming accounts are routed}
- **Review cadence:** {Quarterly recommended}
```

## Key Principles

1. **Balance revenue potential, not just account count.** 50 small accounts and 50 enterprise accounts are not equivalent territories. Weight by deal potential.
2. **Capacity must be realistic.** A rep with 300 accounts can't do Tier 1 engagement on any of them. Match account load to the engagement model.
3. **Quotas follow territory potential.** Equal quotas on unequal territories guarantee some reps fail. Set quotas based on what the territory can produce.
4. **Review quarterly, not annually.** Markets shift, reps ramp, accounts churn. Territories that made sense in January may not in July.

## Anti-Patterns

- **Equal account count as "fair."** Giving every rep 100 accounts regardless of account quality. One rep gets 20 Tier 1 accounts, another gets zero. That's not fair.
- **Never rebalancing.** Setting territories once and leaving them for a year while the market changes. Review and adjust quarterly.
- **Ignoring existing pipeline.** Reassigning territories without considering open deals. Reps lose deals they've been working for months.

## What to Do Next

- Model **rep headcount** needed: `/skill capacity-planner`
- Design **compensation** aligned to these quotas: `/skill compensation-modeler`
- Build the **sales process** these territories execute: `/skill sales-process-designer`

---
description: Model SDR/AE headcount needs by working backwards from pipeline and revenue targets. Use when someone says "capacity plan", "headcount model", "how many reps", "hiring plan", "SDR capacity", "AE capacity", "sales headcount", or "team sizing"
tools: Read, Write
---

# Capacity Planner

Model the SDR and AE headcount needed to hit your pipeline and revenue targets. Works backwards from the revenue goal through conversion rates to calculate required activities, then divides by rep capacity to derive headcount. Includes ramp time for new hires.

This is math, not guessing. If you need $5M in pipeline and each AE can generate $1M, you need 5 AEs. But you also need to account for ramp time, attrition, and the SDR-to-AE ratio. This skill makes all those assumptions explicit.

## Inputs

- **Revenue target** (required) -- annual or quarterly closed-won target
- **Average deal size** (required) -- ACV or average contract value
- **Conversion rates** (required) -- meeting-to-opportunity, opportunity-to-close rates
- **Average sales cycle** (optional) -- days from first meeting to close
- **Current headcount** (optional) -- existing team to compare against
- **Rep ramp time** (optional) -- months for a new hire to reach full productivity

If revenue target or deal size is missing, ask: "I need your revenue target and average deal size to model capacity. What's the annual target and typical ACV?"

## Steps

### Step 0 -- Check for Existing Output

Read `docs/ops/capacity-plan.md` if it exists. If found, present a summary and ask: "A capacity plan already exists targeting ${target}. Do you want me to (a) update assumptions, (b) model a new target, or (c) rebuild from scratch?"

### Step 1 -- Load Context

Read all available context:

1. `docs/ops/sales-process.md` -- stage conversion rates
2. `docs/ops/territory-plan.md` -- current territory assignments
3. `docs/ops/compensation-model.md` -- cost per rep
4. `docs/analytics/forecast-model.md` -- pipeline data
5. `CLAUDE.md` -- project-level instructions

### Step 2 -- Work Backwards from Revenue Target

Build the funnel math:

| Metric | Calculation | Value |
|--------|-------------|-------|
| Revenue target | Given | ${Amount} |
| Average deal size | Given | ${Amount} |
| Deals needed | Target / ACV | {N} |
| Close rate | Given or estimated | {%} |
| Opportunities needed | Deals / close rate | {N} |
| Meeting-to-opp rate | Given or estimated | {%} |
| Meetings needed | Opportunities / meeting rate | {N} |
| Lead-to-meeting rate | Given or estimated | {%} |
| Leads needed | Meetings / lead rate | {N} |

This is the total funnel volume required to hit the revenue target.

### Step 3 -- Calculate Required Activities Per Rep

Define activity capacity for each role:

**SDR capacity (per month):**
- Outbound emails sent: 400-600
- Cold calls made: 200-400
- LinkedIn messages sent: 100-200
- Meetings booked: 10-20 (varies by market and motion)
- Qualified opportunities generated: 4-8

**AE capacity (per month):**
- Discovery calls conducted: 15-25
- Demos delivered: 10-20
- Proposals sent: 5-10
- Deals closed: 2-5

Adjust based on your specific motion (inbound vs. outbound, SMB vs. enterprise).

### Step 4 -- Derive Headcount

Calculate reps needed:

**SDRs needed:**
- Total meetings required per month: {N}
- Meetings per SDR per month: {N}
- SDRs needed (at full capacity): meetings required / meetings per SDR
- Adjusted for ramp: add {N} SDRs for ramp coverage

**AEs needed:**
- Total opportunities per month: {N}
- Opportunities per AE per month: {N}
- AEs needed (at full capacity): opportunities / capacity per AE
- Adjusted for ramp: add {N} AEs for ramp coverage

**SDR-to-AE ratio:** Typically 1:1 for outbound-heavy, 0.5:1 for inbound-heavy, 2:1 for high-volume SMB.

### Step 5 -- Include Ramp Time

Model the productivity ramp for new hires:

| Month | SDR Productivity | AE Productivity |
|-------|-----------------|-----------------|
| Month 1 | 0% (training) | 0% (training) |
| Month 2 | 25% | 25% |
| Month 3 | 50% | 50% |
| Month 4 | 75% | 75% |
| Month 5 | 100% | 90% |
| Month 6 | 100% | 100% |

Factor ramp into headcount: if you need 10 fully-productive AEs but 3 are ramping, you need 12 AEs total.

Add attrition buffer: assume 15-25% annual turnover. Budget for replacements.

### Step 6 -- Model Costs

Calculate fully-loaded cost per rep:

| Cost Component | SDR | AE |
|---------------|-----|-----|
| Base salary | ${Amount} | ${Amount} |
| Variable (at target) | ${Amount} | ${Amount} |
| Benefits (25-30% of base) | ${Amount} | ${Amount} |
| Tools and tech | ${Amount} | ${Amount} |
| **Total per rep** | **${Amount}** | **${Amount}** |

**Total team cost:** (SDRs x cost) + (AEs x cost) = ${Amount}
**Cost as % of revenue target:** {%} (target: 20-30% for SaaS)

### Step 7 -- Quality Gate

- [ ] Funnel math is complete from revenue target to leads needed
- [ ] Conversion rates are based on data or flagged as estimates
- [ ] Activity capacity per rep is realistic (not heroic assumptions)
- [ ] Ramp time is factored into headcount (not just full-productivity numbers)
- [ ] Attrition buffer is included
- [ ] Cost model includes fully-loaded costs, not just salary
- [ ] Sales cost as % of revenue is below 30% (or justified if higher)

If any check fails, fix it before proceeding.

## Output Format

Save to `docs/ops/capacity-plan.md`:

```markdown
# Capacity Plan
Date: {Date}
Revenue Target: ${Amount}
Period: {Annual/Quarterly}

## Funnel Math
| Metric | Value | Source |
|--------|-------|--------|
| Revenue target | ${Amount} | Given |
| Average deal size | ${Amount} | Given |
| Deals needed | {N} | Calculated |
| Close rate | {%} | {Data/estimate} |
| Opportunities needed | {N} | Calculated |
| Meeting-to-opp rate | {%} | {Data/estimate} |
| Meetings needed | {N} | Calculated |

## Headcount Model
| Role | Full Capacity Needed | Ramp Adjustment | Attrition Buffer | Total Needed | Current | Gap |
|------|---------------------|-----------------|-----------------|-------------|---------|-----|
| SDR | {N} | +{N} | +{N} | {N} | {N} | {N} |
| AE | {N} | +{N} | +{N} | {N} | {N} | {N} |

## Ramp Schedule
| Month | SDR Productivity | AE Productivity |
|-------|-----------------|-----------------|

## Cost Model
| Component | SDR (x{N}) | AE (x{N}) | Total |
|-----------|-----------|-----------|-------|
| Base | | | |
| Variable | | | |
| Benefits | | | |
| Tools | | | |
| **Total** | | | **${Amount}** |

**Sales cost as % of revenue:** {%}

## Hiring Timeline
| Role | Hire By | Fully Ramped By | Impact on Pipeline |
|------|---------|----------------|-------------------|

## Assumptions
- {Assumption 1 with source}
- {Assumption 2 with source}
```

## Key Principles

1. **Work backwards from revenue, not forwards from headcount.** "We can afford 5 reps" is not a capacity plan. "We need 5 reps to hit $5M" is.
2. **Conversion rates are the most important assumptions.** A 5% change in close rate can swing headcount by 20%. Use real data and flag estimates.
3. **Ramp time is real.** A new AE produces zero in month 1. If you hire in January for a Q1 target, you're already behind. Plan hiring ahead of need.
4. **Include the full cost.** Base salary is not the cost of a rep. Benefits, tools, management time, and training add 30-50%.

## Anti-Patterns

- **Heroic productivity assumptions:** Assuming every SDR books 25 meetings/month when the average is 12. Use median performance, not best-case.
- **Ignoring ramp and attrition:** Planning for 10 reps at full capacity when 3 are new and 2 will leave. Your effective capacity is 7.
- **Hiring to current revenue, not future targets.** You need to hire 6 months before you need the pipeline. By the time you feel understaffed, you're already behind.

## What to Do Next

- Design **territories** for this headcount: `/skill territory-planner`
- Build **compensation** for these roles: `/skill compensation-modeler`
- Create an **onboarding plan** for new hires: `/skill onboarding-ramp-plan`

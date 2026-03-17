---
description: Design a partner program with tiers, benefits, and requirements. Use when someone says "partner program", "design partner tiers", "referral program", "reseller program", "channel partner program", "partnership structure", or "partner strategy"
tools: Read, Write
---

# Partner Program Designer

Design a structured partner program with clear partner types, tier structure, benefits, requirements, and enablement plan. The goal is a program partners actually want to join because the value exchange is obvious at every level.

## Inputs

- **Company context** (required) -- what you sell, who you sell to, current GTM motion
- **Partner goals** (required) -- what you want from partners (leads, distribution, integrations, credibility)
- **Partner types** (optional) -- which types to include (referral, reseller, technology, agency). Defaults to all four.
- **Existing partnerships** (optional) -- any current partner relationships to build on

If company context or partner goals are missing, ask: "I need to understand what you sell and what you want partners to help with. What's the context?"

## Steps

### Step 0 -- Check for Existing Output

Read `docs/ops/partner-program.md` if it exists. If found, present a summary and ask: "A partner program already exists. Do you want me to (a) update it, (b) add a new partner type, or (c) rebuild from scratch?"

### Step 1 -- Load Context

Read all available context:

1. `docs/gtm-triangle.md` -- positioning and ICP context
2. `docs/value-prop-matrix.md` -- value pillars partners can leverage
3. `docs/sales/*.md` -- existing sales materials partners will need
4. `CLAUDE.md` -- project-level instructions

### Step 2 -- Define Program Goals

State 3-5 specific, measurable goals for the partner program:
- Revenue target from partner-sourced or partner-influenced deals
- Number of active partners per tier within 12 months
- Lead volume or pipeline contribution expected
- Strategic goals (market expansion, product adoption, credibility)

### Step 3 -- Choose Partner Types

For each type included, define the value exchange:

- **Referral partners:** Send leads in exchange for commission (10-20% of first-year revenue)
- **Reseller partners:** Sell your product as part of their offering in exchange for margin (20-40%)
- **Technology partners:** Integrate products for mutual customer value in exchange for co-marketing and co-selling
- **Agency partners:** Implement or service your product for their clients in exchange for training, leads, and certification

Only include types that match the stated goals.

### Step 4 -- Design Tier Structure

Create exactly 3 tiers with clear upgrade criteria:

| | Bronze | Silver | Gold |
|---|---|---|---|
| **Annual revenue** | $0-25K | $25K-100K | $100K+ |
| **Certifications** | 1 person | 2 people | 4 people |
| **Deal registrations** | 2/quarter | 5/quarter | 10/quarter |
| **QBR required** | No | Yes | Yes |

Adjust thresholds based on company context. The Bronze tier must be achievable for a new partner within their first quarter.

### Step 5 -- Define Benefits Per Tier

Map benefits that increase meaningfully with each tier:

- **Lead sharing:** Bronze gets directory listing. Silver gets warm intros. Gold gets dedicated lead flow.
- **Training:** Bronze gets self-serve. Silver gets live training. Gold gets custom enablement.
- **Co-marketing budget:** Bronze gets $0. Silver gets $2K/quarter. Gold gets $5K/quarter.
- **Margin/commission:** Bronze gets base rate. Silver gets +5%. Gold gets +10%.
- **Support:** Bronze gets partner portal. Silver gets partner manager. Gold gets dedicated partner manager.

### Step 6 -- Define Requirements Per Tier

Requirements must be objective and measurable. No subjective criteria like "strong commitment." Every requirement should have a number attached.

### Step 7 -- Create Enablement Plan

Define what partners need to succeed:
- Onboarding (first 30 days): portal access, product training, sales materials
- Certification program: what to learn, how to pass, how long it takes
- Ongoing enablement: monthly partner newsletter, quarterly training, annual partner summit
- Sales support: deal registration process, pre-sales engineering support, proposal templates

### Step 8 -- Write Partner Agreement Outline

Outline key terms (not legal language):
- Term length and renewal
- Territory or segment exclusivity (if any)
- Lead registration and protection rules
- Payment terms and commission structure
- Termination conditions
- Non-compete scope

### Step 9 -- Quality Gate

- [ ] Program has 3-5 measurable goals
- [ ] Each partner type has a clear value exchange
- [ ] Tier thresholds are achievable (Bronze reachable in first quarter)
- [ ] Benefits increase meaningfully between tiers
- [ ] All requirements are objective and measurable
- [ ] Enablement plan covers onboarding through ongoing support
- [ ] No em dashes in any copy

## Output Format

Save to `docs/ops/partner-program.md`:

```markdown
# Partner Program

Date: {Date}

## Program Goals
{3-5 measurable goals}

## Partner Types
### {Type 1}
- **Value exchange:** {What they give, what they get}
- **Ideal partner profile:** {Who makes a good partner of this type}

## Tier Structure
| | Bronze | Silver | Gold |
|---|---|---|---|
| Revenue | {threshold} | {threshold} | {threshold} |
| Certifications | {count} | {count} | {count} |
| Deal registrations | {count/quarter} | {count/quarter} | {count/quarter} |

## Benefits by Tier
{Table or list of benefits per tier}

## Requirements by Tier
{Table or list of requirements per tier}

## Enablement Plan
### Onboarding (First 30 Days)
{Steps}
### Certification
{Program details}
### Ongoing
{Cadence and activities}

## Partner Agreement Outline
{Key terms}
```

## Key Principles

1. **The value exchange must be obvious.** If a partner can't explain why they joined your program in one sentence, the program is too complicated.
2. **Bronze must be easy to reach.** A partner who can't achieve the first tier in 90 days will churn before they produce value.
3. **Benefits must scale with effort.** If Gold partners get marginally better treatment than Bronze, nobody will bother upgrading.
4. **Measure inputs, not just outputs.** Track certifications completed and deals registered, not just revenue. Inputs predict future output.

## Anti-Patterns

- **Too many tiers.** Three is the right number. Five tiers means partners can't remember what level they're at, let alone what they need to do next.
- **Subjective upgrade criteria.** "Demonstrates strong partnership commitment" is not a requirement. "$50K in sourced pipeline" is.
- **All benefits at Bronze.** If you give everything away at the entry level, there's no incentive to grow. Gate the best benefits behind real contribution.

## What to Do Next

- Build **enablement materials** for partners: `/skill channel-enablement-kit`
- Write a **pitch to recruit partners**: `/skill partner-pitch-builder`
- Plan **co-marketing** with a specific partner: `/skill co-marketing-planner`

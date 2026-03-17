---
description: Design a customer referral program with incentives, tracking, and launch plan. Use when someone says "referral program", "referral incentive", "customer referrals", "refer a friend", "referral strategy", or "referral campaign"
tools: Read, Write
---

# Referral Program Designer

Design a customer referral program with incentive structure, referral flow, ask templates, tracking, targets, and a launch sequence. Referrals convert 3-5x better than cold outreach because they come with built-in trust. This skill turns that into a repeatable system.

## Inputs

- **Product/service type** (required) -- what's being referred
- **Customer base size** (required) -- how many customers could refer
- **Average deal value** (required) -- to calibrate incentive economics
- **Current referral volume** (optional) -- baseline if any
- **Referral tools** (optional) -- existing referral platform or CRM tracking
- **Budget for incentives** (optional) -- what you can spend on rewards

If product type is missing, ask: "What product or service would customers be referring, and what's the typical deal value? I need this to design the incentive structure."

## Steps

### Step 0 -- Check for Existing Output

Read `docs/ops/referral-program.md` if it exists. If found, present a summary and ask: "A referral program already exists. Do you want me to (a) update incentives, (b) redesign the ask templates, or (c) rebuild from scratch?"

### Step 1 -- Load Context

Read all available context:

1. `docs/ops/nps-program.md` -- identify Promoters to ask
2. `docs/ops/advocacy-program.md` -- overlap with advocate programs
3. `docs/ops/customer-health-model.md` -- only ask healthy customers
4. `CLAUDE.md` -- project-level instructions

### Step 2 -- Define Incentive Structure

Choose one model:

- **Mutual benefit:** Both referrer and referred get value (e.g., $500 credit each). Best for SaaS with clear unit economics.
- **Referrer reward:** Only the referrer gets compensated (e.g., cash, gift card, credit). Best for services.
- **Tiered rewards:** Increasing rewards for multiple referrals (1st: $250, 2nd: $500, 3rd+: $750). Best for driving volume.
- **Donation:** Referrer chooses a charity donation. Best for enterprise where personal rewards feel inappropriate.

Economics rule: referral incentive should be <15% of the first-year value of the referred customer. If ACV is $10K, keep the incentive under $1,500.

### Step 3 -- Design the Referral Flow

Map the end-to-end process:

1. **Customer makes referral:** Via unique referral link, email introduction, or form submission
2. **Referral captured:** Enters CRM or referral platform with attribution
3. **Referral qualified:** Sales confirms the referral meets ICP criteria
4. **Referral contacted:** Sales reaches out within 24 hours, mentioning the referrer by name
5. **Referral converts:** Deal closes, attribution confirmed
6. **Reward issued:** Incentive delivered within 7 days of conversion
7. **Referrer thanked:** Personal thank-you from CS lead

Define what counts as a "qualified referral" (avoid paying for unqualified introductions).

### Step 4 -- Write Referral Ask Templates

Create templates for three channels:

**Email ask (from CSM):**
"Hi {name}, you mentioned that {product} has been working well for {specific use case}. If you know anyone facing similar challenges, I'd love an introduction. We offer {incentive} for every referral that becomes a customer. Would anyone come to mind?"

**In-app prompt:**
"Enjoying {product}? Refer a colleague and you both get {incentive}. [Share referral link]"

**CS conversation script:**
"I'm glad {specific result} is working out. Quick question: do you know anyone at another company dealing with {problem we solve}? We have a referral program that gives you {incentive} for every introduction that converts."

Each ask should: reference a specific positive outcome, explain the incentive, and make it easy to act.

### Step 5 -- Set Targets and Tracking

Define program metrics:

- **Referral rate:** % of customers who make at least one referral (target: 10-15%)
- **Referral quality:** % of referrals that meet ICP criteria (target: >50%)
- **Referral conversion:** % of qualified referrals that close (target: 20-30%)
- **Cost per referred customer:** Incentive cost / referred customers acquired
- **Time to close:** Referral deals should close 25-40% faster than outbound

Track in CRM: referral source, referrer name, referral status, deal stage, and reward status.

### Step 6 -- Plan Launch Sequence

Roll out in phases:

**Phase 1 (Weeks 1-2): Seed with Promoters**
- Identify NPS Promoters and highest-health customers
- Personal outreach from CSM with referral ask
- Collect first 10-20 referrals to validate flow

**Phase 2 (Weeks 3-4): Expand to All Healthy Customers**
- Email campaign to Green health score customers
- Enable in-app referral prompt
- Share first success stories

**Phase 3 (Month 2+): Sustained Program**
- Referral ask becomes part of standard CS cadence
- Quarterly referral drives with bonus incentives
- Annual top-referrer recognition

### Step 7 -- Quality Gate

- [ ] Incentive cost is under 15% of first-year referred customer value
- [ ] Referral flow has clear attribution tracking from referral to close
- [ ] Ask templates reference specific positive outcomes, not generic asks
- [ ] Only healthy customers (Green health score or NPS 9+) are asked for referrals
- [ ] Qualified referral is defined (no paying for unqualified intros)
- [ ] Launch sequence starts with Promoters and expands gradually
- [ ] Sales follow-up SLA on referrals is under 24 hours

If any check fails, fix it before proceeding.

## Output Format

Save to `docs/ops/referral-program.md`:

```markdown
# Referral Program
Date: {Date}
Incentive Model: {Type}
Target Referral Rate: {%}

## Incentive Structure
| Action | Referrer Gets | Referred Gets | Conditions |
|--------|-------------|--------------|-----------|
| Qualified referral | {Reward} | {Reward} | {Criteria} |

## Referral Flow
1. {Step} -- {Owner} -- {SLA}
2. {Step} -- {Owner} -- {SLA}

## Ask Templates

### Email
{Template}

### In-App
{Template}

### CS Conversation
{Script}

## Program Metrics
| Metric | Target | Tracking |
|--------|--------|---------|

## Launch Plan
### Phase 1: Seed (Weeks 1-2)
- {Actions}
### Phase 2: Expand (Weeks 3-4)
- {Actions}
### Phase 3: Sustain (Month 2+)
- {Actions}

## Rules
- Only ask customers with health score Green or NPS 9+
- Reward issued within 7 days of referral conversion
- Referrals must meet ICP criteria to be qualified
```

## Key Principles

1. **Ask at the right moment.** The best time to ask for a referral is right after a customer has a win. Not during onboarding, not at renewal. After a success.
2. **Make it easy.** If the referral process requires more than 2 clicks or 1 email, friction will kill adoption. Unique links and pre-written messages reduce effort.
3. **Only ask happy customers.** Asking a Detractor for a referral is tone-deaf. Use health scores and NPS to filter who gets asked.
4. **Reward quickly.** Delayed rewards feel like broken promises. Issue incentives within 7 days of conversion.

## Anti-Patterns

- **Asking everyone.** Mass-emailing every customer for referrals regardless of health or satisfaction. Unhappy customers won't refer, and the ask will annoy them.
- **Complex referral tracking.** Making customers fill out forms, track codes, and follow up manually. Use a referral link and automate the rest.
- **Forgetting the thank-you.** Issuing the reward but not personally thanking the referrer. The thank-you matters more than the incentive for long-term referral behavior.

## What to Do Next

- Build an **advocacy program** for top referrers: `/skill advocacy-program`
- Design **NPS surveys** to identify Promoters: `/skill nps-survey-designer`
- Plan **customer onboarding** that leads to referral readiness: `/skill customer-onboarding-planner`

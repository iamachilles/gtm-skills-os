---
name: upsell-trigger-mapper
description: Map upsell and cross-sell triggers with detection criteria and outreach templates. Use when someone says "upsell triggers", "cross-sell", "expansion triggers", "upsell signals", "revenue expansion", "growth signals", or "expansion playbook"
allowed-tools: Read, Write
metadata:
  author: Achille Morin-Lemoine
  version: "1.0.0"
---

# Upsell Trigger Mapper

Map upsell and cross-sell triggers by type (usage-based, growth-based, time-based, feature-based) with detection criteria, outreach templates, recommended offers, and timing. The output is a trigger-response system that turns customer behavior into expansion revenue.

Most expansion revenue is left on the table because no one is watching for the signals. Customers hit usage limits, add team members, or request advanced features, and no one follows up with an offer. This skill makes every trigger actionable.

## Inputs

- **Product/service catalog** (required) -- what you can upsell or cross-sell
- **Current customer data** (required) -- usage patterns, feature adoption, contract details
- **Customer segments** (optional) -- different triggers may apply by segment
- **Pricing tiers** (optional) -- what tier upgrades look like
- **CS team capacity** (optional) -- who executes on triggers

If product catalog is missing, ask: "What products, tiers, or add-ons can customers expand into? I need the catalog to map triggers to offers."

## Steps

### Step 0 -- Check for Existing Output

Search the project for any existing output from a previous run of this skill (check common locations like `docs/`, the project root, or any organized output directory). If a previous version is found, present a summary and ask: "An upsell trigger map already exists with {N} triggers. Do you want me to (a) add triggers, (b) update templates, or (c) rebuild from scratch?" 

### Step 1 -- Load Context

Search the project for any available context. Look in the project root, `docs/`, or any organized directory. Read what you find:

1. **Customer Health Model** documents -- only upsell healthy accounts
2. **Customer Onboarding** documents -- onboarding milestones that unlock upsell
3. **Expansion** documents -- existing expansion plans
4. `CLAUDE.md` -- project-level instructions

### Step 2 -- Define Usage-Based Triggers

Signals from how customers use the product:

| Trigger | Detection Criteria | Recommended Offer | Timing |
|---------|-------------------|-------------------|--------|
| Hitting usage limits | >80% of plan limit (seats, API calls, storage) | Next tier or add-on | Within 1 week of hitting 80% |
| Power user emergence | User logging 2x average sessions | Premium features or training | When pattern sustains 2+ weeks |
| New feature adoption | Customer starts using feature from higher tier | Tier upgrade with full access | After 3+ uses of the feature |
| Integration expansion | Customer connects new tools or data sources | Integration tier or professional services | When integration is set up |

### Step 3 -- Define Growth-Based Triggers

Signals from customer organization changes:

| Trigger | Detection Criteria | Recommended Offer | Timing |
|---------|-------------------|-------------------|--------|
| Team size increase | New users added or seat requests | Volume licensing or team plan | When new users are added |
| New department interest | Users from new department logging in | Department-specific package | After 3+ users from new dept |
| Company funding/growth | Funding announcement or hiring surge | Enterprise plan or multi-year | Within 2 weeks of announcement |
| New office/geography | Company expands to new location | Multi-location licensing | When expansion is announced |

### Step 4 -- Define Time-Based Triggers

Signals from contract milestones:

| Trigger | Detection Criteria | Recommended Offer | Timing |
|---------|-------------------|-------------------|--------|
| 90 days before renewal | Calendar trigger | Multi-year with discount | At 90-day mark |
| Anniversary milestone | 1-year customer anniversary | Loyalty upgrade or premium features | On anniversary |
| Post-onboarding success | Completed onboarding, achieved first value | Add-on services or features | 2 weeks after first value milestone |
| Mid-contract review | 6 months into annual contract | Expansion for remainder of term | At mid-point |

### Step 5 -- Define Feature-Based Triggers

Signals from feature requests and behavior:

| Trigger | Detection Criteria | Recommended Offer | Timing |
|---------|-------------------|-------------------|--------|
| Requesting advanced features | Support ticket or feedback asking for premium feature | Tier upgrade that includes the feature | Within 48 hours of request |
| Workaround behavior | Customer building manual processes for something your product automates at higher tier | Tier upgrade with demo of the feature | When workaround is identified |
| Training request | Customer asks for advanced training | Professional services or training package | Align with next available session |
| API access request | Customer asks about API capabilities | Developer tier or API add-on | Within 1 week |

### Step 6 -- Write Outreach Templates

For each trigger type, create a response template:

**Usage-based template:**
"Hi {name}, I noticed your team is using {feature/capacity} at {X}% of your current plan. That's a great sign of adoption. To make sure you don't hit any limits, I'd recommend {offer}. This would give you {benefit}. Want me to walk you through what that looks like?"

**Growth-based template:**
"Hi {name}, congratulations on {growth event}. As your team scales, {product} can support the growth with {offer}. I've seen similar companies benefit from {specific outcome}. Would it be helpful to discuss how to set this up?"

**Time-based template:**
"Hi {name}, you're coming up on {milestone}. Given the results your team has achieved ({specific result}), this is a great time to consider {offer}. Customers who move to {tier/plan} typically see {benefit}. Worth a conversation?"

**Feature-based template:**
"Hi {name}, I saw your request for {feature}. That's actually available in our {tier/plan}, along with {other relevant features}. Would you like a quick demo of how it works?"

### Step 7 -- Quality Gate

- [ ] At least 2 triggers defined per type (usage, growth, time, feature)
- [ ] Every trigger has specific, measurable detection criteria
- [ ] Detection criteria can be automated or regularly monitored (not "keep an eye out")
- [ ] Outreach templates reference specific customer behavior, not generic upsell pitches
- [ ] Timing is defined for each trigger (not "when appropriate")
- [ ] Only healthy accounts (Green health score) are eligible for upsell outreach
- [ ] Recommended offers match the trigger (don't pitch premium when they need more seats)

If any check fails, fix it before proceeding.

## Output Format

Save the output to your project. Suggested filename: `upsell-triggers.md`

```markdown
# Upsell and Cross-Sell Trigger Map
Date: {Date}

## Eligibility Rule
Only trigger upsell outreach for accounts with health score Green. Yellow accounts get stabilization, not expansion.

## Usage-Based Triggers
| Trigger | Detection | Offer | Timing | Owner |
|---------|-----------|-------|--------|-------|

## Growth-Based Triggers
| Trigger | Detection | Offer | Timing | Owner |
|---------|-----------|-------|--------|-------|

## Time-Based Triggers
| Trigger | Detection | Offer | Timing | Owner |
|---------|-----------|-------|--------|-------|

## Feature-Based Triggers
| Trigger | Detection | Offer | Timing | Owner |
|---------|-----------|-------|--------|-------|

## Outreach Templates

### Usage-Based
{Template}

### Growth-Based
{Template}

### Time-Based
{Template}

### Feature-Based
{Template}

## Metrics
| Metric | Target |
|--------|--------|
| Trigger-to-conversation rate | >30% |
| Conversation-to-expansion rate | >25% |
| Average expansion ACV | ${Amount} |
| Time from trigger to close | {Days} |
```

## Key Principles

1. **Triggers must be detectable.** If you can't monitor the signal automatically or through regular review, it's not a trigger. It's a wish.
2. **Timing is everything.** A usage-based upsell pitch 3 months after they hit the limit is too late. Within 1 week is the window. Automate alerts.
3. **Context makes the pitch.** "Want to upgrade?" is a pitch. "I noticed your team is at 90% capacity and growing. Here's how to stay ahead of it." is a service.
4. **Health gates prevent damage.** Never upsell an unhappy customer. It confirms they're just a revenue target, not a partner.
5. **Track every trigger.** Measure which triggers convert best. Double down on high-converting triggers and retire low-performers.

## Anti-Patterns

- **Upselling unhealthy accounts.** Asking a struggling customer to spend more is tone-deaf and accelerates churn.
- **Generic upsell campaigns.** Mass-emailing all customers about an upgrade without trigger context. This feels like spam, not service.
- **Missing the window.** Detecting a trigger but not acting for weeks. By then, the customer has found a workaround or given up.

## What to Do Next

- Build a **health scoring model** to gate upsell eligibility: `/skill customer-health-scorer`
- Design **expansion plans** for specific accounts: `/skill account-expansion-planner`
- Create a **success plan** that leads to natural expansion: `/skill success-plan-template`

---
name: customer-health-scorer
description: Design a customer health scoring model with weighted dimensions and alert thresholds. Use when someone says "health score", "customer health", "health scoring", "account health", "customer risk", "health model", or "customer scoring"
allowed-tools: Read, Write
metadata:
  author: Achille Morin-Lemoine
  version: "1.0.0"
---

# Customer Health Scorer

Design a customer health scoring model with 4-6 weighted dimensions, anchored rubrics, Green/Yellow/Red thresholds, and prescribed actions per health status. The goal is to know which customers are thriving and which are silently churning before they tell you.

Most churn is predictable. Usage drops weeks before cancellation. Support tickets spike before the angry email. Champions leave before the renewal conversation. A health score makes these signals visible and actionable.

## Inputs

- **Product type** (required) -- SaaS, services, platform, marketplace (determines relevant dimensions)
- **Customer data available** (required) -- what you can actually measure (usage, tickets, NPS, engagement, payment)
- **Customer segments** (optional) -- different health models may apply to enterprise vs. SMB
- **Current churn signals** (optional) -- what you've already noticed predicts churn
- **CS team structure** (optional) -- who acts on health scores

If product type is missing, ask: "What type of product/service are we scoring health for? And what customer data do you have access to (usage metrics, support tickets, NPS, etc.)?"

## Steps

### Step 0 -- Check for Existing Output

Search the project for any existing output from a previous run of this skill (check common locations like `docs/`, the project root, or any organized output directory). If a previous version is found, present a summary and ask: "A health scoring model already exists. Do you want me to (a) recalibrate weights, (b) add dimensions, or (c) rebuild from scratch?" 

### Step 1 -- Load Context

Search the project for any available context. Look in the project root, `docs/`, or any organized directory. Read what you find:

1. **Churn Prevention** documents -- churn signals if documented
2. **Upsell Triggers** documents -- expansion signals
3. **Customer Onboarding** documents -- onboarding milestones
4. **Success Plan Template** documents -- success plan structure
5. `CLAUDE.md` -- project-level instructions

### Step 2 -- Select Health Dimensions

Choose 4-6 dimensions based on available data. Common dimensions:

1. **Product Usage** (weight: 25-30%) -- Login frequency, feature adoption, active users vs. licensed users
2. **Support Health** (weight: 15-20%) -- Ticket volume, resolution time, severity trends, CSAT on tickets
3. **Engagement** (weight: 20-25%) -- CS meeting attendance, email responsiveness, event participation, executive sponsor access
4. **NPS/Satisfaction** (weight: 15-20%) -- Survey scores, qualitative feedback, renewal sentiment
5. **Payment Health** (weight: 10-15%) -- On-time payment, billing disputes, contract compliance
6. **Relationship** (weight: 10-15%) -- Champion strength, multi-threading depth, executive alignment

Only include dimensions you can actually measure. A dimension scored on guesses is worse than no dimension.

### Step 3 -- Build Scoring Rubric Per Dimension

For each dimension, create a 1-5 anchored rubric:

**Example: Product Usage (1-5)**

| Score | Criteria |
|-------|----------|
| 5 | Daily active usage, 80%+ feature adoption, growing user count |
| 4 | Weekly usage, 60-80% feature adoption, stable user count |
| 3 | Bi-weekly usage, 40-60% feature adoption, flat or slight decline |
| 2 | Monthly or sporadic usage, <40% feature adoption, declining users |
| 1 | No usage in 30+ days, minimal feature adoption, significant user loss |

Each score must have specific, measurable criteria. "Good usage" is not a rubric. "80%+ of licensed users logged in within the past 7 days" is.

### Step 4 -- Set Composite Score and Thresholds

Calculate the weighted composite score:

**Composite = (Dim1 x Weight1) + (Dim2 x Weight2) + ... + (DimN x WeightN)**

Scale to 0-100 for readability.

| Health Status | Score Range | Meaning |
|--------------|------------|---------|
| Green | 75-100 | Healthy. Renewal likely. Expansion candidate. |
| Yellow | 50-74 | At risk. Intervention needed within 2 weeks. |
| Red | 0-49 | Critical. Immediate action required. Churn probable without intervention. |

### Step 5 -- Define Actions Per Health Status

For each status, prescribe specific actions:

**Green (75-100):**
- Standard CS cadence (monthly check-in)
- Identify expansion opportunities
- Request referral or case study
- Share new feature updates and best practices

**Yellow (50-74):**
- Escalate to CS manager within 48 hours
- Schedule executive check-in within 1 week
- Identify and address the specific dimension driving the score down
- Increase touchpoint frequency to bi-weekly
- Create 30-day improvement plan

**Red (0-49):**
- Immediate CS manager and leadership alert
- Executive sponsor call within 48 hours
- Root cause analysis on what changed
- Dedicated rescue plan with weekly milestones
- Consider save offer if appropriate (see churn prevention playbook)

### Step 6 -- Define Override Rules

Some signals should override the composite score:

- **Champion departure:** Automatic Yellow, regardless of composite score
- **Zero usage for 30 days:** Automatic Red
- **Billing dispute open:** Automatic Yellow
- **NPS Detractor (0-6):** Automatic Yellow, Red if score < 4

### Step 7 -- Quality Gate

- [ ] 4-6 dimensions selected, each with measurable data available
- [ ] Weights sum to 100%
- [ ] Every dimension has an anchored 1-5 rubric with specific criteria
- [ ] Green/Yellow/Red thresholds are set with clear actions per status
- [ ] Override rules cover the most critical single-signal risks
- [ ] Actions are specific and time-bound (not "monitor the situation")
- [ ] The model can be scored with data you actually have today

If any check fails, fix it before proceeding.

## Output Format

Save the output to your project. Suggested filename: `customer-health-model.md`

```markdown
# Customer Health Scoring Model
Date: {Date}
Segments: {Which customer segments this applies to}

## Dimensions and Weights
| Dimension | Weight | Data Source |
|-----------|--------|------------|
| Product Usage | {%} | {Source} |
| Support Health | {%} | {Source} |
| Engagement | {%} | {Source} |
| NPS/Satisfaction | {%} | {Source} |
| Payment Health | {%} | {Source} |
| Relationship | {%} | {Source} |

## Scoring Rubrics

### Product Usage ({weight}%)
| Score | Criteria |
|-------|----------|
| 5 | {Specific criteria} |
| 4 | {Specific criteria} |
| 3 | {Specific criteria} |
| 2 | {Specific criteria} |
| 1 | {Specific criteria} |

[Repeat for each dimension]

## Health Thresholds
| Status | Score Range | Response Time | Key Actions |
|--------|-----------|--------------|-------------|
| Green | 75-100 | Standard cadence | {Actions} |
| Yellow | 50-74 | Within 48 hours | {Actions} |
| Red | 0-49 | Immediate | {Actions} |

## Override Rules
| Signal | Override To | Regardless of Score |
|--------|-----------|-------------------|

## Scoring Frequency
- **Enterprise accounts:** Weekly
- **Mid-market:** Bi-weekly
- **SMB:** Monthly

## Example Scoring
| Account | Usage | Support | Engagement | NPS | Payment | Relationship | Composite | Status |
|---------|-------|---------|-----------|-----|---------|-------------|-----------|--------|
```

## Key Principles

1. **Only score what you can measure.** A health dimension based on gut feel adds noise, not signal. If you can't pull the data, don't include the dimension.
2. **Overrides catch what composites miss.** A customer can score 80 overall but have zero usage because other dimensions compensate. Override rules catch single-signal crises.
3. **Actions matter more than scores.** The score is only useful if it triggers a specific action. A Red score without a rescue plan is just a number.
4. **Calibrate quarterly.** Compare health scores to actual churn outcomes. If Red accounts are renewing and Green accounts are churning, the model needs recalibration.
5. **Different segments may need different models.** Enterprise and SMB customers have different usage patterns. One model may not fit both.

## Anti-Patterns

- **Scoring without acting.** Building a beautiful dashboard of health scores and never changing behavior based on them. The model is only as good as the response it triggers.
- **Too many dimensions.** Adding 10 dimensions because they all "seem important." Each dimension you add dilutes the signal. Stick to 4-6 that actually predict churn.
- **Equal weights everywhere.** Weighting all dimensions equally is a cop-out. Usage and engagement are almost always more predictive than payment history. Weight by predictive power.

## What to Do Next

- Build a **churn prevention playbook** based on Red signals: `/skill churn-prevention-playbook`
- Map **upsell triggers** for Green accounts: `/skill upsell-trigger-mapper`
- Design **customer onboarding** to start health scores strong: `/skill customer-onboarding-planner`

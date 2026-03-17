---
description: Create a churn prevention strategy with early warnings, intervention tiers, and win-back sequences. Use when someone says "churn prevention", "reduce churn", "save plan", "retention strategy", "prevent cancellation", "at-risk customers", or "win back"
tools: Read, Write
---

# Churn Prevention Playbook

Create a complete churn prevention strategy with early warning signals, three intervention tiers (Yellow, Orange, Red), save offers, and a win-back sequence for churned customers. The goal is to catch churn before it happens and have a playbook ready when it does.

Churn is rarely a surprise. The signals are usually visible weeks or months before the cancellation. This playbook makes those signals actionable and gives your team a structured response instead of panic.

## Inputs

- **Current churn rate** (required) -- monthly or annual churn rate
- **Known churn reasons** (required) -- why customers have left (top 3-5 reasons)
- **Customer health model** (optional) -- existing scoring model
- **Product type** (required) -- SaaS, services, platform
- **Contract structure** (optional) -- monthly, annual, multi-year
- **CS team capacity** (optional) -- how many at-risk accounts can be handled simultaneously

If churn rate is missing, ask: "What's your current churn rate and the top 3 reasons customers leave? I need this to prioritize the intervention tiers."

## Steps

### Step 0 -- Check for Existing Output

Read `docs/ops/churn-prevention.md` if it exists. If found, present a summary and ask: "A churn prevention playbook already exists. Do you want me to (a) update warning signals, (b) redesign save offers, or (c) rebuild from scratch?"

### Step 1 -- Load Context

Read all available context:

1. `docs/ops/customer-health-model.md` -- health scoring for risk identification
2. `docs/ops/success-plan-template.md` -- success plan structure
3. `docs/ops/customer-onboarding.md` -- onboarding gaps that lead to churn
4. `CLAUDE.md` -- project-level instructions

### Step 2 -- Define Early Warning Signals

Identify signals that predict churn before the customer says anything:

**Usage Signals:**
- Login frequency dropped >50% vs. prior 30 days
- Key feature usage stopped
- Active users decreased (seats going unused)
- API calls or integration activity dropped

**Support Signals:**
- Support ticket volume spiked (3x normal)
- Escalated ticket open for 14+ days
- CSAT on recent tickets below 3/5
- Customer mentioned "alternative" or "competitor" in ticket

**Relationship Signals:**
- Champion left the company
- Executive sponsor unresponsive for 30+ days
- Declined last 2 check-in meetings
- No engagement with content or events in 60+ days

**Commercial Signals:**
- Late payment (30+ days overdue)
- Requested contract terms or pricing change
- Asked about data export or cancellation process
- Renewal conversation deferred twice

For each signal, define: detection method (automated or manual), severity (early vs. late indicator), and response time.

### Step 3 -- Design Intervention Tier 1: Yellow (Proactive Check-In)

**Trigger:** 1-2 early warning signals detected, or health score drops to Yellow.

**Response timeline:** Within 1 week.

**Actions:**
1. CS manager reviews account and identifies likely cause
2. Schedule proactive check-in call (positioned as value review, not "we noticed you're not using the product")
3. During call: acknowledge recent changes, ask about evolving needs, share relevant best practices
4. Offer training session or new feature walkthrough
5. Create 30-day action plan with specific milestones
6. Increase touchpoint frequency to bi-weekly

**Success criteria:** Usage or engagement returns to baseline within 30 days.

### Step 4 -- Design Intervention Tier 2: Orange (Executive Outreach + Value Review)

**Trigger:** 3+ warning signals, Yellow intervention failed, or health score trending toward Red.

**Response timeline:** Within 48 hours.

**Actions:**
1. Escalate to CS director or VP
2. Executive outreach from your leadership to their leadership
3. Conduct formal value review: show ROI delivered, identify unmet needs
4. If value gap exists: create remediation plan with executive sponsorship
5. Assign dedicated resource for 60-day recovery period
6. Weekly check-ins with documented progress

**Success criteria:** Health score returns to Yellow or Green within 60 days. Executive engagement restored.

### Step 5 -- Design Intervention Tier 3: Red (Save Offer + Escalation)

**Trigger:** Customer explicitly signals intent to churn, or all Orange actions failed.

**Response timeline:** Immediate (same day).

**Actions:**
1. VP or C-level call to the customer's decision maker
2. Acknowledge the problem directly (don't pretend everything is fine)
3. Present save offer options:
   - **Option A:** Discounted renewal (10-20% off for recommitment, 6+ month term)
   - **Option B:** Scope adjustment (reduce seats/features at reduced price)
   - **Option C:** Service credit or free extension (30-60 days to address issues)
   - **Option D:** Pause (hold the account for 60-90 days instead of cancelling)
4. If save is accepted: formal recovery plan with weekly executive reviews
5. If save is rejected: graceful offboarding with open door for return

**Save offer rules:**
- Never offer more than 20% discount to save
- Save offers expire in 7 days
- Document every save offer and outcome for pattern analysis

### Step 6 -- Design Win-Back Sequence for Churned Customers

For customers who churned, create a structured re-engagement:

**Day 1 (cancellation):**
- Thank-you email from CS lead. Acknowledge their decision. No guilt.
- Ask for exit feedback (2-3 questions max)

**Day 30:**
- Share a product update or feature that addresses their stated churn reason
- "We took your feedback seriously. Here's what changed."

**Day 60:**
- Share a case study or success story from a similar company
- Low-pressure: "Thought you'd find this interesting."

**Day 90:**
- Re-engagement offer: "We'd love to earn your business back. Here's what we can offer for a fresh start."
- Special win-back pricing (15-25% off first term)

**Day 180:**
- Final touch: "Our door is always open. Here's what's new since you left."

Win-back pricing should be better than save pricing (you already lost them, the cost of re-acquisition justifies a better offer).

### Step 7 -- Quality Gate

- [ ] Early warning signals cover all four categories (usage, support, relationship, commercial)
- [ ] Each signal has a detection method (not just "watch for")
- [ ] Three intervention tiers exist with escalating severity
- [ ] Each tier has specific actions, timeline, and success criteria
- [ ] Save offers have clear limits (max discount, expiration)
- [ ] Win-back sequence has 4-5 touches over 180 days
- [ ] No intervention asks the customer "are you planning to leave?" (observe behavior, don't interrogate)

If any check fails, fix it before proceeding.

## Output Format

Save to `docs/ops/churn-prevention.md`:

```markdown
# Churn Prevention Playbook
Date: {Date}
Current Churn Rate: {%}
Target Churn Rate: {%}

## Early Warning Signals
| Signal | Category | Severity | Detection | Response Time |
|--------|----------|----------|-----------|--------------|

## Intervention Tiers

### Yellow -- Proactive Check-In
**Trigger:** {Criteria}
**Timeline:** Within 1 week
**Actions:**
1. {Action}
2. {Action}
**Success criteria:** {Metric}

### Orange -- Executive Outreach
**Trigger:** {Criteria}
**Timeline:** Within 48 hours
**Actions:**
1. {Action}
2. {Action}
**Success criteria:** {Metric}

### Red -- Save Offer
**Trigger:** {Criteria}
**Timeline:** Same day
**Save options:**
| Option | Offer | Conditions | Approval |
|--------|-------|-----------|----------|
**Success criteria:** {Metric}

## Win-Back Sequence
| Day | Action | Message Theme |
|-----|--------|--------------|
| 1 | Thank-you + exit survey | Graceful offboarding |
| 30 | Product update | We listened |
| 60 | Case study | Social proof |
| 90 | Re-engagement offer | Win-back pricing |
| 180 | Final touch | Open door |

## Metrics
- **Save rate by tier:** {Targets}
- **Win-back rate:** {Target}
- **Average time to churn signal:** {Days before renewal}
```

## Key Principles

1. **Prevention beats intervention.** The best churn prevention happens in onboarding, not in the save call. If you're constantly saving accounts, your onboarding or product has a problem.
2. **Observe behavior, don't ask.** Asking "are you happy?" gets you lies. Watching usage, engagement, and support patterns gets you truth.
3. **Graceful exits preserve future revenue.** Customers who leave angry never come back. Customers who leave feeling respected come back 15-20% of the time.
4. **Save offers have limits.** Unlimited discounting to prevent churn trains customers to threaten cancellation for better pricing. Set boundaries.

## Anti-Patterns

- **Panic saves:** Only reacting when the customer says they're leaving. By then, the decision is usually made. Intervene earlier based on signals.
- **Guilt-tripping:** "After everything we've done for you" messaging. This damages the relationship and eliminates any chance of win-back.
- **Ignoring churned customers:** No win-back sequence means zero chance of recovering lost revenue. Churned customers already know your product. Re-acquisition is cheaper than new acquisition.

## What to Do Next

- Build a **health scoring model** to detect risk earlier: `/skill customer-health-scorer`
- Design **NPS surveys** for satisfaction data: `/skill nps-survey-designer`
- Map **upsell triggers** for healthy accounts: `/skill upsell-trigger-mapper`

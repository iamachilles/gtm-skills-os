---
description: Design an NPS/CSAT survey program with follow-up actions by score segment. Use when someone says "NPS survey", "CSAT survey", "customer survey", "satisfaction survey", "NPS program", "customer feedback", or "survey design"
tools: Read, Write
---

# NPS Survey Designer

Design a complete NPS or CSAT survey program with survey timing, question design, score-segmented follow-up actions (Promoters, Passives, Detractors), and a close-the-loop process. The output is a survey program that generates actionable data, not just vanity metrics.

NPS is only useful if you act on it. A score of 42 means nothing without knowing who your Detractors are, why they're unhappy, and what you're doing about it. This skill builds the action framework around the number.

## Inputs

- **Survey type** (required) -- NPS (relationship), CSAT (transactional), or both
- **Customer segments** (required) -- who gets surveyed and how they're grouped
- **Customer touchpoints** (optional) -- when surveys should be triggered
- **Current NPS/CSAT** (optional) -- baseline if available
- **Survey tool** (optional) -- Delighted, Wootric, SurveyMonkey, in-app

If survey type is missing, ask: "Do you want to measure overall relationship satisfaction (NPS) or satisfaction with specific interactions (CSAT)? And which customer segments should we survey?"

## Steps

### Step 0 -- Check for Existing Output

Read `docs/ops/nps-program.md` if it exists. If found, present a summary and ask: "An NPS program already exists. Do you want me to (a) update follow-up actions, (b) redesign questions, or (c) rebuild from scratch?"

### Step 1 -- Load Context

Read all available context:

1. `docs/ops/customer-health-model.md` -- how NPS feeds health scoring
2. `docs/ops/churn-prevention.md` -- how Detractor responses trigger intervention
3. `docs/ops/advocacy-program.md` -- how Promoter responses feed advocacy
4. `CLAUDE.md` -- project-level instructions

### Step 2 -- Choose Survey Type and Timing

**NPS (Relationship Survey):**
- Frequency: Quarterly or semi-annually
- Timing: Mid-contract (not right before renewal, that biases responses)
- Audience: All active customers or stratified sample

**CSAT (Transactional Survey):**
- Trigger: After specific interactions (support ticket closed, onboarding complete, training session)
- Timing: Within 24 hours of the interaction
- Audience: Everyone who had the interaction

**Combined approach:** Run NPS quarterly for overall health, CSAT after key touchpoints for operational feedback.

### Step 3 -- Write Survey Questions

**Core NPS Question:**
"On a scale of 0-10, how likely are you to recommend [Product/Company] to a colleague?"

**Follow-up Questions (2-3 max):**

1. Open-ended: "What's the primary reason for your score?"
2. Multiple choice: "Which of these areas could we improve?" (Product quality, Customer support, Ease of use, Value for price, Documentation, Other)
3. Optional: "Is there anything else you'd like us to know?"

Keep it under 3 minutes to complete. Every additional question reduces response rate by 10-15%.

### Step 4 -- Define Follow-Up Actions by Score

**Promoters (9-10):**
- Within 48 hours: Thank-you message from CS lead
- Ask for specific advocacy action (in priority order):
  1. Online review (G2, Capterra)
  2. Case study participation
  3. Referral introduction
  4. Reference call availability
- Add to advocacy program pipeline
- Share positive feedback with product and leadership (morale matters)

**Passives (7-8):**
- Within 1 week: Personal outreach from CSM
- Ask: "What would make you a 9 or 10?" (specific, actionable feedback)
- Identify the gap between satisfaction and delight
- Create improvement plan for the specific issues raised
- Re-survey in 90 days to measure progress

**Detractors (0-6):**
- Within 24 hours: Alert to CS manager and account owner
- Within 48 hours: Personal call from CSM (not email)
- Acknowledge the feedback directly. Don't be defensive.
- Create remediation plan with specific actions and timeline
- Escalate to leadership if score is 0-3 or if churn risk is high
- Re-survey in 60 days after remediation

### Step 5 -- Design Close-the-Loop Process

Every survey response must be closed:

1. **Response received:** Auto-categorize by score segment
2. **Action assigned:** Route to appropriate owner (CSM for Detractors, CSM or marketing for Promoters)
3. **Follow-up executed:** Contact made within SLA
4. **Resolution documented:** What was done, what the customer said
5. **Loop closed:** Customer notified of action taken ("You told us X, we did Y")

Track: close-the-loop rate (target: 100% of Detractors, 80% of Passives, 50% of Promoters within 2 weeks).

### Step 6 -- Set Program Metrics

Define what success looks like:

- **Response rate target:** 30-40% for email surveys, 50%+ for in-app
- **NPS target:** Improve by {N} points per quarter
- **Detractor follow-up SLA:** 100% contacted within 48 hours
- **Close-the-loop rate:** 100% of Detractors, 80% of Passives
- **Promoter conversion:** {%} of Promoters complete an advocacy action

### Step 7 -- Quality Gate

- [ ] Survey is under 3 minutes to complete (NPS question + 2-3 follow-ups max)
- [ ] Follow-up actions are defined for all three segments (Promoters, Passives, Detractors)
- [ ] Detractor response SLA is under 48 hours
- [ ] Close-the-loop process ensures customers know their feedback led to action
- [ ] Survey timing avoids bias (not during renewal, not after a crisis)
- [ ] Response rate targets are set
- [ ] The program feeds other systems (health scoring, churn prevention, advocacy)

If any check fails, fix it before proceeding.

## Output Format

Save to `docs/ops/nps-program.md`:

```markdown
# NPS/CSAT Program
Date: {Date}
Survey Type: {NPS / CSAT / Both}
Current NPS: {Score or "Baseline TBD"}
Target NPS: {Score}

## Survey Design

### NPS Survey
**Frequency:** {Quarterly / Semi-annual}
**Audience:** {Segments}
**Timing:** {When to send}
**Questions:**
1. {NPS question}
2. {Follow-up 1}
3. {Follow-up 2}

### CSAT Survey (if applicable)
**Trigger:** {After what interaction}
**Questions:** {Questions}

## Follow-Up Actions

### Promoters (9-10)
**SLA:** Within {timeframe}
**Actions:**
1. {Action}
2. {Advocacy ask}
**Owner:** {Role}

### Passives (7-8)
**SLA:** Within {timeframe}
**Actions:**
1. {Action}
2. {Improvement plan}
**Owner:** {Role}

### Detractors (0-6)
**SLA:** Within {timeframe}
**Actions:**
1. {Action}
2. {Escalation criteria}
**Owner:** {Role}

## Close-the-Loop Process
| Step | Action | Owner | SLA |
|------|--------|-------|-----|

## Program Metrics
| Metric | Target | Current |
|--------|--------|---------|
| Response rate | {%} | {%} |
| NPS score | {Score} | {Score} |
| Detractor follow-up rate | 100% | {%} |
| Close-the-loop rate | {%} | {%} |
| Promoter advocacy conversion | {%} | {%} |
```

## Key Principles

1. **NPS without action is a vanity metric.** The number only matters if it changes how you treat customers. Every response should trigger a follow-up.
2. **Detractors first.** They're the most urgent. A Detractor who feels heard can become a Promoter. A Detractor who's ignored becomes a churned customer and a negative review.
3. **Close the loop or stop surveying.** Asking for feedback and doing nothing with it is worse than not asking. Customers who give feedback and see no change stop responding.
4. **Keep surveys short.** Every question you add reduces response rate. Three questions gives you what you need. Ten questions gives you nothing because no one finishes.

## Anti-Patterns

- **Survey fatigue:** Sending NPS quarterly AND CSAT after every interaction AND renewal surveys. Pick a cadence and respect it. No customer wants 12 surveys a year.
- **Score obsession:** Optimizing for NPS score instead of customer experience. If you're coaching customers to give 9s and 10s, you're measuring your manipulation, not their satisfaction.
- **Only celebrating Promoters:** Ignoring the feedback from Detractors and Passives. That's where the actionable insights live.

## What to Do Next

- Build a **customer health model** that incorporates NPS: `/skill customer-health-scorer`
- Design a **churn prevention playbook** for Detractors: `/skill churn-prevention-playbook`
- Create an **advocacy program** for Promoters: `/skill advocacy-program`

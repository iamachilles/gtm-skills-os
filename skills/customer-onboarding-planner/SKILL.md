---
description: Design a post-sale customer onboarding plan with milestones and time-to-value targets. Use when someone says "customer onboarding", "post-sale onboarding", "implementation plan", "customer kickoff", "time to value", "onboarding milestones", or "customer go-live"
tools: Read, Write
---

# Customer Onboarding Planner

Design a post-sale customer onboarding plan with milestone-based progression from Day 1 through Month 3. The plan defines specific milestones, check-in cadence, health checks, and a time-to-value target. The goal: get the customer to their first measurable win as fast as possible.

Onboarding is where most churn begins. Not because the product fails, but because the customer never reaches the "aha moment" where they see value. This plan compresses time-to-value and makes progress visible to both sides.

## Inputs

- **Product/service** (required) -- what the customer is onboarding onto
- **Implementation complexity** (required) -- simple (self-serve), moderate (guided), or complex (managed)
- **Customer segment** (optional) -- enterprise, mid-market, or SMB (affects touch model)
- **Success criteria** (required) -- what "successful onboarding" looks like in measurable terms
- **Team involved** (optional) -- CSM, implementation specialist, solutions engineer, training
- **Integration requirements** (optional) -- technical dependencies

If product or success criteria is missing, ask: "What product is the customer onboarding onto, and what does a successful onboarding look like? I need a measurable definition of 'first value.'"

## Steps

### Step 0 -- Check for Existing Output

Read `docs/ops/customer-onboarding.md` if it exists. If found, present a summary and ask: "A customer onboarding plan already exists. Do you want me to (a) adjust the timeline, (b) add milestones, or (c) rebuild from scratch?"

### Step 1 -- Load Context

Read all available context:

1. `docs/ops/customer-health-model.md` -- how onboarding affects health scores
2. `docs/ops/success-plan-template.md` -- longer-term success planning
3. `docs/ops/churn-prevention.md` -- onboarding failures that lead to churn
4. `CLAUDE.md` -- project-level instructions

### Step 2 -- Define Onboarding Milestones

Create milestone-based progression:

**Day 1: Welcome and Access**
- Welcome email with onboarding timeline and key contacts
- All user accounts provisioned
- Onboarding kickoff scheduled
- Internal handoff from sales to CS completed (including deal context, stakeholders, and expectations)

**Week 1: Kickoff and Training**
- Kickoff call: align on goals, timeline, stakeholders, and success criteria
- Initial training session for primary users
- Technical setup initiated (integrations, data import, configuration)
- First action items assigned with deadlines

**Week 2-3: Configuration and Integration**
- Product configured for the customer's specific use case
- Integrations connected and tested
- Data migration or import completed
- Admin trained on management features
- First test workflow run successfully

**Month 1: First Value Milestone**
- Customer completes their first real use case (not a test)
- Measurable result achieved and documented
- All primary users trained and active
- Success criteria progress reviewed

**Month 2-3: Optimization**
- Advanced features introduced based on initial usage patterns
- Workflow optimization based on first month's data
- Additional users onboarded (if applicable)
- QBR prep: document results achieved

### Step 3 -- Define Check-In Cadence

Set touchpoint frequency by phase:

| Phase | Frequency | Format | Purpose |
|-------|-----------|--------|---------|
| Week 1 | Daily (if needed) | Slack/email | Unblock setup issues |
| Week 2-3 | 2-3x per week | Call + email | Track configuration progress |
| Month 1 | Weekly | 30-min call | Review milestones, address obstacles |
| Month 2 | Bi-weekly | 30-min call | Optimize and expand usage |
| Month 3 | Bi-weekly | 30-min call | Transition to standard CS cadence |

After Month 3: standard CS cadence (monthly or quarterly based on segment).

### Step 4 -- Create Health Check Schedule

Define onboarding health checkpoints:

**Week 1 check:** Is the customer engaged? Did they attend kickoff? Are action items being completed?
- Green: Kickoff completed, technical setup underway
- Yellow: Kickoff rescheduled once, some delays
- Red: No kickoff after 7 days, champion unresponsive

**Week 3 check:** Is implementation on track?
- Green: Configuration complete, integrations working, users trained
- Yellow: Behind by 1 week, some integrations pending
- Red: Behind by 2+ weeks, major blockers unresolved

**Month 1 check:** Has first value been achieved?
- Green: First use case completed, measurable result achieved
- Yellow: First use case attempted but not yet successful
- Red: No real usage, no value milestone reached

**Month 3 check:** Is the customer self-sufficient?
- Green: Active usage, positive feedback, ready for standard cadence
- Yellow: Using product but not optimized, needs continued support
- Red: Low adoption, at-risk for churn

### Step 5 -- Set Time-to-Value Target

Define the measurable time-to-value goal:

- **Time-to-value target:** {N} days from contract signature to first measurable outcome
- **What counts as value:** {Specific, measurable outcome} (e.g., "first campaign launched," "first report generated," "first workflow automated")
- **Tracking:** Document the date of contract signature and date of first value milestone
- **Benchmark:** Track average time-to-value across all customers. Target improvement of 10% per quarter.

### Step 6 -- Quality Gate

- [ ] Every milestone is specific and measurable (not "customer is set up")
- [ ] Day 1 includes sales-to-CS handoff with deal context
- [ ] Check-in cadence decreases over time (intensive early, lighter later)
- [ ] Health checkpoints at weeks 1, 3, month 1, and month 3
- [ ] Time-to-value target is defined with a measurable outcome
- [ ] The plan includes what happens when things go wrong (Red health at any checkpoint)
- [ ] Transition to standard CS cadence is defined (not an abrupt end)

If any check fails, fix it before proceeding.

## Output Format

Save to `docs/ops/customer-onboarding.md`:

```markdown
# Customer Onboarding Plan
Date: {Date}
Product: {Product/service}
Complexity: {Simple/Moderate/Complex}
Time-to-Value Target: {N} days

## Onboarding Milestones

### Day 1: Welcome and Access
- [ ] {Task 1}
- [ ] {Task 2}
- [ ] {Task 3}

### Week 1: Kickoff and Training
- [ ] {Task 1}
- [ ] {Task 2}
- [ ] {Task 3}

### Week 2-3: Configuration and Integration
- [ ] {Task 1}
- [ ] {Task 2}

### Month 1: First Value Milestone
- [ ] {Task 1}
- [ ] {Success criteria check}

### Month 2-3: Optimization
- [ ] {Task 1}
- [ ] {Transition to standard cadence}

## Check-In Cadence
| Phase | Frequency | Format | Purpose |
|-------|-----------|--------|---------|

## Health Checkpoints
| Checkpoint | Green | Yellow | Red |
|-----------|-------|--------|-----|
| Week 1 | {Criteria} | {Criteria} | {Criteria} |
| Week 3 | {Criteria} | {Criteria} | {Criteria} |
| Month 1 | {Criteria} | {Criteria} | {Criteria} |
| Month 3 | {Criteria} | {Criteria} | {Criteria} |

## Sales-to-CS Handoff Checklist
- [ ] Deal context and customer goals documented
- [ ] Key stakeholders and champions identified
- [ ] Technical requirements and integrations listed
- [ ] Success criteria agreed with customer
- [ ] Onboarding kickoff scheduled

## Time-to-Value Tracking
- **Target:** {N} days
- **Definition of value:** {Measurable outcome}
- **Current average:** {N} days
```

## Key Principles

1. **Time-to-value is the single most important onboarding metric.** Every day between contract signature and first value is a day the customer doubts their decision. Compress ruthlessly.
2. **The sales-to-CS handoff makes or breaks onboarding.** If CS doesn't know what was promised, what the customer cares about, or who the stakeholders are, onboarding starts in a hole.
3. **Early intensity prevents late-stage failure.** Daily check-ins in week 1 feel excessive but catch problems before they compound. A problem found on day 3 is a quick fix. The same problem found on day 30 is a crisis.
4. **Milestones must be measurable.** "Customer is comfortable" is not a milestone. "Customer completed first [use case] and generated [result]" is.

## Anti-Patterns

- **Onboarding as a checklist, not a journey.** Sending a list of setup tasks and calling it onboarding. Onboarding is about reaching value, not completing tasks.
- **No handoff from sales.** CS starts from scratch learning about the customer, re-asking questions sales already answered. This wastes time and frustrates the customer.
- **Abrupt end to onboarding.** Going from weekly calls to radio silence after month 1. Transition gradually to standard cadence.

## What to Do Next

- Design a **success plan** for post-onboarding: `/skill success-plan-template`
- Build a **health scoring model** that incorporates onboarding progress: `/skill customer-health-scorer`
- Plan **churn prevention** for onboarding failures: `/skill churn-prevention-playbook`

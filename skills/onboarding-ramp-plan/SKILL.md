---
description: Design a 90-day new rep onboarding and ramp plan with milestones and knowledge checks. Use when someone says "onboarding plan", "rep onboarding", "ramp plan", "new hire plan", "sales onboarding", "SDR onboarding", "AE ramp", or "training plan"
tools: Read, Write
---

# Onboarding Ramp Plan

Design a 90-day onboarding plan for new sales reps with weekly activities, ramp quotas, certification milestones, and knowledge checks. The goal is predictable time-to-productivity: every new hire follows the same path and reaches full performance on the same timeline.

Bad onboarding is the most expensive problem in sales. A rep who takes 6 months to ramp instead of 3 costs you 3 months of salary plus 3 months of missed quota. This plan compresses ramp time by being specific about what to learn, when, and how to prove it.

## Inputs

- **Role** (required) -- SDR, AE, AM, or CSM
- **Products/services to learn** (required) -- what the rep needs to sell
- **Sales process** (required) -- stages and methodology
- **Team structure** (optional) -- who the new hire reports to, who mentors them
- **Tools to learn** (optional) -- CRM, sales engagement, demo tools
- **Existing training materials** (optional) -- what's already available

If role is missing, ask: "Which role is this onboarding plan for? I need the role, the products they'll sell, and the sales process they'll follow."

## Steps

### Step 0 -- Check for Existing Output

Read `docs/ops/onboarding-plan.md` if it exists. If found, present a summary and ask: "An onboarding plan already exists for {role}. Do you want me to (a) update the timeline, (b) add certification milestones, or (c) rebuild from scratch?"

### Step 1 -- Load Context

Read all available context:

1. `docs/ops/sales-process.md` -- the process they'll execute
2. `docs/ops/compensation-model.md` -- ramp quota structure
3. `docs/personas/*.md` -- who they'll sell to
4. `docs/messaging-matrix.md` -- how to talk about the product
5. `CLAUDE.md` -- project-level instructions

### Step 2 -- Design Week 1-2: Foundation

**Week 1: Product and Company**
- Day 1: Company overview, team intros, tool access setup
- Day 2-3: Product deep dive. Not features. Customer problems and how the product solves them.
- Day 4-5: ICP and persona training. Who buys, why, and what they care about.
- Knowledge check: Can the rep explain the product's value in the customer's language? Test with a 2-minute pitch.

**Week 2: Process and Tools**
- Day 6-7: Sales process training. Walk through every stage with examples.
- Day 8-9: CRM and sales tools training. Not just how to use them, but why (data quality, pipeline accuracy).
- Day 10: Shadow 2-3 live calls with experienced reps. Document observations.
- Knowledge check: Can the rep navigate the CRM and explain each pipeline stage?

### Step 3 -- Design Week 3-4: Guided Practice

**Week 3: First Calls**
- Make first outbound calls/emails with manager listening
- Conduct mock discovery calls with team members roleplaying prospects
- Begin working assigned accounts (with mentor oversight)
- Attend pipeline review as observer

**Week 4: Independent with Guardrails**
- Run first solo discovery call
- Send first outbound sequences (reviewed before sending)
- First attempt at qualifying a lead through the full process
- Knowledge check: Complete a mock discovery call scored against criteria. Pass threshold: 70%.

Ramp quota: 0% in weeks 1-4 (no quota, focus on learning).

### Step 4 -- Design Month 2: Ramp to 50%

**Weeks 5-6:**
- Full ownership of assigned accounts/territory
- Running discovery and demo calls independently
- Manager reviews 50% of calls (recorded)
- Attend deal review meetings as participant

**Weeks 7-8:**
- Handle objections independently
- Create first proposals with manager review
- Begin building own pipeline
- Knowledge check: Handle the top 5 objections in a roleplay. Pass threshold: 4/5 handled effectively.

Ramp quota: 50% of full quota for month 2.

### Step 5 -- Design Month 3: Ramp to 75-100%

**Weeks 9-10:**
- Full independence on calls and pipeline management
- Manager reviews 25% of calls
- Contribute to forecast with own pipeline
- Mentor a newer hire if one exists (teaching reinforces learning)

**Weeks 11-12:**
- Operating at full speed
- All calls independent, manager review by exception
- Hitting or approaching ramp quota
- Final certification: Live call scored by manager + peer. Pass threshold: 80%.

Ramp quota: 75% of full quota for month 3. Full quota starting month 4.

### Step 6 -- Define Certification Milestones

Create clear pass/fail checkpoints:

| Week | Milestone | Assessment | Pass Threshold |
|------|-----------|-----------|---------------|
| 2 | Product pitch | 2-min pitch to manager | Can explain value in customer language |
| 4 | Discovery call | Mock call scored on rubric | 70% on scoring criteria |
| 8 | Objection handling | Top 5 objections roleplay | 4/5 handled effectively |
| 12 | Full certification | Live call scored by manager + peer | 80% on scoring criteria |

Failing a milestone means: extended practice in that area, re-test within 1 week. Two failures at the same milestone triggers a performance conversation.

### Step 7 -- Quality Gate

- [ ] Every week has specific activities, not just themes
- [ ] Knowledge checks are defined with clear pass/fail criteria
- [ ] Ramp quotas follow 0%/50%/75%/100% progression
- [ ] Shadowing and live call practice happen in weeks 1-4, not just classroom training
- [ ] Certification milestones are assessable (not "understands the product")
- [ ] Failure at milestones has a defined path (re-test, not automatic termination)
- [ ] The plan is achievable in 90 days (not 90 days of content crammed into a checklist)

If any check fails, fix it before proceeding.

## Output Format

Save to `docs/ops/onboarding-plan.md`:

```markdown
# Onboarding Plan: {Role}
Date: {Date}
Duration: 90 days
Full quota starts: Month 4

## Ramp Schedule
| Period | Quota | Focus Area |
|--------|-------|-----------|
| Weeks 1-2 | 0% | Product, ICP, tools |
| Weeks 3-4 | 0% | Guided practice, first calls |
| Month 2 | 50% | Independent with support |
| Month 3 | 75% | Full independence |
| Month 4+ | 100% | Full performance |

## Week-by-Week Plan

### Week 1: {Title}
- [ ] {Activity 1}
- [ ] {Activity 2}
- [ ] {Activity 3}
- **Knowledge check:** {Assessment}

### Week 2: {Title}
[Continue for 12 weeks]

## Certification Milestones
| Week | Milestone | Assessment | Pass | Fail Path |
|------|-----------|-----------|------|-----------|

## Training Resources
| Topic | Resource | Format | Required By |
|-------|----------|--------|-------------|

## Manager Checklist
### Before Day 1
- [ ] CRM access provisioned
- [ ] Email and tools set up
- [ ] Territory/accounts assigned
- [ ] Mentor assigned
- [ ] Week 1 schedule shared

### End of Week 2
- [ ] Product pitch knowledge check completed
- [ ] All tools training completed

### End of Month 1
- [ ] Discovery call certification completed
- [ ] First solo calls attempted

### End of Month 2
- [ ] Objection handling certification completed
- [ ] Pipeline building underway

### End of Month 3
- [ ] Full certification completed
- [ ] Ramp to full quota confirmed
```

## Key Principles

1. **Practice beats classroom.** Reps learn by doing, not by watching slides. Get them on calls (even shadowing) by week 2.
2. **Knowledge checks create accountability.** Without assessments, "onboarding complete" means "they sat through the training." With assessments, it means "they can do the job."
3. **Ramp quotas protect and motivate.** 0% in month 1 removes pressure to skip training. 50% in month 2 starts building urgency. 75% in month 3 is nearly full speed.
4. **Managers own onboarding outcomes.** HR can design the program, but the direct manager determines whether it works. Build the manager into every checkpoint.

## Anti-Patterns

- **Firehose onboarding:** Cramming every product feature, process, and tool into week 1. Reps retain nothing. Spread learning over 90 days.
- **No assessments:** Declaring onboarding "complete" after 2 weeks because the rep attended all sessions. Completion is not competence.
- **Sink-or-swim after week 2:** Ending structured onboarding and expecting reps to figure it out. The 90-day plan should provide gradual release, not a cliff.

## What to Do Next

- Design the **sales process** new hires will follow: `/skill sales-process-designer`
- Build **compensation** with ramp quotas: `/skill compensation-modeler`
- Plan **capacity** including ramp time: `/skill capacity-planner`

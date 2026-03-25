---
name: inbound-qualifier
description: Qualify inbound leads with a scoring system and response templates. Use when someone says "qualify leads", "inbound qualification", "lead scoring", "lead qualifier", "qualify inbound", "should I take this lead", or "lead qualification scorecard"
allowed-tools: Read, Write
metadata:
  author: Achille Morin-Lemoine
  version: "1.0.0"
---

# Inbound Qualifier

Create a qualification scorecard for inbound leads with 5 criteria, a scoring system, thresholds for Yes/Maybe/No, and response templates for each outcome. The goal is to spend time on leads that will close and politely decline the rest.

## Inputs

- **ICP definition** (required) -- who your ideal client is (industry, size, stage, role)
- **Services/product** (required) -- what you sell and at what price point
- **Common inbound sources** (optional) -- where leads come from (website, LinkedIn, referral, content)
- **Current qualification process** (optional) -- how you qualify today (gut feel, questions, nothing)

If ICP or service details are missing, ask: "I need your ideal client profile and what you sell. Who are you trying to qualify?"

## Steps

### Step 0 -- Check for Existing Output

Search the project for any existing output from a previous run of this skill (check common locations like `docs/`, the project root, or any organized output directory). If a previous version is found, present a summary and ask: "A qualification scorecard already exists. Do you want me to (a) update the criteria, (b) adjust the thresholds, or (c) keep it?" 

### Step 1 -- Load Context

Search the project for any available context. Look in the project root, `docs/`, or any organized directory. Read what you find:

1. **GTM Triangle** -- ICP and positioning
2. **Productized Offer** documents -- productized offerings and their fit criteria
3. **Positioning** documents -- who you serve
4. `CLAUDE.md` -- project-level instructions

### Step 2 -- Define 5 Qualification Criteria

**Criterion 1: ICP Fit**
Score based on how well they match your ideal client profile:

| Score | Definition |
|-------|-----------|
| 3 | Perfect fit: right industry, right size, right stage, right role |
| 2 | Partial fit: matches 2-3 of 4 ICP dimensions |
| 1 | Poor fit: matches 0-1 dimensions |

**Criterion 2: Budget Signals**
Score based on ability to afford your services:

| Score | Definition |
|-------|-----------|
| 3 | Clear budget: stated budget matches your pricing, or company size/funding indicates ability to pay |
| 2 | Likely budget: company profile suggests ability to pay but not confirmed |
| 1 | No budget signals: early stage, very small, or price-sensitive indicators |

**Criterion 3: Timing**
Score based on urgency:

| Score | Definition |
|-------|-----------|
| 3 | Urgent: needs help now, has a deadline, active pain |
| 2 | Planning: needs help in 1-3 months, researching options |
| 1 | Exploring: no timeline, "just looking," educational interest |

**Criterion 4: Decision Authority**
Score based on whether they can buy:

| Score | Definition |
|-------|-----------|
| 3 | Decision maker: can approve and sign, controls budget |
| 2 | Influencer: involved in decision but needs approval from someone else |
| 1 | Researcher: gathering information for someone else, or unknown authority |

**Criterion 5: Engagement Quality**
Score based on how they found you and what they said:

| Score | Definition |
|-------|-----------|
| 3 | High quality: specific problem described, referenced your content/case study, warm intro |
| 2 | Medium quality: found through search or content, general interest in your services |
| 1 | Low quality: generic inquiry, mass outreach to multiple providers, no context |

### Step 3 -- Define Thresholds

| Total Score | Outcome | Action |
|-------------|---------|--------|
| 12-15 | **Yes** | Respond within 4 hours. Schedule a call. This is your ideal client. |
| 8-11 | **Maybe** | Respond within 24 hours. Ask qualifying questions. Worth exploring. |
| 5-7 | **No** | Respond within 48 hours with a polite decline. Not a fit right now. |

### Step 4 -- Write Response Templates

**Template 1: Yes (score 12-15)**
- Respond quickly and enthusiastically
- Reference something specific from their inquiry
- Propose a specific time for a call
- Share one relevant proof point

**Template 2: Maybe (score 8-11)**
- Respond with interest and qualifying questions
- Ask the 2-3 questions that would move them to "Yes" or "No"
- Don't commit to a call until questions are answered
- Share a relevant resource (case study, article) to nurture

**Template 3: No (score 5-7)**
- Respond politely and briefly
- Explain why it's not a fit without being dismissive
- Offer an alternative if possible (referral, resource, community)
- Leave the door open for the future

### Step 5 -- Create Quick Scoring Worksheet

Design a worksheet that can be completed in under 2 minutes per lead:

```
Lead: _______________
Source: ______________
Date: _______________

ICP Fit:        [1] [2] [3]
Budget Signals: [1] [2] [3]
Timing:         [1] [2] [3]
Authority:      [1] [2] [3]
Engagement:     [1] [2] [3]

Total: ___/15

Action: [ ] Yes - schedule call  [ ] Maybe - ask questions  [ ] No - polite decline
```

### Step 6 -- Quality Gate

- [ ] 5 criteria are defined with clear scoring rubrics
- [ ] Each criterion has 3 levels (1, 2, 3) with specific definitions
- [ ] Thresholds are set (Yes: 12+, Maybe: 8-11, No: below 8)
- [ ] Response templates are written for all three outcomes
- [ ] Scoring worksheet can be completed in under 2 minutes
- [ ] Templates are professional and leave the door open
- [ ] No em dashes in any copy

## Output Format

Save the output to your project. Suggested filename: `inbound-qualifier.md`

```markdown
# Inbound Lead Qualification Scorecard

Date: {Date}

## Criteria

### 1. ICP Fit
| Score | Definition |
|-------|-----------|
| 3 | {Perfect fit criteria} |
| 2 | {Partial fit criteria} |
| 1 | {Poor fit criteria} |

### 2. Budget Signals
| Score | Definition |
|-------|-----------|
| 3 | {Clear budget} |
| 2 | {Likely budget} |
| 1 | {No budget signals} |

### 3. Timing
| Score | Definition |
|-------|-----------|
| 3 | {Urgent} |
| 2 | {Planning} |
| 1 | {Exploring} |

### 4. Decision Authority
| Score | Definition |
|-------|-----------|
| 3 | {Decision maker} |
| 2 | {Influencer} |
| 1 | {Researcher} |

### 5. Engagement Quality
| Score | Definition |
|-------|-----------|
| 3 | {High quality} |
| 2 | {Medium quality} |
| 1 | {Low quality} |

## Thresholds
| Score | Outcome | Response Time |
|-------|---------|--------------|
| 12-15 | Yes | Within 4 hours |
| 8-11 | Maybe | Within 24 hours |
| 5-7 | No | Within 48 hours |

## Response Templates

### Yes (12-15)
**Subject:** {subject}
{Body}

### Maybe (8-11)
**Subject:** {subject}
{Body with qualifying questions}

### No (5-7)
**Subject:** {subject}
{Body with polite decline}

## Scoring Worksheet
{Quick-fill template}
```

## Key Principles

1. **Speed matters for Yes leads.** A lead that scores 12+ should get a response within 4 hours. Every hour of delay reduces the chance of booking a meeting. These are your ideal clients. Act like it.
2. **Maybe is not a holding pattern.** A Maybe lead needs specific questions answered to become a Yes or a No. Don't let Maybes sit in limbo. Ask the qualifying questions and decide.
3. **Saying No is a service.** A polite, clear decline respects the lead's time and yours. A bad-fit client who hires you creates a worse outcome than a declined lead.
4. **The scorecard eliminates gut-feel bias.** Without a system, you'll take leads because they seem interesting or because you need the revenue. The scorecard keeps decisions consistent.
5. **Under 2 minutes to score.** If qualification takes longer than 2 minutes, you'll stop doing it. Keep the criteria simple and the definitions clear.

## Anti-Patterns

- **Qualifying on vibes.** "They seemed really interested" is not qualification. Score them. Enthusiasm doesn't pay invoices.
- **Never saying No.** Taking every lead because "you never know" leads to unprofitable engagements with bad-fit clients. The cost of a bad client exceeds the cost of a missed opportunity.
- **Slow response to great leads.** Responding to a 14/15 lead two days later because you were busy with a 7/15 lead. Prioritize by score, not by inbox order.

## What to Do Next

- **Productize your service** so qualified leads can buy without a call: `/skill service-productizer`
- **Scope the engagement** for qualified leads: `/skill client-engagement-scoper`
- Define your **positioning** to attract better inbound: `/skill freelancer-positioning`

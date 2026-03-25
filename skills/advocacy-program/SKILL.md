---
name: advocacy-program
description: Build a customer advocacy program with tiers, engagement cadence, and recruitment. Use when someone says "advocacy program", "customer advocates", "customer advisory board", "reference program", "customer champions", "brand ambassadors", or "customer community"
allowed-tools: Read, Write
metadata:
  author: Achille Morin-Lemoine
  version: "1.0.0"
---

# Advocacy Program

Build a structured customer advocacy program with three tiers (Reference, Speaker, Advisor), engagement cadence, recognition and rewards, and a recruitment process. Advocates are your most powerful marketing and sales asset. This skill turns ad hoc customer favors into a managed program.

## Inputs

- **Customer base size** (required) -- total active customers
- **NPS data** (optional) -- Promoter list for recruitment
- **Advocacy activities needed** (required) -- what you want advocates to do (references, speaking, product feedback)
- **Budget** (optional) -- resources available for advocate perks and events
- **Existing advocates** (optional) -- customers who already help informally

If customer base is missing, ask: "How many active customers do you have, and what advocacy activities do you need most (reference calls, event speakers, product feedback)?"

## Steps

### Step 0 -- Check for Existing Output

Search the project for any existing output from a previous run of this skill (check common locations like `docs/`, the project root, or any organized output directory). If a previous version is found, present a summary and ask: "An advocacy program already exists. Do you want me to (a) update tiers, (b) redesign engagement, or (c) rebuild from scratch?" 

### Step 1 -- Load Context

Search the project for any available context. Look in the project root, `docs/`, or any organized directory. Read what you find:

1. **Nps Program** documents -- Promoter identification
2. **Customer Health Model** documents -- health data for qualification
3. **Referral Program** documents -- overlap with referral program
4. `CLAUDE.md` -- project-level instructions

### Step 2 -- Define Advocate Criteria

Set minimum qualifications:

- NPS score of 9 or 10 (or equivalent satisfaction indicator)
- Active customer for 6+ months
- Health score Green for at least 2 consecutive quarters
- Willing to be identified publicly (not all customers can)
- Has achieved measurable results with your product/service

Disqualifiers: active support escalation, declining usage, pending contract renegotiation.

### Step 3 -- Design Three Advocacy Tiers

**Tier 1: Reference**
- Commitment: Take 2-4 reference calls per year from prospects
- Time: 30 minutes per call
- Ideal for: Customers who are happy but time-constrained
- What they get: Early product access, quarterly executive briefing

**Tier 2: Speaker**
- Commitment: Present at 1-2 events per year (webinar, conference, podcast)
- Time: 2-4 hours per event (prep + delivery)
- Ideal for: Customers who enjoy public visibility and thought leadership
- What they get: Everything in Tier 1 + speaking coaching, event VIP access, co-branded content

**Tier 3: Advisor**
- Commitment: Participate in quarterly product advisory board, provide strategic feedback
- Time: 4-6 hours per quarter
- Ideal for: Customers who want to influence product direction
- What they get: Everything in Tier 2 + direct access to product team, roadmap preview, advisory board membership

Customers can be in multiple tiers simultaneously.

### Step 4 -- Design Engagement Cadence

**Monthly:**
- Exclusive newsletter with product updates and insider content
- Early access to new features or beta programs
- Community forum or private Slack channel

**Quarterly:**
- Advocate appreciation event (virtual or in-person)
- Advisory board meeting (Tier 3)
- Progress update on feedback they provided

**Annually:**
- Advocate summit or dinner
- Annual recognition awards
- Personalized impact report ("Your referrals generated $X in revenue")

### Step 5 -- Design Recognition and Rewards

Recognize advocates in ways that matter to them:

**Public recognition:**
- Featured in company newsletter or blog
- Social media spotlight
- Award at annual event
- Speaking slot at user conference

**Tangible rewards:**
- Service credits or account upgrades
- Exclusive merchandise (premium, not swag)
- Charitable donation in their name
- Training or certification credits

**Professional development:**
- Speaking coaching for event speakers
- Executive networking opportunities
- Early access to industry research

Avoid: cash payments (feels transactional), generic gift cards (impersonal), excessive swag (clutters desks).

### Step 6 -- Build Recruitment Outreach

Create a structured recruitment process:

**Identification:** Filter NPS Promoters + Green health + 6+ months tenure

**Outreach (from CS lead):**
"Hi {name}, your results with {product} have been exceptional, especially {specific achievement}. We're building an advocacy community of our most successful customers, and I'd love for you to be part of it. The commitment is {time}, and you'd get {top 2 benefits}. Would you be interested in learning more?"

**Onboarding:**
- Welcome email with program overview
- Schedule introductory call with advocate program manager
- Add to advocate community channels
- Send welcome kit (if budget allows)

Target: recruit 5-10% of Promoters into the program.

### Step 7 -- Quality Gate

- [ ] Three tiers with distinct commitments and clear value at each level
- [ ] Advocate criteria are specific and measurable (not "customers who like us")
- [ ] Engagement cadence is defined monthly, quarterly, and annually
- [ ] Recognition includes non-monetary value (access, visibility, development)
- [ ] Recruitment outreach references specific customer achievements
- [ ] Program doesn't ask more than advocates signed up for
- [ ] Disqualification criteria prevent unhealthy customers from being asked

If any check fails, fix it before proceeding.

## Output Format

Save the output to your project. Suggested filename: `advocacy-program.md`

```markdown
# Customer Advocacy Program
Date: {Date}
Target Advocates: {N} ({%} of Promoters)

## Advocate Criteria
- {Criterion 1}
- {Criterion 2}
- {Criterion 3}
**Disqualifiers:** {List}

## Program Tiers

### Tier 1: Reference
- **Commitment:** {Time and activities}
- **Benefits:** {What they get}
- **Ideal for:** {Profile}

### Tier 2: Speaker
- **Commitment:** {Time and activities}
- **Benefits:** {What they get}
- **Ideal for:** {Profile}

### Tier 3: Advisor
- **Commitment:** {Time and activities}
- **Benefits:** {What they get}
- **Ideal for:** {Profile}

## Engagement Cadence
| Frequency | Activity | Audience |
|-----------|----------|---------|

## Recognition and Rewards
| Type | Reward | Tier | Frequency |
|------|--------|------|-----------|

## Recruitment Process
**Target:** {N} advocates from {N} Promoters
**Outreach template:**
{Template}

## Program Metrics
| Metric | Target |
|--------|--------|
| Reference calls completed | {N}/quarter |
| Speaking engagements | {N}/year |
| Advisory board participation | {%} |
| Advocate retention | {%} |
| Referrals from advocates | {N}/quarter |
```

## Key Principles

1. **Advocacy is earned, not bought.** Advocates participate because they genuinely believe in your product and feel valued. If you have to pay them, you don't have advocates. You have contractors.
2. **Give before you ask.** Provide exclusive access, recognition, and professional development before asking for reference calls. The relationship must feel mutual.
3. **Protect advocate time.** If you promised 2-4 reference calls per year, don't send them 10. Burning out advocates is worse than not having a program.
4. **Make it easy to say yes.** Reduce friction at every step. Pre-brief advocates before reference calls. Handle logistics for speaking events. Respect their time.

## Anti-Patterns

- **Over-asking.** Sending every reference request to the same 3 customers. Spread the load and track ask frequency per advocate.
- **No value back.** Asking customers to give reference calls, speak at events, and join advisory boards without giving them anything in return. Advocacy is a two-way relationship.
- **Letting the program stagnate.** Launching with energy, then abandoning engagement after 3 months. Consistent engagement is what keeps advocates active.

## What to Do Next

- Design an **NPS program** to find Promoters: `/skill nps-survey-designer`
- Build a **referral program** for advocates: `/skill referral-program-designer`
- Plan **expansion** in advocate accounts: `/skill account-expansion-planner`

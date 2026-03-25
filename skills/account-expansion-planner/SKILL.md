---
name: account-expansion-planner
description: Plan expansion within existing accounts by identifying new departments, use cases, and contacts. Use when someone says "account expansion", "expand account", "upsell plan", "cross-sell strategy", "land and expand", "grow account", or "account growth plan"
allowed-tools: Read, Write
metadata:
  author: Achille Morin-Lemoine
  version: "1.0.0"
---

# Account Expansion Planner

Identify and plan expansion opportunities within existing customer accounts. This means finding new departments, use cases, or products to sell, mapping the new contacts to engage, writing expansion-specific messaging, and setting revenue targets.

Expansion selling is fundamentally different from acquisition. You have credibility, data, and champions. But you also have incumbency bias (people assume you only do what they bought you for). This skill helps you break through that ceiling.

## Inputs

- **Account name** (required) -- the existing customer to expand
- **Current engagement** (required) -- what they currently use, who the stakeholders are, contract details
- **Expansion hypothesis** (optional) -- what you think the opportunity is
- **Product/service catalog** (optional) -- what else you can sell them
- **Customer health data** (optional) -- NPS, usage metrics, support history

If account name is missing, ask: "Which existing account are we planning expansion for? I need the company name and a summary of the current engagement."

## Steps

### Step 0 -- Check for Existing Output

Search the project for any existing output from a previous run of this skill (check common locations like `docs/`, the project root, or any organized output directory). If a previous version is found, present a summary and ask: "An expansion plan for {account} already exists. Do you want me to (a) update contacts, (b) add new use cases, or (c) rebuild from scratch?" 

### Step 1 -- Load Context

Search the project for any available context. Look in the project root, `docs/`, or any organized directory. Read what you find:

1. **Account** documents -- original account play
2. **Customer Health Model** documents -- health scoring if available
3. **Upsell Triggers** documents -- trigger definitions
4. **Persona profiles** -- persona definitions for new contacts
5. `CLAUDE.md` -- project-level instructions

### Step 2 -- Analyze Current Engagement

Document the current state:

- **Products/services in use:** What they bought and when
- **Current stakeholders:** Who you know, their roles, and satisfaction level
- **Usage patterns:** How actively they use what they have
- **Contract details:** Renewal date, current ACV, terms
- **Health status:** Green, Yellow, or Red based on available signals

Do not plan expansion in unhealthy accounts. If health is Yellow or Red, flag that retention should be the priority.

### Step 3 -- Identify Expansion Opportunities

Look for three types of expansion:

**New departments:** Which other teams could use your product/service?
- Look for teams with similar pain points to the original buyer
- Look for departments that interact with your current users

**New use cases:** What else can the current team do with your product?
- Features they haven't adopted
- Adjacent problems you can solve
- Integrations that unlock new value

**New products/services:** What else in your catalog fits this account?
- Complementary offerings
- Premium tiers or add-ons
- Professional services

For each opportunity, estimate: revenue potential, probability, and timeline.

### Step 4 -- Map Expansion Contacts

Identify new stakeholders to engage (up to 5):

- **Name and title** -- who to contact in the new department or for the new use case
- **Relationship to current champion** -- do they know each other? Shared objectives?
- **Entry path** -- warm intro from champion, internal referral, or direct outreach
- **Likely priorities** -- what they care about based on role

The best expansion path is always through your existing champion. Map how each new contact connects back to someone who already trusts you.

### Step 5 -- Design Expansion Messaging

Write messaging that differs from acquisition:

- **Lead with results, not features.** "Your team in {department} achieved {result}. We think {new department} could see similar impact."
- **Reference internal proof.** Use their own success as the case study.
- **Acknowledge the relationship.** You're not a stranger. Don't write like one.
- **Be specific about the new opportunity.** "We've seen teams like {new department} use {feature} to solve {problem}" is better than "we have more to offer."

Write one message per new contact, under 150 words each.

### Step 6 -- Plan Outreach and Set Targets

Build a 4-week expansion outreach plan:

- **Week 1:** Align with champion on expansion opportunity and get introduction
- **Week 2:** Reach out to new contacts with champion's support
- **Week 3:** Discovery meetings with new stakeholders
- **Week 4:** Present expansion proposal

Set revenue targets:
- **Expansion ACV target:** ${Amount}
- **Timeline to close:** {Weeks/months}
- **Confidence level:** High, Medium, or Low based on champion support

### Step 7 -- Quality Gate

- [ ] Current account health is Green (or Yellow with a clear plan to stabilize)
- [ ] At least one expansion opportunity is identified with revenue estimate
- [ ] New contacts are mapped with relationship to existing champion
- [ ] Messaging leads with internal results, not product features
- [ ] Champion is part of the expansion strategy, not bypassed
- [ ] Revenue targets are set with timeline and confidence level
- [ ] Messages are under 150 words each

If any check fails, fix it before proceeding.

## Output Format

Save the output to your project. Suggested filename: `expansion-{account-slug}.md`

```markdown
# Account Expansion: {Company Name}
Date: {Date}
Current ACV: ${Amount}
Expansion Target: ${Amount}
Account Health: {Green/Yellow/Red}

## Current Engagement
- **Products/services:** {What they use}
- **Key stakeholders:** {Names and roles}
- **Contract renewal:** {Date}
- **Usage/health:** {Summary}

## Expansion Opportunities

### Opportunity 1: {Description}
- **Type:** New department / New use case / New product
- **Revenue potential:** ${Amount}
- **Probability:** {H/M/L}
- **Timeline:** {Weeks/months}
- **Champion support:** {Yes/No/Unknown}

### Opportunity 2: {Description}
[Same structure]

## New Contacts

| Name | Title | Department | Entry Path | Champion Connection |
|------|-------|-----------|------------|-------------------|

## Expansion Messages

### {Contact 1 Name}
{Message text}

### {Contact 2 Name}
{Message text}

## Outreach Timeline
### Week 1
- [ ] {Action}
### Week 2
- [ ] {Action}
### Week 3
- [ ] {Action}
### Week 4
- [ ] {Action}

## Revenue Summary
| Opportunity | Target ACV | Probability | Expected Close |
|------------|-----------|------------|---------------|
| **Total** | **${Amount}** | | |
```

## Key Principles

1. **Expand from strength, not desperation.** Only expand in healthy accounts. Expansion in at-risk accounts accelerates churn.
2. **Your champion is your distribution channel.** Every expansion play should flow through someone who already trusts you. Cold outreach inside an existing customer is a red flag.
3. **Internal proof beats external case studies.** "Your marketing team saw X results" is 10x more compelling to the sales team than "Company Y saw X results."
4. **Expansion messaging is not acquisition messaging.** You have a relationship. Use it. Acknowledge shared history and build on it.
5. **Set specific revenue targets.** "We should expand this account" is not a plan. "${50K} additional ACV from {department} by {date}" is a plan.

## Anti-Patterns

- **Expanding in Red accounts:** Trying to sell more to a customer who's unhappy with what they have. Fix retention first.
- **Bypassing the champion:** Going directly to new departments without your champion's introduction. This feels like going behind their back.
- **Generic expansion pitch:** "We have more products you might like." No one responds to this. Be specific about the opportunity and the outcome.

## What to Do Next

- Map **upsell triggers** across all accounts: `/skill upsell-trigger-mapper`
- Build a **customer health model** to identify expansion-ready accounts: `/skill customer-health-scorer`
- Design the **success plan** for the expanded engagement: `/skill success-plan-template`

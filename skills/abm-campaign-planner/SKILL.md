---
name: abm-campaign-planner
description: Design a full ABM campaign for a target account list with tier-specific plays. Use when someone says "ABM campaign", "account-based campaign", "design ABM", "ABM plan", "tier-based campaign", or "account-based marketing plan"
allowed-tools: Read, Write
metadata:
  author: Achille Morin-Lemoine
  version: "1.0.0"
---

# ABM Campaign Planner

Design a complete ABM campaign with tier-specific channel mix, persona-targeted messaging, content plan, timeline, budget, and success metrics. The output is an executable campaign brief your team can run without asking follow-up questions.

ABM fails when every account gets the same treatment. This skill forces differentiation by tier: Tier 1 gets 1:1 custom plays, Tier 2 gets 1:few semi-personalized campaigns, Tier 3 gets 1:many programmatic coverage.

## Inputs

- **Target account list or tiering model** (required) -- accounts segmented into tiers, or criteria to tier them
- **ICP definition** (required) -- who you're targeting and why
- **Personas** (required) -- buying committee roles to engage per account
- **Campaign duration** (optional) -- 4-12 weeks, default 8 weeks
- **Budget** (optional) -- total budget for the campaign
- **Existing content inventory** (optional) -- what assets you already have

If account list or ICP is missing, ask: "I need your target account list (or tiering model) and ICP definition. Do you have docs/account-tiering-model.md or docs/icp.md?"

## Steps

### Step 0 -- Check for Existing Output

Search the project for any existing output from a previous run of this skill (check common locations like `docs/`, the project root, or any organized output directory). If a previous version is found, present a summary and ask: "An ABM campaign plan already exists for {name}. Do you want me to (a) update the timeline, (b) adjust the channel mix, or (c) rebuild from scratch?" 

### Step 1 -- Load Context

Search the project for any available context. Look in the project root, `docs/`, or any organized directory. Read what you find:

1. **Account tiering model** -- tier definitions and scoring
2. ICP document or gtm triangle.md documents -- ICP criteria
3. **Persona profiles** -- persona details, KPIs, pain points
4. **Messaging matrix** -- existing messaging by persona x pillar
5. **Abm Content Map** documents -- content inventory if available
6. `CLAUDE.md` -- project-level instructions

### Step 2 -- Select and Tier Accounts

Review the account list and confirm tier assignments:

- **Tier 1 (1:1):** 5-15 accounts max. Each gets a custom play.
- **Tier 2 (1:Few):** 15-50 accounts. Grouped by segment for semi-personalized campaigns.
- **Tier 3 (1:Many):** 50+ accounts. Programmatic engagement only.

If accounts aren't pre-tiered, apply the tiering model from Step 1. If no model exists, tier by ICP fit + signal strength.

### Step 3 -- Define Channel Mix Per Tier

For each tier, specify which channels to use and their role:

**Tier 1 channels:** LinkedIn (personal outreach), email (hyper-personalized), direct mail/gifts, executive dinners, custom content, paid ads (account-targeted), phone.

**Tier 2 channels:** LinkedIn (semi-personalized), email (segmented sequences), LinkedIn Ads (matched audiences), webinars, targeted content.

**Tier 3 channels:** Email (automated sequences), LinkedIn Ads (broad targeting), retargeting, content syndication.

For each channel, define: purpose, frequency, who executes, and expected output.

### Step 4 -- Create Persona-Specific Messaging Per Channel

For each tier x persona combination, write:

- **Primary message:** The one thing this persona needs to hear
- **Proof point:** The specific evidence that makes it credible
- **Channel adaptation:** How the message changes by channel (email is direct, LinkedIn is conversational, ads are punchy)

Pull from messaging matrix if available. If not, derive from persona pain points and value props.

### Step 5 -- Plan Content Needs

Map required content to campaign stages:

- **Awareness:** Industry insight, benchmark data, thought leadership
- **Consideration:** Case studies, comparison guides, ROI calculators
- **Decision:** Proposals, custom demos, executive summaries

Flag what exists vs. what needs to be created. Prioritize creation by tier (Tier 1 content first).

### Step 6 -- Build Timeline

Create a week-by-week execution plan for the campaign duration (default 8 weeks):

- **Weeks 1-2:** Launch awareness plays, start Tier 1 personal outreach
- **Weeks 3-4:** Layer in consideration content, Tier 2 sequences go live
- **Weeks 5-6:** Push for meetings, Tier 1 executive engagement
- **Weeks 7-8:** Decision-stage plays, deal acceleration

Each week should list specific actions, responsible owners, and deliverables.

### Step 7 -- Allocate Budget

Break budget across tiers and channels:

- Tier 1 should get 40-50% of budget despite having fewest accounts
- Tier 2 gets 30-35%
- Tier 3 gets 15-25%

Within each tier, allocate by channel. Flag if budget is insufficient for the planned activities.

### Step 8 -- Define Success Metrics

Set metrics per tier:

- **Tier 1:** Account engagement score, meetings booked, pipeline created, deals closed
- **Tier 2:** Engagement rate, MQLs generated, meetings booked, pipeline
- **Tier 3:** Impressions, click-through rate, MQLs, cost per MQL

Define weekly and end-of-campaign targets for each metric.

### Step 9 -- Quality Gate

- [ ] Every tier has a distinct channel mix (not the same plan copy-pasted three times)
- [ ] Persona-specific messaging exists for at least the top 2 personas per tier
- [ ] Timeline has specific weekly actions, not just phase labels
- [ ] Budget allocation matches tier priority (Tier 1 gets the most per account)
- [ ] Success metrics are measurable and have numeric targets
- [ ] Content gaps are identified with creation priority
- [ ] No tier has more than 6 simultaneous channels (focus beats coverage)

If any check fails, fix it before proceeding.

## Output Format

Save the output to your project. Suggested filename: `abm-campaign-{name-slug}.md`

```markdown
# ABM Campaign: {Campaign Name}
Date: {Date}
Duration: {N} weeks
Total Budget: ${Amount}

## Target Accounts

### Tier 1 (1:1) -- {N} accounts
| Account | ICP Score | Signal Score | Key Persona | Entry Point |
|---------|-----------|-------------|-------------|-------------|

### Tier 2 (1:Few) -- {N} accounts
[Grouped by segment]

### Tier 3 (1:Many) -- {N} accounts
[Criteria-based, not listed individually]

## Channel Mix by Tier
[Table: Tier x Channel with role and frequency]

## Messaging by Persona
### {Persona 1}
- **Primary message:** {Message}
- **Proof point:** {Evidence}
- **Tier 1 adaptation:** {Custom approach}
- **Tier 2 adaptation:** {Semi-custom approach}

### {Persona 2}
[Same structure]

## Content Plan
| Asset | Stage | Tier | Status | Priority |
|-------|-------|------|--------|----------|

## Weekly Timeline
### Week 1
- [ ] {Action 1} -- {Owner}
- [ ] {Action 2} -- {Owner}
[Continue for all weeks]

## Budget Allocation
| Tier | Budget | % of Total | Per Account |
|------|--------|-----------|-------------|

## Success Metrics
| Metric | Tier 1 Target | Tier 2 Target | Tier 3 Target |
|--------|--------------|--------------|--------------|
```

## Key Principles

1. **Tier 1 is where ABM lives or dies.** If your Tier 1 plays look like scaled email campaigns, you're doing programmatic marketing and calling it ABM.
2. **Channel mix should vary by tier.** Tier 1 gets human-intensive channels (calls, dinners, custom content). Tier 3 gets scalable channels (ads, automation).
3. **Persona messaging drives engagement.** Generic "company-level" messaging fails. Each persona needs to hear why this matters to their role and KPIs.
4. **Timeline creates accountability.** A campaign without weekly actions is a wish list. Assign owners and deadlines.
5. **Budget follows accounts, not channels.** Allocate to tiers first, then to channels within tiers.

## Anti-Patterns

- **Same play for every tier:** If Tier 1 and Tier 3 get the same email sequence, you don't have an ABM campaign. You have a mass email with a fancy label.
- **No content for later stages:** Loading up on awareness content but having nothing for consideration and decision stages. You generate interest you can't convert.
- **Launching everything at once:** Overwhelming accounts with simultaneous touches across every channel in week 1. Layer channels over time.

## What to Do Next

- Design **individual account plays** for Tier 1: `/skill account-play-designer`
- Map **content to buying stages**: `/skill abm-content-mapper`
- Set up **LinkedIn Ads** for the campaign: `/skill linkedin-ads-abm-setup`
- Plan **executive dinners** for Tier 1 accounts: `/skill dinner-event-planner`

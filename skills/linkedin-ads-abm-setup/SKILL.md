---
name: linkedin-ads-abm-setup
description: Design a LinkedIn Ads ABM campaign spec with targeting, creative, and measurement. Use when someone says "LinkedIn ads", "LinkedIn ABM ads", "LinkedIn campaign", "matched audiences", "LinkedIn advertising", "LinkedIn ad strategy", or "account-targeted ads"
allowed-tools: Read, Write
metadata:
  author: Achille Morin-Lemoine
  version: "1.0.0"
---

# LinkedIn Ads ABM Setup

Design a complete LinkedIn Ads ABM campaign specification including target account list configuration, matched audience setup, creative strategy across three ad types, bidding approach, retargeting flow, and measurement framework.

LinkedIn is the only ad platform that lets you target by company name, job title, and seniority simultaneously. This makes it the primary paid channel for ABM. But most LinkedIn ad campaigns waste budget on broad targeting and generic creative. This skill forces account-level precision.

## Inputs

- **Target account list** (required) -- companies to target (minimum 300 for matched audiences to work)
- **Personas** (required) -- job titles and seniority levels to target
- **Campaign budget** (required) -- monthly or total campaign budget
- **Campaign objective** (required) -- awareness, consideration, or conversion
- **Existing content assets** (optional) -- what creative you already have
- **Landing pages** (optional) -- where ad traffic should go

If account list is missing, ask: "I need your target account list for the matched audience. Do you have docs/account-tiering-model.md or a CSV of target companies?"

## Steps

### Step 0 -- Check for Existing Output

Search the project for any existing output from a previous run of this skill (check common locations like `docs/`, the project root, or any organized output directory). If a previous version is found, present a summary and ask: "A LinkedIn Ads spec already exists for {campaign}. Do you want me to (a) update the creative strategy, (b) adjust targeting, or (c) rebuild from scratch?" 

### Step 1 -- Load Context

Search the project for any available context. Look in the project root, `docs/`, or any organized directory. Read what you find:

1. **Account tiering model** -- tier definitions for targeting
2. **Persona profiles** -- persona details for audience building
3. **Messaging matrix** -- messaging by persona
4. **Abm Content Map** documents -- available content for ads
5. `CLAUDE.md` -- project-level instructions

### Step 2 -- Configure Matched Audience

Define the account list upload and audience configuration:

- **Company list:** Upload format (CSV with company names, LinkedIn company URLs, or domain names)
- **Audience layering:** Company list + job title/function + seniority level
- **Audience segments:** Create separate audiences per persona (e.g., "Target Accounts x VP Marketing" and "Target Accounts x CTO")
- **Minimum audience size:** 300 companies or 1,000 members for matched audiences to serve

If the account list is under 300 companies, recommend expanding or using Company Name targeting directly.

### Step 3 -- Design Creative Strategy (3 Ad Types)

Create three ad types aligned to the funnel:

**Ad Type 1 -- Awareness (Sponsored Content):**
- Format: Single image or video
- Message: Industry insight or trend. No product mention.
- CTA: "Learn More" to ungated content
- Goal: Build familiarity and engagement baseline

**Ad Type 2 -- Consideration (Sponsored Content or Carousel):**
- Format: Carousel (3-5 cards) or document ad
- Message: Framework, comparison, or how-to content
- CTA: "Download" to lightly gated content (email only)
- Goal: Capture leads and signal interest

**Ad Type 3 -- Conversion (Message Ad or Conversation Ad):**
- Format: Sponsored InMail or conversation ad
- Message: Direct, personalized outreach with specific CTA
- CTA: "Book a Demo" or "Schedule a Call"
- Goal: Drive meetings and pipeline
- Targeting: Only serve to accounts that engaged with Ad Types 1 or 2

For each ad type, write: headline (under 70 chars), body copy (under 150 chars for feed), and CTA.

### Step 4 -- Set Bidding Approach

Define bidding strategy per ad type:

- **Awareness:** Maximum delivery (optimize for impressions) or CPM bid
- **Consideration:** Automated bid (optimize for clicks) with daily budget cap
- **Conversion:** Manual CPC bid with aggressive targeting to engaged audience

Set daily and total budget caps. Recommend 60% of budget to Consideration, 25% to Awareness, 15% to Conversion.

### Step 5 -- Plan Retargeting Flow

Design the sequential exposure strategy:

1. **Cold audience** sees Awareness ads first (weeks 1-2)
2. **Engaged audience** (clicked or viewed) gets Consideration ads (weeks 2-4)
3. **Warm audience** (downloaded content or high engagement) gets Conversion ads (weeks 3-6)
4. **Meeting booked** audience gets excluded from all campaigns

Define retargeting audiences using LinkedIn's engagement retargeting (video views, lead gen form opens, website visits).

### Step 6 -- Define Measurement Framework

Set metrics and targets per ad type:

| Metric | Awareness Target | Consideration Target | Conversion Target |
|--------|-----------------|---------------------|-------------------|
| Impressions | {N} | {N} | {N} |
| CTR | >0.4% | >0.8% | >1.5% |
| Cost per click | <${X} | <${X} | <${X} |
| Leads | N/A | {N} | {N} |
| Cost per lead | N/A | <${X} | <${X} |
| Meetings | N/A | N/A | {N} |

Define weekly reporting cadence and optimization triggers (pause underperforming ads, increase budget on winners).

### Step 7 -- Quality Gate

- [ ] Matched audience is 300+ companies or alternative targeting is specified
- [ ] Three distinct ad types exist (awareness, consideration, conversion)
- [ ] Creative copy is within LinkedIn character limits
- [ ] Retargeting flow moves prospects through a sequence, not random exposure
- [ ] Budget split is defined across ad types with daily caps
- [ ] Conversion ads only target engaged audiences (not cold)
- [ ] Measurement includes cost per meeting, not just impressions

If any check fails, fix it before proceeding.

## Output Format

Save the output to your project. Suggested filename: `linkedin-ads-abm-{campaign-slug}.md`

```markdown
# LinkedIn Ads ABM: {Campaign Name}
Date: {Date}
Budget: ${Amount} ({monthly/total})
Duration: {N} weeks

## Target Audience
- **Account list:** {N} companies
- **Personas:** {Persona 1 (title + seniority)}, {Persona 2}
- **Estimated audience size:** {N} members

## Audience Segments
| Segment | Companies | Job Criteria | Est. Size |
|---------|-----------|-------------|-----------|

## Creative Strategy

### Ad Type 1 -- Awareness
- **Format:** {Format}
- **Headline:** {Headline}
- **Body:** {Copy}
- **CTA:** {CTA} to {Destination}
- **Asset needed:** {Description}

### Ad Type 2 -- Consideration
[Same structure]

### Ad Type 3 -- Conversion
[Same structure]

## Bidding and Budget
| Ad Type | Bid Strategy | Daily Budget | Total Budget |
|---------|-------------|-------------|-------------|

## Retargeting Flow
1. Week 1-2: {Cold audience} sees {Ad Type 1}
2. Week 2-4: {Engaged audience} sees {Ad Type 2}
3. Week 3-6: {Warm audience} sees {Ad Type 3}

## Measurement
| Metric | Awareness | Consideration | Conversion |
|--------|-----------|--------------|------------|

## Weekly Optimization Checklist
- [ ] Review CTR by ad type
- [ ] Pause ads below {threshold}
- [ ] Increase budget on top performer
- [ ] Check frequency cap (avoid ad fatigue)
- [ ] Update exclusion list with booked meetings
```

## Key Principles

1. **Sequential exposure beats random impressions.** Move prospects through Awareness to Consideration to Conversion. Don't show conversion ads to cold audiences.
2. **Matched audiences are the foundation.** Without account-level targeting, you're running demand gen, not ABM. Upload your list.
3. **Creative must match the funnel stage.** Awareness ads educate. Consideration ads compare. Conversion ads ask. Mixing these up wastes budget.
4. **Exclude converted accounts.** Once someone books a meeting, stop spending ad dollars on them. Update exclusion lists weekly.

## Anti-Patterns

- **One ad for all stages:** Running a single "book a demo" ad to cold accounts. Cold audiences need education first.
- **Broad targeting on LinkedIn:** Targeting "Marketing" function globally instead of matched audience + specific titles. Your budget evaporates on irrelevant impressions.
- **Ignoring frequency:** Showing the same ad 20 times to the same person. Set frequency caps and rotate creative every 2-3 weeks.

## What to Do Next

- Design the **full ABM campaign** this supports: `/skill abm-campaign-planner`
- Create **ad copy variants** for testing: `/skill ad-copy-writer`
- Map **content to buying stages** for ad creative: `/skill abm-content-mapper`

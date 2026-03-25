---
name: co-marketing-planner
description: Plan a co-marketing campaign with a partner. Use when someone says "co-marketing", "joint campaign", "partner marketing", "webinar with partner", "co-authored content", "email swap", "joint event", or "partner campaign"
allowed-tools: Read, Write
metadata:
  author: Achille Morin-Lemoine
  version: "1.0.0"
---

# Co-Marketing Planner

Plan a co-marketing campaign with a partner that delivers value to both audiences. Defines the format, joint value proposition, content ownership, lead split, promotion plan, and success metrics.

## Inputs

- **Partner name** (required) -- who you're co-marketing with
- **Partner audience** (required) -- who they reach (size, profile, overlap with yours)
- **Campaign goal** (required) -- what you want (leads, brand awareness, product adoption)
- **Format preference** (optional) -- webinar, co-authored content, event, email swap. If not specified, recommend based on goal.
- **Budget** (optional) -- available spend for the campaign
- **Timeline** (optional) -- target dates

If partner name or campaign goal is missing, ask: "I need to know who the partner is and what you're trying to achieve with this co-marketing campaign."

## Steps

### Step 0 -- Check for Existing Output

Search the project for any existing output from a previous run of this skill (check common locations like `docs/`, the project root, or any organized output directory). If a previous version is found, present a summary and ask: "A co-marketing plan with this partner already exists. Do you want me to (a) update it, (b) plan a new campaign, or (c) keep it?" 

### Step 1 -- Load Context

Search the project for any available context. Look in the project root, `docs/`, or any organized directory. Read what you find:

1. **GTM Triangle** -- your positioning
2. **Partner Program** documents -- partner program structure
3. **Content** documents -- existing content for format reference
4. `CLAUDE.md` -- project-level instructions

### Step 2 -- Define Joint Audience Overlap

Map the intersection:
- **Your audience:** {profile, size, channels}
- **Partner's audience:** {profile, size, channels}
- **Overlap:** {shared characteristics, estimated overlap percentage}
- **Unique reach:** {what each partner brings that the other lacks}

The overlap is your co-marketing sweet spot. The unique reach is why the partnership creates net-new value.

### Step 3 -- Choose Format

Select based on goal and audience:

| Goal | Best Format | Why |
|------|------------|-----|
| Lead generation | Webinar or gated content | Captures contact info from both audiences |
| Brand awareness | Co-authored content or event | Reaches new audiences without friction |
| Product adoption | Integration showcase or workshop | Demonstrates joint value hands-on |
| List building | Email swap or newsletter feature | Low effort, high reach |

Recommend one primary format and one secondary format.

### Step 4 -- Write Joint Value Proposition

Write a one-paragraph value proposition that:
- Speaks to the shared audience
- Combines both partners' strengths
- Offers something neither could deliver alone
- Avoids generic "we're excited to partner" language

### Step 5 -- Plan Content Creation

Define who creates what:

| Deliverable | Owner | Deadline | Status |
|-------------|-------|----------|--------|
| {Asset 1} | {Your team or Partner} | {Date} | Not started |
| {Asset 2} | {Your team or Partner} | {Date} | Not started |

Rule: split creation roughly proportional to expected benefit. If you expect 60% of leads, do 60% of the work.

### Step 6 -- Define Lead Split Rules

Choose one model:
- **50/50 split:** Both parties get all leads. Simple, best for early partnerships.
- **Source-based:** Leads go to whoever's audience they came from. Fair, but harder to track.
- **Contribution-based:** Leads split proportional to promotional effort. Most complex.

Define explicitly: who owns the lead, who follows up first, what the handoff process looks like, and how leads are shared (CSV, CRM sync, manual).

### Step 7 -- Create Promotion Plan

Plan promotion across both partners' channels:

**Pre-campaign (2 weeks before):**
- Email announcement to both lists
- Social media posts (3 per partner minimum)
- LinkedIn posts from key people at both companies
- Website banner or blog post

**During campaign:**
- Live promotion (if event-based)
- Social sharing with co-branded hashtag

**Post-campaign:**
- Follow-up emails to registrants and attendees
- Content repurposing (recording, blog recap, social clips)

### Step 8 -- Set Success Metrics

Define metrics both partners agree on:
- **Registrations/downloads:** {target}
- **Attendance rate** (if event): {target, benchmark 40-50%}
- **Leads generated per partner:** {target}
- **Pipeline influenced:** {target within 90 days}
- **Content engagement:** {views, shares, comments}

### Step 9 -- Quality Gate

- [ ] Joint value proposition is specific (not generic "partnership" language)
- [ ] Content ownership is assigned with deadlines
- [ ] Lead split rules are explicit and agreed
- [ ] Promotion plan covers both partners' channels
- [ ] Success metrics are defined with targets
- [ ] Timeline is realistic (minimum 3 weeks from planning to execution)
- [ ] No em dashes in any copy

## Output Format

Save the output to your project. Suggested filename: `co-marketing-{partner-slug}.md`

```markdown
# Co-Marketing Campaign: {Your Company} x {Partner}

Date: {Date}
Format: {Primary format}
Status: Planning / In Progress / Complete

## Audience Overlap
{Your audience, their audience, overlap, unique reach}

## Joint Value Proposition
{One paragraph}

## Content Plan
| Deliverable | Owner | Deadline | Status |
|-------------|-------|----------|--------|
| {rows} |

## Lead Split
- **Model:** {50/50, source-based, or contribution-based}
- **Sharing method:** {How leads are exchanged}
- **Follow-up ownership:** {Who contacts leads first}

## Promotion Plan
### Pre-Campaign
{Activities per partner}
### During Campaign
{Activities}
### Post-Campaign
{Follow-up and repurposing}

## Success Metrics
| Metric | Target | Actual |
|--------|--------|--------|
| {rows} |
```

## Key Principles

1. **Equal effort or proportional effort, never lopsided.** If one partner does all the work and splits leads 50/50, the partnership won't survive a second campaign.
2. **The joint value prop must be genuinely joint.** "We're both great companies" is not a value proposition. What can you deliver together that neither can alone?
3. **Promotion is half the work.** A great webinar with zero promotion produces zero leads. Plan promotion with the same rigor as content creation.
4. **Agree on lead handling before launch.** The worst outcome is generating leads and then arguing about who follows up. Settle this on day one.

## Anti-Patterns

- **The one-sided partnership.** One partner promotes heavily while the other posts once on social media. Define minimum promotion commitments upfront.
- **Vague lead sharing.** "We'll figure it out after" guarantees someone will be disappointed. Define the exact mechanism before launching.
- **Generic content.** A webinar titled "The Future of {Industry}" attracts tire-kickers. A webinar titled "How to Fix {Specific Problem} Using {Specific Approach}" attracts buyers.

## What to Do Next

- Write the **content pieces** for the campaign: `/skill blog-post-writer` or `/skill webinar-outline`
- Build a **follow-up sequence** for leads: `/skill follow-up-sequence`
- Track **campaign performance**: `/skill campaign-analyzer`

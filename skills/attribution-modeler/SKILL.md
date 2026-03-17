---
description: Design a marketing attribution model. Use when someone says "attribution model", "attribution", "marketing attribution", "track attribution", "first touch last touch", "multi-touch attribution", or "channel attribution"
tools: Read, Write
---

# Attribution Modeler

Design a marketing attribution model that answers "which channels and touchpoints actually drive revenue?" Defines the model type, touchpoint categories, tracking implementation, reporting template, and documents assumptions honestly.

## Inputs

- **Channels** (required) -- which channels to attribute (outbound email, LinkedIn, events, content, ads, referrals)
- **Sales cycle** (required) -- average deal cycle length (impacts attribution window)
- **Current tracking** (optional) -- what's already tracked, UTM usage, CRM setup
- **Attribution goal** (optional) -- what decision this model should inform (budget allocation, channel investment, headcount)

If channels or sales cycle are missing, ask: "I need to know which channels you use and your average deal cycle length. What's the context?"

## Steps

### Step 0 -- Check for Existing Output

Read `docs/analytics/attribution-model.md` if it exists. If found, present a summary and ask: "An attribution model already exists. Do you want me to (a) update it, (b) switch model types, or (c) keep it?"

### Step 1 -- Load Context

Read all available context:

1. `docs/analytics/*.md` -- existing analytics frameworks
2. `docs/gtm-triangle.md` -- channels and GTM motion
3. `docs/analytics/dashboard-spec.md` -- current reporting
4. `CLAUDE.md` -- project-level instructions

### Step 2 -- Choose Model Type

Evaluate each model and recommend one:

| Model | How It Works | Best For | Limitation |
|-------|-------------|----------|-----------|
| **First-touch** | 100% credit to first interaction | Understanding what generates awareness | Ignores everything after first touch |
| **Last-touch** | 100% credit to last interaction before deal | Understanding what closes deals | Ignores everything that built trust |
| **Linear** | Equal credit to all touchpoints | Simple multi-touch, early-stage companies | Treats a blog visit the same as a demo |
| **Time-decay** | More credit to recent touchpoints | Companies with long sales cycles | Undervalues early awareness touchpoints |
| **W-shaped** | 40% first touch, 20% middle, 40% opportunity creation | Mature B2B with clear funnel stages | Requires clean stage tracking |

Recommendation: for most B2B companies with sales cycles over 30 days, start with **first-touch** AND **last-touch** reported side by side. This shows both "what creates pipeline" and "what closes deals" without requiring complex multi-touch infrastructure.

### Step 3 -- Define Touchpoint Categories

Group all touchpoints into categories:

| Category | Touchpoints | How to Track |
|----------|------------|-------------|
| Outbound | Cold email, cold call, LinkedIn outreach | CRM activity logging |
| Content | Blog, LinkedIn posts, podcast, webinar | UTM parameters |
| Events | Conference, trade show, dinner, workshop | Event registration + CRM |
| Paid | Google Ads, LinkedIn Ads, display | UTM parameters + ad platform |
| Referral | Partner referral, customer referral, word of mouth | CRM source field |
| Organic | Inbound website, organic search, direct | UTM + analytics |

### Step 4 -- Design Tracking Implementation

**UTM structure:**
- utm_source: {platform} (google, linkedin, partner-name)
- utm_medium: {channel type} (cpc, email, social, event)
- utm_campaign: {campaign name} (q1-abm-campaign, webinar-march)
- utm_content: {variant} (subject-a, cta-v2)

**CRM fields required:**
- Lead source (first touch)
- Most recent source (last touch)
- Source detail (specific campaign or asset)
- Event attendance (for event attribution)
- Referral source (for partner/customer referrals)

**Integration points:**
- Website analytics to CRM (form submissions)
- Email tool to CRM (reply and meeting attribution)
- Ad platforms to CRM (conversion tracking)
- Event platform to CRM (registration and attendance)

### Step 5 -- Create Reporting Template

Design a monthly attribution report:

**By channel (first-touch):**
| Channel | Leads | Opportunities | Pipeline Value | Revenue | CAC |
|---------|-------|---------------|---------------|---------|-----|
| {rows} |

**By channel (last-touch):**
| Channel | Opportunities | Pipeline Value | Revenue | Cost per Opp |
|---------|---------------|---------------|---------|-------------|
| {rows} |

**Trend (quarter over quarter):**
| Channel | Q-2 | Q-1 | Current | Trend |
|---------|-----|-----|---------|-------|
| {rows} |

### Step 6 -- Document Assumptions and Limitations

Be honest about what the model can and cannot tell you:

**Assumptions:**
- {What the model assumes about buyer behavior}
- {How offline touches are handled}
- {What happens with unknown/missing source data}

**Limitations:**
- {What the model cannot measure (dark social, word of mouth, brand)}
- {Data quality dependencies}
- {Lag between touch and conversion}

**Known gaps:**
- {Channels or touchpoints not tracked}
- {Segments where attribution is unreliable}

### Step 7 -- Quality Gate

- [ ] Model type is chosen with rationale
- [ ] All touchpoint categories are mapped
- [ ] UTM structure is defined
- [ ] Required CRM fields are listed
- [ ] Reporting template covers first-touch and last-touch views
- [ ] Assumptions and limitations are documented honestly
- [ ] No em dashes in any copy

## Output Format

Save to `docs/analytics/attribution-model.md`:

```markdown
# Attribution Model

Date: {Date}

## Model Type
{Chosen model with rationale}

## Touchpoint Categories
| Category | Touchpoints | Tracking Method |
|----------|------------|----------------|
| {rows} |

## Tracking Implementation

### UTM Structure
{Naming convention with examples}

### CRM Fields
{Required fields and definitions}

### Integration Points
{System connections needed}

## Reporting Template
### First-Touch View
{Table structure}
### Last-Touch View
{Table structure}
### Trend View
{Table structure}

## Assumptions
{What the model assumes}

## Limitations
{What the model cannot measure}

## Known Gaps
{Tracking holes to fix}
```

## Key Principles

1. **Report first-touch and last-touch side by side.** They answer different questions. First-touch shows what creates awareness. Last-touch shows what closes deals. You need both perspectives.
2. **Document your assumptions.** Every attribution model is wrong. The useful ones are honest about how they're wrong so you can interpret results correctly.
3. **Start simple, add complexity when needed.** First-touch/last-touch is better than no attribution. Perfect multi-touch attribution is a project that takes months. Ship something useful now.
4. **UTM discipline is everything.** An attribution model is only as good as the tracking data. One team member who doesn't use UTMs corrupts the entire dataset.

## Anti-Patterns

- **Attribution as religion.** Treating model output as truth rather than a useful approximation. All models are wrong. Some are useful. Use them for directional decisions, not precise allocations.
- **Ignoring dark social.** Your attribution model will never capture the podcast someone listened to, the Slack community where your name came up, or the dinner conversation that led to a demo request. Acknowledge this.
- **Overcomplicating too early.** Building a W-shaped multi-touch model before you have consistent UTM tagging. Fix the data foundation first.

## What to Do Next

- Build a **dashboard** to visualize attribution data: `/skill outbound-dashboard-spec`
- Track **event attribution** specifically: `/skill field-event-roi-tracker`
- Analyze **content performance** by attribution: `/skill content-performance-analyzer`

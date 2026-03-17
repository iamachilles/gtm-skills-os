---
description: Design a UTM parameter taxonomy for tracking marketing campaigns. Use when someone asks "UTM naming convention", "UTM taxonomy", "campaign tracking setup", "UTM parameters", "attribution tracking", or "how to tag campaign URLs"
tools: Read, Write
---

# UTM Taxonomy

Design a standardized UTM parameter taxonomy for consistent campaign tracking across all channels. The output is a naming convention document with a cheat sheet that the team can reference when creating tracked URLs.

## Inputs

- **Channels used** (required) — which marketing/sales channels are active (LinkedIn, Google Ads, email outbound, organic social, events, etc.)
- **Campaign types** (required) — types of campaigns run (prospecting, retargeting, content promotion, event, product launch, etc.)
- **Analytics platform** (optional) — Google Analytics, HubSpot, Mixpanel, etc.
- **Team size** (optional) — affects complexity of the taxonomy

If channels or campaign types are missing, ask before proceeding.

## Steps

### Step 0 — Idempotency Check

Check if `docs/ops/utm-taxonomy.md` exists. If it does, ask: "A UTM taxonomy already exists. Do you want to refine it or overwrite it?"

### Step 1 — Load Context

Read these files if they exist:
- `docs/icp.md` — for segment naming
- `docs/gtm-triangle.md` — for channel context
- `CLAUDE.md` — project context

### Step 2 — Define utm_source Values

`utm_source` identifies WHERE the traffic comes from.

| Value | When to Use | Example URL Context |
|-------|------------|-------------------|
| linkedin | Any LinkedIn traffic (ads, organic, outbound) | LinkedIn post, LinkedIn ad |
| google | Google Ads or organic | Search ad, display ad |
| email | Email campaigns (outbound + newsletter) | Cold outbound, nurture email |
| twitter | Twitter/X traffic | Organic post, ad |
| facebook | Facebook/Meta traffic | Ad, organic post |
| partner | Partner/co-marketing | Partner newsletter, webinar |
| direct | Direct outreach (1:1 sends) | Personal email, DM |
| event | Conference or webinar | Registration page, follow-up |
| referral | Referral traffic | Referral program link |

Rules:
- Always lowercase
- Use the platform name, not the medium (linkedin, not social-media)
- One value per platform, no variations (not "linkedin-ads" AND "linkedin-organic" as source)

### Step 3 — Define utm_medium Values

`utm_medium` identifies HOW the traffic arrives (the mechanism).

| Value | When to Use |
|-------|------------|
| cpc | Paid click (any platform) |
| organic | Organic/unpaid post or content |
| outbound | Cold outbound email |
| nurture | Nurture/drip email sequence |
| newsletter | Newsletter send |
| social | Organic social media post |
| display | Display/banner ads |
| retargeting | Retargeting ads |
| referral | Referral link |
| webinar | Webinar registration or follow-up |
| event | In-person event |

Rules:
- Always lowercase
- Describes the delivery mechanism, not the platform
- "cpc" for all paid clicks regardless of platform

### Step 4 — Define utm_campaign Naming Convention

`utm_campaign` identifies WHICH specific campaign.

Format: `{yyyy-mm}_{type}_{segment}_{descriptor}`

| Component | Options | Example |
|-----------|---------|---------|
| {yyyy-mm} | Year and month | 2026-03 |
| {type} | prospecting, retargeting, content, event, launch, test | prospecting |
| {segment} | ICP segment or audience name | series-a-saas |
| {descriptor} | Brief campaign description | hiring-signal-outreach |

Full example: `2026-03_prospecting_series-a-saas_hiring-signal-outreach`

Rules:
- Use hyphens within components, underscores between components
- Always lowercase
- Keep under 60 characters total
- Date prefix enables chronological sorting in analytics

### Step 5 — Define utm_content for A/B Variants

`utm_content` identifies WHICH variant within a campaign.

Format: `{element}_{variant}`

Examples:
- `cta_demo-request` vs. `cta_free-trial`
- `headline_pain-point` vs. `headline_social-proof`
- `email_v1` vs. `email_v2`
- `image_product-screenshot` vs. `image_team-photo`

Rules:
- Use for A/B testing only, leave empty if no variants
- Describes what varies, not just a version number

### Step 6 — Create Team Cheat Sheet

Produce a quick-reference table:

| I'm posting on... | utm_source | utm_medium | utm_campaign format |
|-------------------|-----------|-----------|-------------------|
| LinkedIn organic post | linkedin | social | {date}_content_{segment}_{topic} |
| LinkedIn ad | linkedin | cpc | {date}_prospecting_{segment}_{ad-name} |
| Cold email sequence | email | outbound | {date}_prospecting_{segment}_{sequence-name} |
| Nurture email | email | nurture | {date}_nurture_{segment}_{sequence-name} |
| Google Search ad | google | cpc | {date}_prospecting_{keyword-group}_{ad-name} |
| Event follow-up | event | email | {date}_event_{event-name}_{follow-up} |
| Partner webinar | partner | webinar | {date}_partner_{partner-name}_{topic} |

Include a URL builder template:
```
{base-url}?utm_source={source}&utm_medium={medium}&utm_campaign={campaign}&utm_content={content}
```

### Step 7 — Define Dashboard Groupings

Recommend how to group UTM data in analytics:

| Report | Group By | Filter | Metric |
|--------|----------|--------|--------|
| Channel performance | utm_source | — | Sessions, conversions, conversion rate |
| Campaign ROI | utm_campaign | — | Spend, conversions, cost per conversion |
| Content A/B results | utm_content | utm_campaign = [specific] | Click rate, conversion rate |
| Paid vs. organic | utm_medium | cpc vs. organic vs. social | Volume, cost, conversion rate |
| Source + medium combo | utm_source + utm_medium | — | Full channel breakdown |

### Step 8 — Quality Gate

Before saving, verify:
- [ ] Every active channel has defined utm_source and utm_medium values
- [ ] Campaign naming convention includes date, type, and segment
- [ ] No uppercase values anywhere (everything lowercase)
- [ ] Cheat sheet covers all common use cases for the team
- [ ] utm_content convention is defined for A/B testing
- [ ] No conflicting values (same traffic could get tagged two ways)

## Output Format

Save to `docs/ops/utm-taxonomy.md`:

```markdown
# UTM Taxonomy
Date: [Date]
Analytics Platform: [Platform]

## Naming Rules
- All values: lowercase, no spaces
- Word separator within components: hyphens (-)
- Component separator: underscores (_)
- Campaign format: {yyyy-mm}_{type}_{segment}_{descriptor}

## utm_source Values
| Value | Platform |
|-------|---------|
| ... | ... |

## utm_medium Values
| Value | Mechanism |
|-------|----------|
| ... | ... |

## utm_campaign Convention
Format: `{yyyy-mm}_{type}_{segment}_{descriptor}`
[Component definitions table]

## utm_content Convention
Format: `{element}_{variant}`
[Examples]

## Quick Reference Cheat Sheet
| Scenario | source | medium | campaign example |
|----------|--------|--------|-----------------|
| ... | ... | ... | ... |

## URL Builder
{base-url}?utm_source={source}&utm_medium={medium}&utm_campaign={campaign}&utm_content={content}

## Dashboard Groupings
[Reporting recommendations]
```

## Key Principles

1. **Consistency beats cleverness.** A simple taxonomy that everyone follows is better than a sophisticated one that nobody uses. Keep it simple.
2. **Lowercase everything, always.** UTM parameters are case-sensitive in most analytics tools. "LinkedIn" and "linkedin" become two different sources. Enforce lowercase.
3. **Source is WHERE, medium is HOW.** LinkedIn is a source. CPC is a medium. Do not mix them. "linkedin-cpc" as a source breaks reporting.
4. **Date prefix in campaigns enables time analysis.** Without dates, you cannot compare campaign performance over time. Always start with `yyyy-mm`.

## Anti-Patterns

- **"Let everyone create their own UTM values."** Inconsistent tagging makes analytics useless. One person tags "LinkedIn" and another tags "li" and a third tags "linkedin-organic." Define the values once and enforce them.
- **"Use utm_campaign for everything."** Stuffing all context into one parameter makes it impossible to filter and group. Use each parameter for its intended purpose.

## Chain Triggers

After completing, suggest:
- "Share this with the team and bookmark the cheat sheet"
- "Run **tech-stack-auditor** to verify analytics tools are configured to capture UTM data"

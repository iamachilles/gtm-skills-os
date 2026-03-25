---
name: marketplace-listing-writer
description: Write a marketplace listing for a platform. Use when someone says "marketplace listing", "app store listing", "AWS marketplace", "HubSpot marketplace", "Salesforce AppExchange", "marketplace copy", or "listing page"
allowed-tools: Read, Write, WebSearch
metadata:
  author: Achille Morin-Lemoine
  version: "1.0.0"
---

# Marketplace Listing Writer

Write a marketplace listing optimized for a specific platform. Researches platform requirements and top listings, then produces the title, descriptions, feature list, use cases, and media spec.

## Inputs

- **Platform** (required) -- AWS, HubSpot, Salesforce, Shopify, Zapier, etc.
- **Product details** (required) -- what your product does, key features, pricing
- **Integration details** (optional) -- what the integration does specifically on this platform
- **Target buyer** (optional) -- who on this platform would install your product

If platform or product details are missing, ask: "I need to know which marketplace platform and your product details. What are we listing?"

## Steps

### Step 0 -- Check for Existing Output

Search the project for any existing output from a previous run of this skill (check common locations like `docs/`, the project root, or any organized output directory). If a previous version is found, present a summary and ask: "A marketplace listing for [platform] already exists. Do you want me to (a) update it, (b) rewrite for a different angle, or (c) keep it?" 

### Step 1 -- Load Context

Search the project for any available context. Look in the project root, `docs/`, or any organized directory. Read what you find:

1. **GTM Triangle** -- positioning
2. **Value proposition mapping** -- value props to highlight
3. **Integration Brief** documents -- integration specs
4. `CLAUDE.md` -- project-level instructions

### Step 2 -- Research Platform Requirements

Search for:
- "{platform} marketplace listing requirements" -- character limits, required fields, review process
- "{platform} marketplace best listings" -- what top-performing listings have in common

Extract:
- Title character limit
- Short description character limit
- Long description requirements
- Required media (screenshots, icon, video)
- Category and tag options
- Review/approval timeline
- Pricing display requirements

### Step 3 -- Analyze Top Listings

From search results, identify patterns in successful listings:
- How they structure titles (benefit-led vs. feature-led)
- What they include in short descriptions
- How they organize long descriptions
- How many screenshots/media they include
- Common keywords and phrases

### Step 4 -- Write the Listing

**Title** (under 60 characters):
- Lead with what it does, not who you are
- Include primary keyword for search
- Format: "{Action/Benefit} for {Platform}" or "{Product}: {Key Benefit}"

**Short description** (under 200 characters):
- One sentence that answers "what does this do and why should I care?"
- Include the primary use case and key differentiator

**Long description** (structured sections):

1. **Overview** (2-3 sentences): What the product does and who it's for
2. **Key Features** (5-7 bullet points): Specific capabilities, not vague benefits
3. **Use Cases** (3-4 scenarios): "Use this when you need to..." format
4. **How It Works** (3 steps): Simple setup and usage flow
5. **Benefits** (3-4 bullet points): Outcomes, not features
6. **Pricing** (clear tiers or model): What each plan includes
7. **Support** (1-2 lines): How to get help, documentation link

**Integration details:**
- What data syncs and in which direction
- Setup time estimate
- Prerequisites (plan level, permissions)

### Step 5 -- Specify Media Requirements

Define what screenshots and media are needed:

| Asset | Dimensions | Content |
|-------|-----------|---------|
| App icon | {platform spec} | Logo on clean background |
| Screenshot 1 | {platform spec} | Main dashboard or key feature |
| Screenshot 2 | {platform spec} | Setup or configuration view |
| Screenshot 3 | {platform spec} | Results or output view |
| Demo video | {if supported} | 60-second walkthrough |

### Step 6 -- Quality Gate

- [ ] Title is under 60 characters
- [ ] Short description is under 200 characters
- [ ] Long description has all required sections
- [ ] Features are specific, not vague
- [ ] Use cases describe real scenarios
- [ ] Pricing is transparent
- [ ] Media spec matches platform requirements
- [ ] Primary keywords are included naturally
- [ ] No em dashes in any copy

## Output Format

Save the output to your project. Suggested filename: `marketplace-listing-{platform-slug}.md`

```markdown
# Marketplace Listing: {Product} on {Platform}

Date: {Date}
Status: Draft / Submitted / Live

## Listing Copy

### Title
{Under 60 characters}

### Short Description
{Under 200 characters}

### Long Description

#### Overview
{2-3 sentences}

#### Key Features
- {Feature 1}: {what it does}
- {Feature 2}: {what it does}
- {Feature 3}: {what it does}
- {Feature 4}: {what it does}
- {Feature 5}: {what it does}

#### Use Cases
- **{Scenario 1}:** {when and why to use this}
- **{Scenario 2}:** {when and why to use this}
- **{Scenario 3}:** {when and why to use this}

#### How It Works
1. {Step 1}
2. {Step 2}
3. {Step 3}

#### Benefits
- {Outcome 1}
- {Outcome 2}
- {Outcome 3}

#### Pricing
{Clear pricing information}

#### Support
{How to get help}

## Integration Details
{Data sync, setup time, prerequisites}

## Media Spec
| Asset | Dimensions | Content | Status |
|-------|-----------|---------|--------|
| {rows} |

## Platform Requirements
{Character limits, review process, category}

## Keywords
{Primary and secondary keywords for marketplace search}
```

## Key Principles

1. **Write for scanners, not readers.** Marketplace browsers skim. Use bullet points, bold text, and clear headers. Walls of text get skipped.
2. **Features tell, use cases sell.** "Bi-directional data sync" is a feature. "Stop manually copying contacts between your CRM and email tool" is a use case. Include both.
3. **Pricing transparency builds trust.** Hidden pricing ("Contact us") on a marketplace listing signals enterprise complexity. If possible, show clear tiers.
4. **Keywords matter.** Marketplace search is basic. Include the terms your buyer would actually search for in the title and description.
5. **Screenshots do the heavy lifting.** Most buyers look at screenshots before reading the description. Make them self-explanatory with annotations.

## Anti-Patterns

- **The generic listing.** Copy-pasting your website homepage into the marketplace description. Marketplace buyers need platform-specific context.
- **Feature overload.** Listing 20 features when 5 matter. Highlight the capabilities most relevant to this platform's users.
- **Ignoring platform conventions.** Each marketplace has norms. A Salesforce AppExchange listing reads differently from a Zapier listing. Match the platform's style.

## What to Do Next

- Create an **integration brief** with technical details: `/skill integration-partner-brief`
- Plan **co-marketing** for the listing launch: `/skill co-marketing-planner`
- Write **partner enablement materials**: `/skill channel-enablement-kit`

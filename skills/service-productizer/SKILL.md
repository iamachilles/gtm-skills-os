---
name: service-productizer
description: Turn a service into a productized offering with fixed scope and pricing. Use when someone says "productize", "productized service", "fixed scope", "package my service", "create an offer", "standardize my service", or "turn service into product"
allowed-tools: Read, Write
metadata:
  author: Achille Morin-Lemoine
  version: "1.0.0"
---

# Service Productizer

Turn your most repeatable service into a productized offering with a fixed scope, fixed price, delivery template, and marketing copy. A productized service that requires a scoping call is not productized. The scope should be clear from the sales page.

## Inputs

- **Service to productize** (required) -- which service you deliver most repeatably
- **Past engagements** (required) -- 3+ examples of delivering this service (scope, timeline, results)
- **Target client** (required) -- who buys this service
- **Current pricing** (optional) -- how you price it today (hourly, project, retainer)

If the service or past engagements are missing, ask: "I need to know which service you want to productize and examples of past engagements. What's the most repeatable thing you do?"

## Steps

### Step 0 -- Check for Existing Output

Search the project for any existing output from a previous run of this skill (check common locations like `docs/`, the project root, or any organized output directory). If a previous version is found, present a summary and ask: "A productized offer already exists. Do you want me to (a) update it, (b) create a different package, or (c) keep it?" 

### Step 1 -- Load Context

Search the project for any available context. Look in the project root, `docs/`, or any organized directory. Read what you find:

1. **GTM Triangle** -- positioning and ICP
2. **Proposals** documents -- past engagement scopes
3. **Case studies** -- results from past engagements
4. **Positioning** documents -- personal positioning
5. `CLAUDE.md` -- project-level instructions

### Step 2 -- Identify the Most Repeatable Service

From past engagements, find the pattern:

| Engagement | Scope | Duration | Deliverables | Result |
|-----------|-------|----------|-------------|--------|
| {Client 1} | {what you did} | {time} | {outputs} | {outcome} |
| {Client 2} | {what you did} | {time} | {outputs} | {outcome} |
| {Client 3} | {what you did} | {time} | {outputs} | {outcome} |

Identify:
- What scope elements appear in every engagement? (This is your standard scope)
- What varies between engagements? (This is either customization or out of scope)
- What's the average duration? (This is your delivery timeline)

### Step 3 -- Define Standard Scope

Write the scope that applies to every client:

**What's included:**
1. {Deliverable 1}: {exactly what they get}
2. {Deliverable 2}: {exactly what they get}
3. {Deliverable 3}: {exactly what they get}

**What's NOT included:**
1. {Common ask that's out of scope}
2. {Common ask that's out of scope}

**Who this is for:**
- {Ideal client descriptor}
- {Company size/stage}
- {Specific problem they must have}

**Who this is NOT for:**
- {Disqualifying characteristic 1}
- {Disqualifying characteristic 2}

The "NOT for" list is critical. It prevents bad-fit clients from buying and being disappointed.

### Step 4 -- Set Fixed Price

Calculate based on value, not hours:

- **Your cost:** {estimated hours} x {internal rate} = ${cost}
- **Client value:** If this engagement typically produces {outcome}, it's worth ${value} to the client
- **Price:** Set between cost and value, weighted toward value

**Pricing tiers** (optional, if warranted):

| Tier | What's Included | Price |
|------|----------------|-------|
| Essential | {Core deliverables} | ${N} |
| Standard | {Core + extras} | ${N} |
| Premium | {Full package} | ${N} |

Rule: if you need a scoping call to determine the price, the service isn't productized yet. The price must be determinable from the information on the sales page.

### Step 5 -- Create Delivery Template

Write the step-by-step delivery process:

| Day/Week | Activity | Deliverable | Time Required |
|----------|----------|-------------|--------------|
| Day 1 | Kickoff call | Intake form completed | 1 hour |
| Week 1 | {Activity} | {Output} | {time} |
| Week 2 | {Activity} | {Output} | {time} |
| Week 3 | {Activity} | {Output} | {time} |
| Week 4 | Final delivery | All deliverables | 1 hour |

This template should be reusable for every client with minimal customization.

### Step 6 -- Write Marketing Copy

**Landing page headline:** {What they get + timeline}
Format: "Get {outcome} in {timeframe}"

**Subheadline:** {How, with proof}

**What you get** (bullet list of deliverables):
- {Deliverable 1}
- {Deliverable 2}
- {Deliverable 3}

**How it works** (3 steps):
1. {Step 1}: {description}
2. {Step 2}: {description}
3. {Step 3}: {description}

**Proof points:**
- "{Result}" for {client/descriptor}
- "{Result}" for {client/descriptor}

**CTA:** {Specific action}

**Outreach message** (for proactive selling, under 100 words):
- Reference the prospect's problem
- State what you deliver and in what timeframe
- Include one proof point
- CTA: reply or book a call

### Step 7 -- Define Qualification Criteria

List criteria that determine if someone is a fit:

| Criteria | Fit | Not a Fit |
|----------|-----|-----------|
| Company size | {range} | {outside range} |
| Problem | {specific problem} | {different problem} |
| Budget | {can afford fixed price} | {price-sensitive} |
| Timeline | {needs this within X months} | {no urgency} |
| Readiness | {has required inputs} | {needs prerequisite work first} |

### Step 8 -- Quality Gate

- [ ] Scope is fixed and clear (no scoping call needed)
- [ ] Price is fixed and value-based
- [ ] "Not for" criteria are defined
- [ ] Delivery template is step-by-step and reusable
- [ ] Marketing copy leads with outcome, not process
- [ ] At least 2 proof points with results
- [ ] Landing page copy can be published as-is
- [ ] No em dashes in any copy

## Output Format

Save the output to your project. Suggested filename: `productized-offer-{service-slug}.md`

```markdown
# Productized Offer: {Service Name}

Date: {Date}
Price: ${amount}
Duration: {timeline}
Status: Draft / Live

## Who This Is For
{Ideal client with specific criteria}

## Who This Is NOT For
{Disqualifying criteria}

## What You Get
{Numbered list of deliverables}

## How It Works
1. {Step 1}
2. {Step 2}
3. {Step 3}

## Delivery Template
| Week | Activity | Deliverable |
|------|----------|-------------|
| {rows} |

## Pricing
{Price with what's included/excluded}

## Marketing Copy

### Landing Page
**Headline:** {headline}
**Subheadline:** {subheadline}
**Deliverables:** {bullet list}
**How it works:** {3 steps}
**Proof:** {2-3 results}
**CTA:** {action}

### Outreach Message
{Under 100 words}

## Qualification Criteria
| Criteria | Fit | Not a Fit |
|----------|-----|-----------|
| {rows} |

## Past Engagement Reference
| Client | Result | Duration |
|--------|--------|----------|
| {rows} |
```

## Key Principles

1. **If it requires a scoping call, it's not productized.** The scope, deliverables, timeline, and price should all be clear from the sales page. A buyer should be able to say "yes" without a meeting.
2. **Price on value, not hours.** A 4-week GTM sprint that generates $200K in pipeline is not worth $5K because it took 40 hours. Price relative to the outcome.
3. **The "NOT for" list is as important as the "for" list.** Bad-fit clients who buy a productized service create scope disputes, bad reviews, and refund requests. Filter them out proactively.
4. **Repeatability is the whole point.** If every delivery is different, you haven't productized. You've just slapped a fixed price on custom work. The delivery template should work for 80%+ of clients without modification.

## Anti-Patterns

- **The disguised custom service.** Calling it "productized" but requiring a discovery call to scope each engagement. If the scope changes per client, it's not a product.
- **Pricing too low.** Productized services are often underpriced because the creator calculates hours instead of value. A $2K productized offer that delivers $50K in value is leaving money on the table.
- **No disqualification criteria.** Accepting every buyer leads to miserable engagements with bad-fit clients. Define who this is NOT for and enforce it.

## What to Do Next

- Define your **personal positioning** to market this offer: `/skill freelancer-positioning`
- Write a **case study** proving this offer works: `/skill case-study-from-engagement`
- Build a **qualification scorecard** for inbound interest: `/skill inbound-qualifier`

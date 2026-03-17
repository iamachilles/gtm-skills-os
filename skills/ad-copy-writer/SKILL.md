---
description: Write platform-specific ad copy for LinkedIn, Google, and Meta with variants and A/B test pairs. Use when someone says "write ad copy", "ad variants", "LinkedIn ads", "Google ads", "Meta ads", "Facebook ads", "ad creative", or "campaign copy"
tools: Read, Write
---

# Ad Copy Writer

Write ad copy for LinkedIn, Google, and Meta that respects each platform's character limits and native behavior. Ad copy is not miniature blog posts. Each platform has specific constraints and user behaviors that demand different approaches.

This skill produces 3 variants per platform with A/B test pair recommendations.

## Inputs

- **Persona** (required) -- who sees this ad (role, pain points, stage)
- **Offer** (required) -- what you're promoting (resource, demo, event, product)
- **Platform** (required) -- LinkedIn, Google, Meta, or all three
- **Campaign goal** (optional) -- awareness, consideration, or conversion
- **Messaging context** (optional) -- existing messaging matrix or value props

If persona, offer, or platform are missing, ask: "I need to know who this is for, what you're promoting, and which platform(s). What's the persona, the offer, and where will this run?"

## Steps

### Step 0 -- Check for Existing Output

Read `docs/content/ads-{campaign-slug}.md`. If found, ask: "Ad copy for [campaign] already exists. Do you want me to (a) add new variants, (b) update for a different audience, or (c) rebuild?"

### Step 1 -- Load Context

Read available context:

1. `docs/personas/*.md` -- target persona profile
2. `docs/messaging-matrix.md` -- messaging by persona
3. `docs/value-prop-matrix.md` -- value propositions
4. `docs/gtm-triangle.md` -- positioning
5. `CLAUDE.md` -- project-level instructions

Extract for this persona:
- Primary pain point (the ad's entry point)
- Desired outcome (what they want)
- Language they use (mirror their words, not yours)
- Objections to preempt

### Step 2 -- Write LinkedIn Ad Copy (3 variants)

**Character limits (strict):**
- Headline: 150 characters max
- Intro text: 300 characters max (before "see more")
- CTA button: select from platform options (Learn More, Sign Up, Download, etc.)

**For each variant:**
- **Headline:** Benefit-focused, specific to persona's outcome
- **Intro text:** Problem + solution + reason to act now
- **CTA:** One clear action

**Variant approaches:**
1. Pain-focused: Lead with the problem
2. Outcome-focused: Lead with the result
3. Social proof: Lead with a data point or testimonial

### Step 3 -- Write Google Ads Copy (3 variants)

**Character limits (strict):**
- Headlines: 30 characters each, 3 required
- Descriptions: 90 characters each, 2 required

**For each variant:**
- **Headline 1:** Include keyword, state the offer
- **Headline 2:** Benefit or differentiator
- **Headline 3:** CTA or urgency element
- **Description 1:** Expand on value, include proof point
- **Description 2:** Address objection, reinforce CTA

**Variant approaches:**
1. Feature-led: What you offer
2. Benefit-led: What they get
3. Urgency-led: Why act now

### Step 4 -- Write Meta Ad Copy (3 variants)

**Character limits (strict):**
- Primary text: 125 characters (visible without expanding)
- Headline: 40 characters
- Description: 30 characters (shown below headline)

**For each variant:**
- **Primary text:** Hook that stops the scroll
- **Headline:** Clear value statement
- **Description:** Supporting detail or CTA

**Variant approaches:**
1. Question hook: Ask about their pain
2. Statement hook: Bold claim with proof
3. Story hook: Mini-narrative in 125 characters

### Step 5 -- Design A/B Test Pairs

For each platform, recommend 2 A/B test pairs:

**What to test:**
- Pain vs. outcome messaging (does the problem or the solution resonate more?)
- Specific vs. broad targeting language
- Direct CTA vs. curiosity-based CTA

For each test:
- Variant A vs. Variant B (which two variants to test)
- Hypothesis (what you expect and why)
- Success metric (CTR, conversion rate, CPC)
- Minimum sample size recommendation

### Step 6 -- Quality Gate

- [ ] LinkedIn headlines are under 150 characters each
- [ ] LinkedIn intro text is under 300 characters each
- [ ] Google headlines are under 30 characters each (all 3)
- [ ] Google descriptions are under 90 characters each (both)
- [ ] Meta primary text is under 125 characters each
- [ ] Meta headlines are under 40 characters each
- [ ] 3 variants per platform
- [ ] Each variant uses a different approach (not just rewording)
- [ ] A/B test pairs have clear hypotheses
- [ ] Copy mirrors the persona's language, not internal jargon
- [ ] No em dashes

If any check fails, fix it before proceeding.

## Output Format

Save to `docs/content/ads-{campaign-slug}.md`:

```markdown
# Ad Copy: [Campaign Name]
Persona: [Persona] | Offer: [Offer] | Platforms: [Platforms] | Date: [Date]

## LinkedIn Ads
[3 variants, each with: Headline (X/150), Intro text (X/300), CTA button]
**A/B Test:** Variant [X] vs [Y] -- hypothesis, metric

## Google Ads
[3 variants, each with: H1-H3 (X/30 each), D1-D2 (X/90 each)]
**A/B Test:** [Same structure]

## Meta Ads
[3 variants, each with: Primary text (X/125), Headline (X/40), Description (X/30)]
**A/B Test:** [Same structure]

## Campaign Notes
[Budget allocation, targeting notes, creative pairing]
```

## Key Principles

1. **Character limits are non-negotiable.** Every character over the limit gets cut by the platform, often mid-sentence. Count characters before finalizing.
2. **Mirror the persona's language.** If they say "book more meetings," don't write "optimize pipeline velocity." Use the words they use.
3. **Each variant tests a different hypothesis.** Three variants that say the same thing slightly differently is not testing. Each should try a distinct approach.
4. **The ad's job is the click, not the sale.** Don't try to close in 125 characters. Create enough interest to earn the click.

## Anti-Patterns

- **The feature dump:** Listing product features in ad copy. Nobody clicks on features. They click on outcomes.
- **One-size-fits-all copy:** Using the same copy across LinkedIn, Google, and Meta. Each platform has different user behavior and character limits.
- **Testing without hypotheses:** Running A/B tests "to see what happens." Every test should have a prediction and a reason.

## What to Do Next

- Write a **landing page** for the ad destination: `/skill landing-page-copy`
- Build the **follow-up sequence** for ad responders: `/skill inbound-follow-up-sequence`
- Design the **A/B test plan** with more rigor: `/skill ab-test-designer`

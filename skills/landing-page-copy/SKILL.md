---
description: Write conversion-optimized landing page copy with all sections from hero to FAQ. Use when someone says "landing page", "landing page copy", "conversion page", "sales page", "write a landing page", or "page copy"
tools: Read, Write
---

# Landing Page Copy

Write conversion-optimized landing page copy section by section. A landing page is a single-purpose page with one goal: get the visitor to take one action. Every section either builds toward that action or is wasted space.

The quality gate for this skill is brutally simple: read the hero headline. If it could apply to any product in the industry, rewrite it.

## Inputs

- **Persona** (required) -- who lands on this page (role, pain, stage)
- **Offer** (required) -- what you're offering (product, service, resource, demo)
- **Messaging context** (optional) -- messaging matrix, value props, positioning
- **Social proof** (optional) -- testimonials, case studies, logos
- **Page goal** (optional) -- primary conversion action (default: book a call)

If persona or offer are missing, ask: "I need to know who this page is for and what you're offering. What's the persona and the offer?"

## Steps

### Step 0 -- Check for Existing Output

Read `docs/content/landing-page-{offer-slug}.md`. If found, ask: "Landing page copy for [offer] already exists. Do you want me to (a) revise specific sections, (b) change the persona angle, or (c) rewrite?"

### Step 1 -- Load Context

Read all available context:

1. `docs/personas/*.md` -- target persona profile
2. `docs/messaging-matrix.md` -- messaging by persona
3. `docs/value-prop-matrix.md` -- features, benefits, value
4. `docs/gtm-triangle.md` -- market positioning
5. `docs/case-studies/*.md` -- proof points
6. `CLAUDE.md` -- project-level instructions

Extract for this persona:
- Their primary pain (the page's emotional entry point)
- Their desired outcome (what they're really buying)
- Their objections (what stops them from converting)
- Their language (mirror their words throughout the page)

### Step 2 -- Write the Hero Section

**Headline** (under 12 words)
- State the outcome, not the product
- Be specific to this persona
- Bad: "The All-in-One GTM Platform"
- Good: "Book 3x More Meetings Without Hiring More SDRs"

**Subheadline** (under 25 words)
- Explain how, briefly
- Add specificity the headline can't carry
- "We build your outbound engine so your team focuses on closing, not prospecting."

**CTA button** (under 5 words)
- Action-oriented, specific to the offer
- "Book a Strategy Call" not "Submit" or "Learn More"

**Supporting element:**
- What visual or proof point sits next to the CTA
- Dashboard screenshot, result metric, or trust badges

### Step 3 -- Write the Problem Section

3 pain points in the buyer's language:

For each pain point:
- **Header:** The pain stated as they'd describe it (not your diagnosis)
- **Detail:** 1-2 sentences expanding on the impact
- **Cost:** What this pain costs them (time, money, opportunity)

The problem section earns the right to present the solution. Skip it and the solution feels like a sales pitch. Include it and the solution feels like relief.

### Step 4 -- Write Solution + How It Works + Features

**Solution section:** What you do, not how. Headline reframes the problem as solved. 2-3 sentences on approach. One key differentiator.

**How It Works:** 3 steps. Always 3. Each with title (under 6 words), description, and outcome.

**Features/Benefits:** 4-6 features, each paired with an outcome. Lead with the benefit, support with the feature. No feature without a "so that you can..." outcome.

### Step 5 -- Write Social Proof + CTA + FAQ

**Social Proof:** Testimonial (under 50 words, specific outcomes, name/title/company), case study one-liner, client logos (4-6), trust numbers.

**CTA Section:** Restate promise (different words than hero), 1-2 sentences on "why now," same CTA button as hero, objection handler below button ("No commitment required").

**FAQ:** 5 questions addressing real objections: pricing, time commitment, differentiation, results timeline, risk. Each answer 2-3 sentences, direct, no hedging.

### Step 6 -- Quality Gate

- [ ] Hero headline could NOT apply to any competitor (it's specific)
- [ ] Hero headline states an outcome, not a product description
- [ ] Problem section uses the buyer's language, not internal jargon
- [ ] Solution section focuses on what, not how
- [ ] How It Works has exactly 3 steps
- [ ] Every feature has a corresponding outcome
- [ ] Social proof includes specific results, not just praise
- [ ] CTA appears at least twice (hero and CTA section)
- [ ] FAQ addresses the top 5 real objections
- [ ] The page has one goal and one CTA (not three different offers)
- [ ] No em dashes

If any check fails, fix it before proceeding.

## Output Format

Save to `docs/content/landing-page-{offer-slug}.md`:

```markdown
# Landing Page: [Offer Name]
Persona: [Target persona] | Offer: [What's offered] | Goal: [Conversion action] | Date: [Date]

## Hero
**Headline:** [Text] | **Subheadline:** [Text] | **CTA:** [Button] | **Visual:** [What to show]

## Problem
[3 pain points, each with header, detail, and cost]

## Solution
**Headline:** [Text] -- [Description + differentiator]

## How It Works
1. **[Step]** -- [Outcome] | 2. **[Step]** -- [Outcome] | 3. **[Step]** -- [Outcome]

## Features/Benefits
| Feature | Outcome |
|---|---|
[4-6 rows]

## Social Proof
[Testimonial quote + attribution] | [Case study one-liner] | [Logos]

## CTA
**Headline:** [Text] | **CTA:** [Button] | **Objection handler:** [Small text]

## FAQ
[5 Q&As addressing real objections]

## Page Notes
[Above the fold guidance, A/B test suggestion, mobile notes]
```

## Key Principles

1. **One page, one goal, one CTA.** The moment a landing page offers two options, conversion drops. Every element points to one action.
2. **The hero headline is the page.** 80% of visitors only read the headline. If it doesn't communicate the value, nothing else matters.
3. **Problem before solution.** The visitor needs to feel understood before they'll trust your solution. The problem section is not optional.
4. **Proof is the closer.** Social proof does what your copy can't: it removes self-interest from the claim. Specific results from real people beat any headline.
5. **FAQ is objection handling.** The FAQ section is where conversions that almost happened get saved. Address real concerns, not softball questions.

## Anti-Patterns

- **The feature tour landing page:** Every section describes a feature without connecting it to an outcome. Features don't convert. Outcomes do.
- **The generic hero:** "We help companies grow." This could be any company in any industry. If a competitor could use your headline, it's not specific enough.
- **Multiple CTAs competing:** "Book a demo," "Download the guide," "Watch the video," and "Start free trial" on the same page. Pick one. Optimize for one.

## What to Do Next

- Write **ad copy** that drives traffic to this page: `/skill ad-copy-writer`
- Build the **follow-up sequence** for conversions: `/skill inbound-follow-up-sequence`
- Collect **testimonials** to strengthen the social proof: `/skill social-proof-collector`

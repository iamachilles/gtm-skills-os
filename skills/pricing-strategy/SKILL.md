---
description: Design pricing and packaging strategy with model selection, tier structure, and competitive anchoring. Use when someone says "pricing strategy", "pricing model", "how to price", "packaging and pricing", "tier pricing", or "price our product"
tools: Read, Write, WebSearch
---

# Pricing Strategy

Design a pricing and packaging strategy that aligns price with value delivered. Good pricing is the fastest lever for revenue growth, and the most commonly neglected. Most B2B companies price by copying competitors or picking a round number. This skill builds pricing from value metrics, validates against the market, and designs tier structures that drive expansion.

This is strategic pricing design, not a pricing calculator. The output is a pricing framework with rationale, tier structure, feature gates, and a migration plan if you're changing existing pricing.

## Inputs

- **Product/service description** (required) -- what you sell, key features, how it's delivered
- **Current pricing** (optional) -- existing pricing model, tiers, and rates
- **Value proposition matrix** (required) -- what value each feature delivers to each persona
- **ICP and customer segments** (required) -- who buys, at what deal sizes, with what usage patterns
- **Competitive pricing data** (optional) -- how competitors price (from pricing-analyzer or research)
- **Unit economics** (optional) -- COGS, margin targets, LTV goals

If product description or ICP is missing, ask: "I need to understand what you sell and who buys it to design pricing. Can you share your product overview and ICP definition?"

## Steps

### Step 0 -- Check for Existing Output

Read `docs/pricing-strategy.md` if it exists. If found, present a summary and ask: "A pricing strategy already exists with [current model/tiers]. Do you want me to (a) optimize the current structure, (b) evaluate a different pricing model, or (c) redesign from scratch?"

### Step 1 -- Load Context

Read all available context:

1. `docs/pricing-analysis.md` -- competitive pricing landscape if available
2. `docs/value-prop-matrix.md` -- value delivered per feature per persona
3. `docs/gtm-triangle.md` or `docs/icp.md` -- customer segments and their characteristics
4. `docs/personas/*.md` -- who makes the buying decision and what they value
5. `CLAUDE.md` -- project-level instructions

### Step 2 -- Research Pricing Landscape

Use WebSearch to understand how the market prices:

- `"{product category}" pricing OR "how much does" "{product type}" cost` -- what buyers expect to pay
- `"{competitor 1}" pricing page OR pricing model` -- direct competitor pricing
- `"{competitor 2}" pricing tiers` -- tier structures in the market
- `"{product category}" "pricing model" "per seat" OR "usage based" OR "flat rate"` -- common models in the category
- `"{product category}" pricing trends 2025 2026` -- where pricing is headed

Document findings. If WebSearch returns nothing for a query, write "Not found." Never invent competitor pricing data.

### Step 3 -- Identify the Value Metric

The value metric is what drives your pricing. It's the unit that scales with the value the customer receives. Getting this right is the single most important pricing decision.

Evaluate candidates:

| Value Metric Candidate | Scales with Value? | Easy to Understand? | Predictable for Buyer? | Grows with Usage? |
|----------------------|-------------------|--------------------|-----------------------|-------------------|
| Per seat/user | [Yes/No] | [Yes/No] | [Yes/No] | [Yes/No] |
| Per usage unit | [Yes/No] | [Yes/No] | [Yes/No] | [Yes/No] |
| Per outcome | [Yes/No] | [Yes/No] | [Yes/No] | [Yes/No] |
| Flat rate | [Yes/No] | [Yes/No] | [Yes/No] | [Yes/No] |
| Hybrid | [Yes/No] | [Yes/No] | [Yes/No] | [Yes/No] |

Selection criteria:
- The value metric must scale with the value the customer receives (if they get more value, they pay more)
- It must be easy for the buyer to understand and predict their costs
- It must naturally grow as the customer's usage and success increase
- It must be measurable and auditable

Recommend one primary value metric with rationale.

### Step 4 -- Choose Pricing Model

Based on the value metric, recommend a pricing model:

**Per-Seat:** Best when value scales with the number of users. Simple to understand. Risk: low adoption if seats are expensive.

**Usage-Based:** Best when value scales with volume (API calls, records, events). Aligns cost with value. Risk: unpredictable revenue and buyer budget anxiety.

**Flat-Rate:** Best for simplicity and predictability. Works for horizontal tools with consistent value. Risk: no expansion revenue.

**Hybrid (Platform Fee + Usage):** Best when there's baseline value plus variable usage. Combines revenue predictability with growth upside. Risk: complexity in the buying decision.

**Outcome-Based:** Best when outcomes are measurable and attributable. Highest alignment with value. Risk: hard to implement and track.

Write a 2-3 paragraph rationale for the chosen model, addressing:
- Why this model best aligns with how customers get value
- How it compares to competitive models
- What risks it introduces and how to mitigate them

### Step 5 -- Design Tier Structure

Design 3 tiers following the Good/Better/Best pattern. Each tier should:
- Serve a different segment of your ICP
- Have a clear upgrade trigger (what makes a customer outgrow this tier?)
- Include a flagship feature that justifies the price jump

| | Starter | Growth | Enterprise |
|---|---------|--------|-----------|
| **Target segment** | [Who this tier serves] | [Who] | [Who] |
| **Value metric** | [Volume/seats included] | [Volume/seats] | [Volume/seats] |
| **Price** | [$ amount] | [$ amount] | [Custom / Contact us] |
| **Key features** | [List] | [Everything in Starter +] | [Everything in Growth +] |
| **Feature gates** | [What's excluded] | [What's excluded] | [Nothing excluded] |
| **Support level** | [Self-serve / Email] | [Priority / Chat] | [Dedicated CSM] |
| **Upgrade trigger** | [What makes them need Growth] | [What makes them need Enterprise] | -- |

Hard cap: 3 tiers maximum for the main structure. Add-ons or modules are separate.

### Step 6 -- Set Feature Gates

For each feature, decide which tier includes it:

| Feature | Starter | Growth | Enterprise | Gate Rationale |
|---------|---------|--------|-----------|----------------|
| [Feature 1] | Yes | Yes | Yes | [Why it's in all tiers] |
| [Feature 2] | No | Yes | Yes | [Why it's gated to Growth+] |
| [Feature 3] | No | No | Yes | [Why it's Enterprise only] |

Feature gating rules:
- Core features that deliver the basic promise go in Starter
- Features that enable scaling or advanced use cases go in Growth
- Features that require custom implementation or high-touch support go in Enterprise
- Never gate features that are needed to evaluate the product. Trial must include enough to demonstrate value.

### Step 7 -- Competitive Anchoring

Position your pricing relative to alternatives:

| Solution | Price Point | Model | Your Position |
|----------|-----------|-------|---------------|
| [Competitor 1] | [Price] | [Model] | [Above / At / Below] |
| [Competitor 2] | [Price] | [Model] | [Above / At / Below] |
| [DIY / Status quo] | [Estimated cost] | [Time + tools] | [Position] |

Write a 1-2 paragraph positioning statement that explains where you sit and why:
- If premium: what additional value justifies the higher price?
- If parity: what differentiator wins deals at the same price?
- If lower: what efficiency allows you to charge less without sacrificing margins?

### Step 8 -- Migration Plan (If Changing Pricing)

If this is a pricing change, define:

**Communication Plan:**
- When to announce (lead time before change)
- How to communicate (email, in-app, call for key accounts)
- How to position the change (value added, not price increase)

**Grandfathering Policy:**
- How long existing customers keep current pricing
- What triggers move to new pricing (renewal, expansion, new contract)
- What happens to mid-contract customers

**Risk Mitigation:**
- Expected churn impact (which customers might leave?)
- Revenue impact model (short-term loss vs. long-term gain)
- Rollback criteria (what signals indicate the change isn't working?)

If this is new pricing (no existing customers), skip this step.

### Step 9 -- Quality Gate

Run these checks before saving:

- [ ] Value metric is explicitly chosen with rationale (not defaulting to per-seat because everyone does it)
- [ ] Pricing model rationale addresses why alternatives were rejected
- [ ] Tier structure has exactly 3 tiers with clear upgrade triggers between each
- [ ] Feature gates have rationale for each gating decision
- [ ] Competitive anchoring includes at least 2 alternatives (competitor + status quo)
- [ ] Price points are justified by value delivered, not just competitive matching
- [ ] If migration plan is needed, it addresses grandfathering, communication, and risk
- [ ] The pricing would make sense to a buyer evaluating it on a pricing page

If any check fails, fix it before proceeding.

## Output Format

Save to `docs/pricing-strategy.md`:

```markdown
# Pricing Strategy: [Company/Product Name]
Date: [Date]

## Executive Summary
[3-4 sentences: chosen model, value metric, tier structure, and competitive position]

## Value Metric
**Primary metric:** [What drives pricing]
**Rationale:** [Why this metric aligns with value delivery]

## Pricing Model
**Model:** [Per-seat / Usage / Flat / Hybrid / Outcome]
**Rationale:** [2-3 paragraphs on why this model was chosen]

## Tier Structure

### Starter -- $[price]/[unit]
- **Target:** [Segment]
- **Includes:** [Key features and limits]
- **Upgrade trigger:** [What pushes to Growth]

### Growth -- $[price]/[unit]
- **Target:** [Segment]
- **Includes:** [Everything in Starter + key additions]
- **Upgrade trigger:** [What pushes to Enterprise]

### Enterprise -- Custom
- **Target:** [Segment]
- **Includes:** [Everything in Growth + key additions]

## Feature Gate Matrix
| Feature | Starter | Growth | Enterprise | Rationale |
|---------|---------|--------|-----------|-----------|
| ... | ... | ... | ... | ... |

## Competitive Positioning
| Solution | Price | Model | Our Position |
|----------|-------|-------|-------------|
| ... | ... | ... | ... |

[Positioning narrative paragraph]

## Migration Plan
[If applicable: communication, grandfathering, risk mitigation]

## Open Questions
[Decisions that need customer data or executive input to finalize]
```

## Key Principles

1. **Price to value, validate against market.** Start with what your product is worth to the buyer, then check if the market supports that price. Never start with competitors.
2. **The value metric is the most important decision.** Everything else (tiers, gates, pricing) flows from choosing the right unit of value.
3. **Tier upgrades should feel natural.** If a customer has to think hard about whether they need the next tier, the upgrade trigger is too vague.
4. **Pricing is a growth lever, not a cost exercise.** Good pricing drives expansion revenue, not just initial sale.
5. **Simple wins.** If a buyer can't understand your pricing in 30 seconds on a pricing page, it's too complicated.

## Anti-Patterns

- **Competitor-matching pricing:** Copying competitor prices without understanding if you deliver the same, more, or less value. This is a race to the bottom.
- **Too many tiers or add-ons:** If the pricing page needs a comparison calculator, it's too complex. Three tiers, clearly differentiated.
- **Gating core value:** Putting the primary value proposition behind the highest tier. Starter must deliver enough value to prove the product works.

## What to Do Next

- Write **proposals** using the pricing structure: `/skill proposal-writer`
- Build **landing page copy** for the pricing page: `/skill landing-page-copy`
- Create a **deal desk playbook** for handling pricing negotiations: `/skill deal-desk-playbook`

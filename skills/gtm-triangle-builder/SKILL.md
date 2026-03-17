---
description: Build a complete GTM Triangle with positioning, ICPs, personas, value mapping, and channels
tools: Read, Write, WebFetch, WebSearch
---

# GTM Triangle Builder

Build the full GTM Triangle, the foundational strategic document that aligns positioning, audience, messaging, and channels into a single coherent system. Every downstream GTM activity (outbound, content, campaigns, sales enablement) pulls from this document.

The GTM Triangle has 5 interconnected sections. Each must be internally consistent. If the positioning says one thing but the personas care about something else, the triangle is broken.

## Inputs

- **Company name and website** (required) — for context and current positioning analysis
- **Product/service description** (required) — what they sell, how it works, key capabilities
- **Existing customers** (optional) — examples of current customers, deal sizes, use cases
- **Founder/team context** (optional) — background that informs credibility and positioning
- **Market context** (optional) — trends, competitive landscape, recent changes

## Steps

### Step 1 — Gather Company Context

Read all provided materials. Use WebFetch to scrape the company website (homepage, product pages, about page, case studies). Use WebSearch to find recent press, funding, market context, and competitive landscape.

Build a working understanding of:
- What the company actually does (not just what the website says)
- Who their best customers are and why they buy
- What makes them different from alternatives
- What market change is creating the opportunity

### Step 2 — Analyze Existing Customers (If Available)

If customer examples are provided, look for patterns:
- Company size, industry, and stage
- Which persona initiated the purchase
- What problem they were solving
- What results they achieved
- How long the sales cycle was

These patterns are the empirical foundation for ICP and persona work. Prioritize real customer data over theoretical segmentation.

### Step 3 — Research Market Dynamics

Use WebSearch to understand:
- What's changing in the market that creates urgency
- What alternatives exist (competitors, DIY, status quo)
- What industry analysts or thought leaders are saying
- What buyers are searching for and discussing

### Step 4 — Build Positioning Statement

Use the Market Change, Thesis, Proof framework:

- **Market Change:** What fundamental shift is happening that makes the old way insufficient? This should be an observable, undeniable trend. Not "the market is growing" but "buyer expectations shifted from annual contracts to usage-based pricing, breaking traditional billing systems."

- **Thesis:** Given this change, what do you believe must be true? This is your opinionated point of view. Not "we help companies grow" but "companies that instrument their product-led funnel with revenue data will outperform those running sales and product as separate silos."

- **Proof:** What evidence supports your thesis? Customer results, market data, case studies, your own track record. Specific numbers over vague claims.

Write the positioning statement as a concise paragraph that connects all three elements.

### Step 5 — Define ICP with Tiered Segments

Create 2-3 ICP tiers:

**Tier 1 (Primary):** The ideal customer profile. Highest win rate, fastest sales cycle, best retention. Define:
- Industry/vertical
- Company size (revenue and/or headcount)
- Stage/maturity
- Geographic focus (if relevant)
- Qualifying characteristics (what makes them ideal beyond firmographics)
- Disqualifiers (what rules them out)

**Tier 2 (Secondary):** Good customers but not ideal. Longer sales cycle or lower ACV. Define the same attributes.

**Tier 3 (Opportunistic):** Worth pursuing if they come inbound but not worth outbound effort. Define boundaries.

### Step 6 — Build 3-5 Buyer Persona Profiles

For each key persona in the buying committee, create:

- **Title examples** — 3-5 common titles this persona holds
- **Reports to** — who they answer to
- **KPIs they own** — the metrics they're measured on
- **Day-to-day reality** — what their actual work looks like
- **Core pain points** — problems they experience in their own language
- **Goals and aspirations** — what success looks like to them personally
- **How they evaluate solutions** — what criteria matter most
- **Common objections** — what pushback they'll give
- **Preferred channels** — where they consume information and can be reached

### Step 7 — Create Feature/Benefit/Value Mapping

Build a table with 5+ rows connecting features to business outcomes:

| Feature | Benefit | Value |
|---------|---------|-------|
| [What it does] | [What it enables] | [Why it matters to the business] |

- **Feature:** A capability of the product (factual, observable)
- **Benefit:** What that capability enables the user to do differently
- **Value:** The business outcome or metric impact (revenue, cost, time, risk)

Each row should be independently compelling. The value column must connect to a KPI that a decision-maker cares about.

### Step 8 — Select Channels with Effort/Impact Scoring

Evaluate potential channels for reaching the defined personas:

| Channel | Effort (1-5) | Impact (1-5) | Priority | Notes |
|---------|-------------|-------------|----------|-------|
| LinkedIn outbound | ... | ... | ... | ... |
| Cold email | ... | ... | ... | ... |
| Content/SEO | ... | ... | ... | ... |
| Events/conferences | ... | ... | ... | ... |
| Partnerships | ... | ... | ... | ... |
| Paid ads | ... | ... | ... | ... |
| Community | ... | ... | ... | ... |

Score effort (1 = easy to execute, 5 = heavy lift) and impact (1 = low expected ROI, 5 = high expected ROI). Prioritize high-impact, low-effort channels first.

### Step 9 — Validate Internal Consistency

Review the complete triangle and check:
- Does the positioning speak to the pain points of the defined personas?
- Are the ICP tiers consistent with the customer evidence?
- Does the feature/benefit/value mapping address the persona KPIs?
- Are the selected channels appropriate for reaching these personas?
- Would each persona recognize themselves in the description?

Flag and fix any inconsistencies before finalizing.

## Output Format

Write a single GTM Triangle document:

```
# GTM Triangle: [Company Name]
Date: [Date]

## 1. Positioning
### Market Change
### Thesis
### Proof
### Positioning Statement

## 2. ICP Definition
### Tier 1 — [Segment Name]
### Tier 2 — [Segment Name]
### Tier 3 — [Segment Name]

## 3. Buyer Personas
### [Persona 1 — e.g., "The VP of Sales"]
### [Persona 2 — e.g., "The Revenue Ops Manager"]
### [Persona 3 — e.g., "The CFO"]

## 4. Feature/Benefit/Value Map
[Table]

## 5. Channel Strategy
[Scored table + recommended sequence]
```

## Quality Checks

- Positioning uses the Market Change / Thesis / Proof framework. No generic mission statements.
- ICP has at least 2 tiers with clear boundaries between them. Disqualifiers are included.
- At least 3 personas are defined with all required fields. No placeholder profiles.
- Feature/Benefit/Value table has 5+ rows. The value column references specific business metrics.
- Channel strategy is scored and prioritized, not just a list.
- Internal consistency is validated. Positioning, personas, and value mapping all tell the same story.
- Language is specific to this company and market. Nothing that could apply to any B2B company.

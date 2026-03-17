---
description: Define or redefine your competitive category. Use when someone says "category design", "create a category", "define our category", "category of one", "redefine the market", "category creation", or "what category are we in"
tools: Read, Write, WebSearch
---

# Category Designer

Define or redefine the competitive category your product lives in. Category design is the most leveraged strategic move in GTM: if you define the category, you define the criteria for winning. If someone else defines it, you're playing their game by their rules.

This skill helps you evaluate whether the existing category serves you, and if not, design a new one with a name, definition, membership criteria, "why now" narrative, and proof points. Not every company needs a new category. Sometimes the right move is to claim leadership in an existing one. This skill helps you make that call.

## Inputs

- **Company name and product** (required) -- what you sell and how it works
- **Current category** (required) -- what buyers call your space today (e.g., "sales engagement platform")
- **Market context** (optional) -- trends, shifts, competitive dynamics
- **GTM Triangle** (optional) -- positioning, ICP, and persona context
- **Competitor landscape** (optional) -- who else is in this space and how they position

If company or current category is missing, ask: "I need your company name and the category buyers currently place you in. What's your product and what do people compare you to?"

## Steps

### Step 0 -- Check for Existing Output

Read `docs/category-design.md` if it exists. If found, present a summary and ask: "A category design document already exists for '[category name]'. Do you want me to (a) refine the category definition, (b) evaluate a different category angle, or (c) rebuild from scratch?"

### Step 1 -- Load Context

Read all available context:

1. `docs/gtm-triangle.md` -- current positioning and market change narrative
2. `docs/competitor-analysis.md` -- competitive landscape
3. `docs/value-prop-matrix.md` -- what makes you different
4. `CLAUDE.md` -- project-level instructions

### Step 2 -- Research Existing Category Landscape

Use WebSearch to understand the current category:

- `"{current category}" market size OR "market report"` -- how analysts define the space
- `"{current category}" leaders OR "magic quadrant" OR "wave"` -- who owns the current category
- `"{product type}" category OR "what category"` -- how buyers and analysts classify products like yours
- `"{company name}" vs "{competitor}" comparison` -- how people compare you
- `"{current category}" "new approach" OR "rethinking" OR "evolution"` -- signals of category evolution

Document:
- Who the current category leaders are
- How analysts define the category criteria
- Whether the category is growing, mature, or declining
- How buyers search for solutions in this space

If WebSearch returns nothing relevant for a query, write "Not found." Never invent market data.

### Step 3 -- Evaluate Category Fit

Answer these diagnostic questions:

1. **Are you winning in the current category?** If you're already a recognized leader, redefining may be unnecessary.
2. **Does the current category criteria favor your strengths?** If the buying criteria (e.g., feature count, integrations, price) play to your weaknesses, the category is working against you.
3. **Is the category crowded with similar messaging?** If every competitor says the same thing, differentiation is impossible within the current frame.
4. **Has the market shifted in a way the current category doesn't capture?** If buyer needs have evolved but the category label hasn't, there's an opening.
5. **Can you credibly define a new space?** New categories require thought leadership, market education, and patience. Do you have the resources?

Based on answers, make a recommendation:
- **Claim existing category:** You're well-positioned to win on current criteria
- **Subcategory:** Create a recognized niche within the existing space (e.g., "revenue intelligence" within "sales technology")
- **New category:** The existing frame doesn't serve you, and a market shift justifies a new definition

### Step 4 -- Design the Category (If New or Subcategory)

If recommending a new or subcategory, build five components:

**Category Name**
- 2-4 words that are descriptive, memorable, and searchable
- Must be self-explanatory to someone who's never heard it
- Test: could a buyer search this term and understand what they'd find?
- Generate 3-5 candidates and evaluate each

**Category Definition** (1 sentence, max 25 words)
- What this category is, in plain language
- Must be broad enough that other companies could belong, narrow enough to be meaningful

**Membership Criteria** (3-5 attributes)
- What makes a product belong in this category vs. not
- These criteria should naturally favor your strengths
- At least one criterion should disqualify your main competitors

**"Why Now" Narrative** (2-3 paragraphs)
- What market shift is creating this category
- Why the old category no longer serves buyers
- What's changed in technology, buyer behavior, or market dynamics
- This must be grounded in observable trends, not wishful thinking

**Proof Points** (3 minimum)
- Evidence that this category is real and emerging
- Can include: customer adoption, analyst mentions, search trend data, conference talk topics, job posting trends, funding patterns

### Step 5 -- Competitive Positioning Within Category

Map key players against the new category criteria:

| Company | Criterion 1 | Criterion 2 | Criterion 3 | Category Fit |
|---------|-------------|-------------|-------------|-------------|
| You | Yes/No | Yes/No | Yes/No | Full fit |
| Competitor A | Yes/No | Yes/No | Yes/No | Partial |
| Competitor B | Yes/No | Yes/No | Yes/No | No fit |

The goal is not to exclude all competitors (that makes the category too narrow) but to demonstrate that you best embody the category definition.

### Step 6 -- Category Activation Plan

Outline how to establish the category in the market:
- **Thought leadership:** What content to create (research reports, frameworks, definitions)
- **Analyst relations:** Which analysts to brief and with what story
- **Community building:** How to rally practitioners around the category
- **Content SEO:** What terms to own in search
- **Sales enablement:** How sales positions the category in conversations

### Step 7 -- Quality Gate

Run these checks before saving:

- [ ] Category name is 2-4 words and self-explanatory
- [ ] Category definition is one sentence, under 25 words
- [ ] At least 3 membership criteria are defined
- [ ] At least one criterion naturally disqualifies the dominant competitor
- [ ] "Why now" narrative references observable market shifts, not aspirational claims
- [ ] At least 3 proof points support the category's emergence
- [ ] At least 2 other companies could plausibly belong in the category (a category of one is not a category)
- [ ] The category would make sense to a buyer who's never heard of your company

If any check fails, fix it before proceeding.

## Output Format

Save to `docs/category-design.md`:

```markdown
# Category Design: [Category Name]
Date: [Date]

## Executive Summary
[2-3 sentences: what the category is, why it's emerging, and where you sit]

## Category Assessment
### Current Category: [Existing category name]
- Category leaders: [Who owns it today]
- Category criteria: [What defines membership]
- Fit evaluation: [Why it does/doesn't serve you]

### Recommendation
[Claim existing / Create subcategory / Define new category -- with rationale]

## New Category Definition

### Name
**[Category Name]**

### Definition
[One sentence, max 25 words]

### Membership Criteria
1. [Criterion 1]
2. [Criterion 2]
3. [Criterion 3]
4. [Criterion 4] (if applicable)
5. [Criterion 5] (if applicable)

### "Why Now" Narrative
[2-3 paragraphs on the market shift creating this category]

### Proof Points
1. [Evidence 1]
2. [Evidence 2]
3. [Evidence 3]

## Competitive Map

| Company | [Criterion 1] | [Criterion 2] | [Criterion 3] | Category Fit |
|---------|---------------|---------------|---------------|-------------|
| [You] | ... | ... | ... | Full |
| [Competitor A] | ... | ... | ... | Partial |
| [Competitor B] | ... | ... | ... | ... |

## Category Activation Plan
### Thought Leadership
[What to create]

### Analyst Relations
[Who to brief]

### Community
[How to rally practitioners]

### Search & Content
[Terms to own]

### Sales Enablement
[How to position in conversations]

## Alternative Category Names Considered
| Name | Pros | Cons | Verdict |
|------|------|------|---------|
| [Name 1] | ... | ... | Selected / Rejected |
| [Name 2] | ... | ... | ... |
| [Name 3] | ... | ... | ... |
```

## Key Principles

1. **Categories are about the buyer, not the vendor.** A category only exists if buyers use it to make purchase decisions. If only your marketing team uses the term, it's not a category.
2. **The best category design is invisible.** When done well, people think the category always existed. It feels obvious, not invented.
3. **A category of one is not a category.** If no other company could plausibly belong, you've defined a product, not a category.
4. **Category criteria must favor you, but not exclusively.** The goal is to set criteria where you're the best fit, not the only fit.
5. **"Why now" is the most important section.** Without a credible market shift driving the category's emergence, it's just a rebrand.

## Anti-Patterns

- **Vanity categories:** Inventing a category just to be "the leader" in something nobody cares about. The category must solve a real buyer navigation problem.
- **Feature-based categories:** "AI-powered sales automation" is a feature description, not a category. Categories describe outcomes or approaches.
- **Category as marketing campaign:** A new category requires sustained investment in education, content, and community. If you're not willing to invest 12+ months, don't start.

## What to Do Next

- Feed the category definition back into your **GTM Triangle** positioning: `/skill gtm-triangle-builder`
- Build **messaging** that introduces the category to buyers: `/skill messaging-matrix`
- Create **thought leadership content** that establishes the category: `/skill write-linkedin-post`

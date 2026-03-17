---
description: Map existing content to buying stages and personas for ABM campaigns. Use when someone says "content map", "content mapping", "ABM content", "content gap analysis", "buying stage content", or "content inventory"
tools: Read, Write
---

# ABM Content Mapper

Map your content inventory to a 4-stage buying journey (Awareness, Consideration, Decision, Expansion) crossed with your personas. The output shows exactly what content you have for each cell, where the gaps are, and what to create first.

Without a content map, teams either create duplicate content or leave critical gaps. The most common gap: plenty of awareness content, almost nothing for Decision stage. This skill makes that visible.

## Inputs

- **Content inventory** (required) -- list of existing content assets (blog posts, case studies, whitepapers, videos, etc.)
- **Personas** (required) -- buying committee roles to map against
- **Current ABM campaign** (optional) -- if mapping for a specific campaign
- **Prioritization criteria** (optional) -- what matters most (tier, persona, stage)

If content inventory is missing, ask: "I need a list of your existing content assets. Do you have a content library, or should I inventory what's in docs/content/?"

## Steps

### Step 0 -- Check for Existing Output

Read `docs/content/abm-content-map.md` if it exists. If found, present a summary and ask: "A content map already exists with {N} assets mapped. Do you want me to (a) add new assets, (b) re-prioritize gaps, or (c) rebuild from scratch?"

### Step 1 -- Load Context

Read all available context:

1. `docs/personas/*.md` -- persona definitions
2. `docs/content/` -- existing content assets
3. `docs/sales/abm-campaign-*.md` -- active ABM campaigns
4. `docs/messaging-matrix.md` -- messaging by persona x pillar
5. `CLAUDE.md` -- project-level instructions

### Step 2 -- Inventory Existing Content

Catalog every content asset with:

- **Title** -- name of the piece
- **Type** -- blog post, case study, whitepaper, video, webinar, one-pager, infographic, email template
- **Topic** -- what it covers
- **Target persona** -- who it's written for (may be multiple)
- **Buying stage** -- where it fits in the journey

Classify each asset into one of four stages:

- **Awareness:** Educates on the problem or trend. No product mention. Thought leadership, benchmark reports, industry insights.
- **Consideration:** Compares approaches or solutions. Light product context. How-to guides, comparison frameworks, ROI models.
- **Decision:** Enables purchase decision. Product-specific. Case studies, demos, pricing, implementation guides, proposals.
- **Expansion:** Supports existing customers. Best practices, advanced use cases, success stories, upgrade paths.

### Step 3 -- Build the Content Map Matrix

Create a matrix of Personas (columns) x Buying Stages (rows):

For each cell, list the content assets that apply. Mark cells with:
- **Strong (3+):** Well-covered, multiple assets available
- **Adequate (1-2):** Some coverage, could be stronger
- **Gap (0):** No content exists for this persona x stage combination

### Step 4 -- Identify and Prioritize Gaps

Rank content gaps by impact:

**Priority 1 (Create immediately):**
- Decision-stage gaps for Tier 1 personas (these block deals)
- Consideration-stage gaps for primary personas

**Priority 2 (Create next):**
- Awareness-stage gaps for key personas
- Decision-stage content for secondary personas

**Priority 3 (Create when possible):**
- Expansion-stage content
- Content for Tier 3 personas

For each gap, specify: what to create, format, estimated effort, and which campaign it supports.

### Step 5 -- Recommend Content for Active Campaigns

If an active ABM campaign exists, map which content to use at each campaign stage:

- Weeks 1-2 (Awareness phase): These specific assets
- Weeks 3-4 (Consideration phase): These specific assets
- Weeks 5-8 (Decision phase): These specific assets

Flag any campaign stage that has no supporting content.

### Step 6 -- Quality Gate

- [ ] Every existing content asset is classified by stage and persona
- [ ] The matrix covers all personas x all 4 stages
- [ ] Gaps are explicitly identified, not just implied by empty cells
- [ ] Priority ranking is based on business impact, not ease of creation
- [ ] Each gap has a specific content recommendation (not just "need something here")
- [ ] Content classifications are accurate (a product demo is Decision, not Awareness)

If any check fails, fix it before proceeding.

## Output Format

Save to `docs/content/abm-content-map.md`:

```markdown
# ABM Content Map
Date: {Date}
Total Assets: {N}
Gaps Identified: {N}

## Content Matrix

| Stage | {Persona 1} | {Persona 2} | {Persona 3} |
|-------|-------------|-------------|-------------|
| Awareness | {Asset list or GAP} | {Asset list or GAP} | {Asset list or GAP} |
| Consideration | {Asset list or GAP} | {Asset list or GAP} | {Asset list or GAP} |
| Decision | {Asset list or GAP} | {Asset list or GAP} | {Asset list or GAP} |
| Expansion | {Asset list or GAP} | {Asset list or GAP} | {Asset list or GAP} |

## Coverage Summary
- **Strong:** {N} cells with 3+ assets
- **Adequate:** {N} cells with 1-2 assets
- **Gap:** {N} cells with 0 assets

## Gap Prioritization

### Priority 1 -- Create Immediately
| Gap | Persona | Stage | Recommended Content | Format | Effort |
|-----|---------|-------|-------------------|--------|--------|

### Priority 2 -- Create Next
[Same table]

### Priority 3 -- Create When Possible
[Same table]

## Full Content Inventory
| Asset | Type | Persona | Stage | Campaign Use |
|-------|------|---------|-------|-------------|
```

## Key Principles

1. **Decision-stage gaps kill deals.** You can generate all the awareness you want, but if there's no case study or ROI model when the buyer is ready to decide, the deal stalls.
2. **One asset can serve multiple cells.** A good case study works for Decision stage across 2-3 personas. Map it everywhere it applies.
3. **Persona specificity matters more than volume.** Ten generic blog posts are worth less than one case study written for your primary persona's exact situation.
4. **The map is a living document.** Update it every time you create new content or run a new campaign.

## Anti-Patterns

- **Counting assets instead of coverage.** Having 50 blog posts doesn't mean you have good coverage. If they're all Awareness stage for one persona, you have 49 too many.
- **Classifying everything as Awareness.** If a case study is in Awareness, your classification is wrong. Be honest about what stage each asset actually serves.

## What to Do Next

- Create content to fill **Priority 1 gaps**: `/skill blog-post-writer` or `/skill case-study-builder`
- Design an **ABM campaign** using this map: `/skill abm-campaign-planner`
- Build a **content calendar** to schedule gap-filling: `/skill content-calendar`

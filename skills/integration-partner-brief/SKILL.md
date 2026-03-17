---
description: Create a technology partnership brief for an integration. Use when someone says "integration brief", "tech partnership", "integration partner", "API partnership", "product integration", "joint solution", or "integration spec"
tools: Read, Write
---

# Integration Partner Brief

Create a technology partnership brief that defines the integration use case, joint value proposition, technical spec, joint GTM plan, and success metrics. This is the document both teams align on before building anything.

## Inputs

- **Partner company** (required) -- who you're integrating with
- **Integration concept** (required) -- what the integration does at a high level
- **Customer need** (required) -- what problem this solves for mutual customers
- **Technical details** (optional) -- API availability, data formats, auth methods
- **GTM context** (optional) -- marketplace listing plans, co-selling motion

If partner or integration concept is missing, ask: "I need to know which partner and what the integration would do. What's the concept?"

## Steps

### Step 0 -- Check for Existing Output

Read `docs/sales/integration-brief-{partner-slug}.md` if it exists. If found, present a summary and ask: "An integration brief for [partner] already exists. Do you want me to (a) update it, (b) add a new use case, or (c) rebuild?"

### Step 1 -- Load Context

Read all available context:

1. `docs/gtm-triangle.md` -- positioning context
2. `docs/sales/partner-pitch-{partner-slug}.md` -- if a pitch already exists
3. `docs/ops/partner-program.md` -- partner program structure
4. `CLAUDE.md` -- project-level instructions

### Step 2 -- Define the Integration Use Case

Write clearly:
- **The problem:** What customers struggle with today without the integration
- **The solution:** What the integration enables (specific workflow, not vague "seamless experience")
- **The trigger:** When a customer would activate this integration (onboarding, scaling, specific pain point)

### Step 3 -- Write Joint Value Proposition

Answer: "What do customers get that neither product offers alone?"

Structure:
- {Your product} does {X}
- {Partner product} does {Y}
- Together, customers get {Z} -- which neither product delivers independently

This must be a genuine "1+1=3" statement. If the integration just saves a copy-paste step, the value prop is weak.

### Step 4 -- Design Integration Spec

Define what data flows where:

- **Data flow:** {Your product} sends {what data} to {Partner product} via {method}
- **Trigger:** What initiates the data flow (user action, schedule, event)
- **Authentication:** OAuth, API key, webhook signature
- **Data format:** JSON, CSV, custom schema
- **Error handling:** What happens when the integration fails
- **Rate limits:** Expected volume and any throttling

Include a simple flow diagram in text:

```
[Your Product] --{event}--> [Webhook/API] --{data}--> [Partner Product]
[Partner Product] --{response}--> [Your Product]
```

### Step 5 -- Plan Joint GTM

Define how to take the integration to market:

- **Marketplace listing:** Which marketplace(s), listing requirements, timeline
- **Co-marketing:** Joint blog post, webinar, email announcement
- **Co-selling:** When sales teams should mention the integration, talk track
- **Documentation:** Integration guide, setup walkthrough, FAQ
- **Launch plan:** Soft launch (beta users) then public announcement

### Step 6 -- Set Success Metrics

| Metric | 30-day target | 90-day target |
|--------|--------------|--------------|
| Integration activations | {N} | {N} |
| Monthly active integrations | {N} | {N} |
| Joint pipeline generated | ${N} | ${N} |
| Customer satisfaction (NPS or CSAT) | {score} | {score} |
| Support tickets related to integration | < {N}/month | < {N}/month |

### Step 7 -- Quality Gate

- [ ] Joint value proposition is genuinely "1+1=3" (not just convenience)
- [ ] Integration spec defines data flow, triggers, auth, and error handling
- [ ] GTM plan includes both marketplace and co-marketing
- [ ] Success metrics have specific targets
- [ ] Customer problem is clearly stated
- [ ] No em dashes in any copy

## Output Format

Save to `docs/sales/integration-brief-{partner-slug}.md`:

```markdown
# Integration Brief: {Your Product} + {Partner Product}

Date: {Date}
Status: Concept / In Development / Live

## Use Case
**Problem:** {What customers struggle with today}
**Solution:** {What the integration enables}
**Trigger:** {When customers activate this}

## Joint Value Proposition
{What customers get that neither product offers alone}

## Integration Spec
### Data Flow
{Diagram and description}
### Technical Details
- **Authentication:** {method}
- **Data format:** {format}
- **Trigger:** {what initiates flow}
- **Error handling:** {approach}
- **Rate limits:** {constraints}

## Joint GTM Plan
### Marketplace
{Listing plans}
### Co-Marketing
{Joint content and promotion}
### Co-Selling
{Sales enablement and talk tracks}
### Launch Plan
{Phased rollout}

## Success Metrics
| Metric | 30-day | 90-day |
|--------|--------|--------|
| {rows} |

## Open Questions
{Unresolved technical or business decisions}
```

## Key Principles

1. **The value must be genuinely joint.** If the integration just saves a manual step, it's a feature request, not a partnership. The joint value should be something neither product can deliver alone.
2. **Spec before code.** This brief exists so both teams agree on what's being built before anyone writes a line of code. Ambiguity here becomes bugs later.
3. **GTM is half the work.** An integration nobody knows about generates zero value. Plan the go-to-market with the same rigor as the technical spec.
4. **Start with one use case.** Don't try to integrate everything. Pick the highest-value use case, launch it, prove adoption, then expand.

## Anti-Patterns

- **The "seamless integration" handwave.** Saying "seamless" without defining data flow, error handling, and auth means you haven't thought it through.
- **Building without GTM.** Shipping an integration to your marketplace with no announcement, no docs, and no sales enablement. It will sit there unused.
- **Overscoping V1.** Trying to sync every data field in both directions for launch. Start with one-directional, one use case, then iterate.

## What to Do Next

- Write a **marketplace listing** for the integration: `/skill marketplace-listing-writer`
- Build **partner enablement materials**: `/skill channel-enablement-kit`
- Plan **co-marketing** around the launch: `/skill co-marketing-planner`

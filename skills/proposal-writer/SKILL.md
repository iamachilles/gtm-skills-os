---
description: Draft a client proposal with executive summary, methodology, timeline, and pricing. Trigger phrases — "write proposal", "draft proposal", "create proposal", "proposal for {prospect}", "scope of work", "SOW"
tools: Read, Write
---

# Proposal Writer

Draft a complete client proposal that leads with the prospect's problem, not your product. A proposal is a decision document, not a brochure. It should make the buyer feel understood, show a clear path forward, and make saying yes easy.

## Inputs

- **Prospect name/company** (required) -- who the proposal is for
- **Prospect needs** (required) -- the problem they need solved, ideally from discovery notes
- **Scope** (required) -- what you're proposing to deliver
- **Pricing** (required) -- pricing structure (single tier or multiple options)
- **Timeline** (optional) -- expected duration or milestones
- **Competitive context** (optional) -- who else they're evaluating
- **Discovery notes** (optional) -- raw notes from calls with the prospect

If prospect needs or scope is missing, ask: "I need to understand what the prospect needs and what we're proposing to deliver. Can you share discovery notes or a scope summary?"

## Steps

### Step 0 -- Check for Existing Output

Read `docs/sales/proposals/{prospect-slug}.md` if it exists. If found, present a summary and ask: "A proposal for {prospect} already exists. Do you want me to (a) revise it, or (b) start fresh?"

### Step 1 -- Load Context

Read available context files:

1. `docs/icp.md` -- qualification criteria and ideal buyer profile
2. `docs/gtm-triangle.md` -- positioning and messaging
3. `docs/messaging-matrix.md` -- persona-specific messaging if available
4. `docs/sales-narratives.md` -- narrative framing
5. `CLAUDE.md` -- project-level instructions

### Step 2 -- Write Executive Summary

Write the executive summary (under 200 words). Structure:

1. **Their situation** -- 2-3 sentences showing you understand their problem
2. **Why now** -- what makes this urgent or timely
3. **Why us** -- one sentence on why your approach is the right fit
4. **What we propose** -- one sentence summary of the engagement

This section alone should be compelling enough to forward to a decision-maker who won't read the rest.

### Step 3 -- Write Approach Section

Describe your methodology, not your features. The buyer wants to know:
- How you'll approach their specific problem
- What phases the work follows
- What they'll need to provide (inputs, access, stakeholder time)
- How you've solved similar problems before (reference case studies if available)

Frame as methodology, not deliverables. "We start by mapping your buyer journey" beats "You'll receive a buyer journey map."

### Step 4 -- Build Timeline and Milestones

Create a phased timeline with:
- Phase name and duration
- Key activities in each phase
- Milestones and deliverables at each gate
- Dependencies (what needs to happen before the next phase starts)
- Decision points where the prospect reviews and approves

### Step 5 -- List Deliverables

Create a clear, numbered list of everything the prospect receives. For each deliverable:
- What it is
- When they get it
- What format it takes

No ambiguity. The prospect should be able to check off each item.

### Step 6 -- Write Pricing Options

Present pricing in 3 tiers (recommended) or as specified:
- **Tier 1 (Essential):** Minimum viable engagement
- **Tier 2 (Recommended):** Full scope as discussed
- **Tier 3 (Premium):** Full scope plus extras

For each tier: what's included, what's excluded, total investment, payment terms.

If only one price point is provided, present it cleanly with clear inclusions/exclusions.

### Step 7 -- Add Terms and Next Steps

Include:
- Validity period (how long the proposal stands)
- Payment terms
- What happens after they say yes (onboarding, kickoff timeline)
- Who to contact with questions

### Step 8 -- Quality Gate

Before saving, verify:

- [ ] Executive summary is under 200 words
- [ ] Approach section describes methodology, not feature lists
- [ ] Every deliverable is specific and measurable
- [ ] Pricing is clear with no hidden costs or ambiguity
- [ ] Timeline includes dependencies and decision points
- [ ] Proposal leads with their problem, not your capabilities
- [ ] No jargon the prospect wouldn't use themselves
- [ ] Next steps are concrete with a specific action to take

If any check fails, fix it before proceeding.

## Output Format

Save to `docs/sales/proposals/{prospect-slug}.md`:

```markdown
# Proposal: {Prospect Company Name}
Date: {Date}
Prepared for: {Contact Name, Title}
Prepared by: {Your Name/Company}
Valid until: {Date + 30 days}

## Executive Summary
{Under 200 words: their situation, why now, why us, what we propose}

## The Challenge
{Expanded description of their problem, using their words from discovery}

## Our Approach
### Phase 1: {Name} ({Duration})
{Activities, methodology, what happens}

### Phase 2: {Name} ({Duration})
{Activities, methodology, what happens}

### Phase 3: {Name} ({Duration})
{Activities, methodology, what happens}

## Timeline
| Phase | Duration | Key Milestone | Deliverable |
|-------|----------|--------------|-------------|
| {Phase 1} | {Weeks} | {Milestone} | {Output} |
| {Phase 2} | {Weeks} | {Milestone} | {Output} |
| {Phase 3} | {Weeks} | {Milestone} | {Output} |

## Deliverables
1. {Deliverable} -- {Format, delivery date}
2. {Deliverable} -- {Format, delivery date}
3. {Deliverable} -- {Format, delivery date}

## Investment

### Option A: {Tier Name}
- {What's included}
- **Investment:** ${Amount}

### Option B: {Tier Name} (Recommended)
- {What's included}
- **Investment:** ${Amount}

### Option C: {Tier Name}
- {What's included}
- **Investment:** ${Amount}

## Terms
- **Validity:** This proposal is valid for 30 days
- **Payment:** {Terms}
- **Start date:** {Estimated, contingent on signed agreement}

## Next Steps
1. {Specific action -- e.g., "Reply to confirm Option A, B, or C"}
2. {What happens after -- e.g., "We'll send the agreement within 24 hours"}
3. {Kickoff -- e.g., "Kickoff call within one week of signed agreement"}

## About Us
{2-3 sentences -- relevant credentials, not a company history}
```

## Key Principles

1. **A proposal is not a brochure.** Lead with their problem, not your features. If the first page is about you, rewrite it.
2. **Three options beat one.** Anchoring with a premium tier makes the recommended tier feel reasonable. One option forces a yes/no decision.
3. **Specificity builds confidence.** Vague deliverables signal vague thinking. If you can't describe exactly what they'll receive, you're not ready to propose.
4. **The executive summary does the heavy lifting.** Most decision-makers read only this section. It must stand alone.
5. **Make saying yes easy.** The next steps section should require exactly one action from the buyer.

## Anti-Patterns

- **Do NOT lead with your company history.** The prospect doesn't care about your founding story. They care about their problem getting solved.
- **Do NOT use vague deliverables.** "Strategic recommendations" means nothing. "Documented ICP model with 3 validated personas and prioritized channel strategy" means something.
- **Do NOT hide pricing.** Burying the number or making it hard to find signals that you're not confident in your value.

## What to Do Next

- Build an **ROI model** to support the pricing: `/skill roi-calculator`
- Create a **mutual action plan** for the deal: `/skill mutual-action-plan`
- Write a **champion enablement kit** so your contact can sell internally: `/skill champion-enablement-kit`

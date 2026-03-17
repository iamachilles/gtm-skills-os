---
description: Outline a Quarterly Business Review deck with slide-by-slide content and talking points. Trigger phrases — "QBR", "quarterly business review", "QBR deck", "client review", "quarterly review", "build QBR"
tools: Read, Write
---

# QBR Deck Builder

Build a slide-by-slide QBR deck outline with content and talking points for each slide. A QBR is not a status update. It's a strategic conversation that demonstrates value delivered, shares insights the customer can't get elsewhere, and positions expansion.

The best QBR makes the customer think "I need more of this." The worst makes them think "I could have read this in an email."

## Inputs

- **Client name** (required) -- the customer this QBR is for
- **Performance data** (required) -- metrics, results, KPIs from the quarter
- **Customer goals** (required) -- what was agreed upon at the start of the quarter or engagement
- **Quarter/period** (optional) -- which quarter this covers
- **Expansion opportunity** (optional) -- specific upsell or cross-sell to position
- **Challenges encountered** (optional) -- things that didn't go as planned

If performance data or customer goals are missing, ask: "I need the performance data from the quarter and the goals we set. What metrics do you have, and what were we targeting?"

## Steps

### Step 0 -- Check for Existing Output

Read `docs/sales/qbr-{client-slug}.md` if it exists. If found, present a summary and ask: "A QBR deck for {client} already exists (dated {date}). Do you want me to (a) build the new quarter's version, or (b) start fresh?"

### Step 1 -- Load Context

Read available context files:

1. `docs/icp.md` -- customer profile context
2. `docs/gtm-triangle.md` -- positioning for expansion conversations
3. `CLAUDE.md` -- project-level instructions

### Step 2 -- Build Slide Structure

Create an 8-slide deck following this structure:

**Slide 1: Recap** -- Goals set last quarter
**Slide 2: Results** -- Actual vs. targets
**Slide 3: Wins** -- Top 3 achievements
**Slide 4: Learnings** -- What we'd do differently
**Slide 5: Insights** -- Patterns and recommendations
**Slide 6: Roadmap** -- Next quarter plan
**Slide 7: Expansion** -- Growth opportunities
**Slide 8: Ask** -- What we need from them

### Step 3 -- Write Slide Content

For each slide, write:
- **Headline:** One sentence that tells the story of the slide (not a label like "Results")
- **Key points:** 3-5 bullet points of content
- **Talking points:** What to say when presenting this slide (conversational, not scripted)
- **Data to include:** Specific charts, tables, or metrics for this slide

### Step 4 -- Design the Insights Slide

The insights slide is where you differentiate. This is where you share something the customer doesn't already know:
- Patterns you've observed across their data
- Benchmarks against similar companies (anonymized)
- Emerging trends that affect their business
- Specific recommendations based on what you've learned

This slide is the reason they renew. Make it count.

### Step 5 -- Frame the Expansion Slide

Position expansion as a logical next step, not a sales pitch:
- Connect it to results already delivered
- Tie it to a gap or opportunity identified in the insights
- Present it as "here's what we'd do next based on what we've learned"
- Include a rough scope and expected impact

### Step 6 -- Quality Gate

Before saving, verify:

- [ ] Every slide has a story headline, not just a label
- [ ] Results slide shows actual vs. target for every goal set last quarter
- [ ] Learnings slide is honest about what didn't work (not a disguised wins slide)
- [ ] Insights slide contains at least one thing the customer doesn't already know
- [ ] Expansion slide connects to delivered results, not a generic pitch
- [ ] Talking points sound conversational, not scripted
- [ ] Total deck is 8 slides. No filler slides.
- [ ] No metrics are fabricated. If data wasn't provided, note what to fill in.

If any check fails, fix it before proceeding.

## Output Format

Save to `docs/sales/qbr-{client-slug}.md`:

```markdown
# QBR Deck: {Client Name}
Quarter: {Q? YYYY}
Date: {Date}
Presented by: {Name/Team}

---

## Slide 1: Recap -- {Story Headline}
**What we set out to do**

- Goal 1: {Description} -- Target: {Metric}
- Goal 2: {Description} -- Target: {Metric}
- Goal 3: {Description} -- Target: {Metric}

**Talking points:** {What to say -- frame as a reminder of shared commitments}

---

## Slide 2: Results -- {Story Headline}
**How we performed**

| Goal | Target | Actual | Status |
|------|--------|--------|--------|
| {Goal 1} | {Target} | {Actual} | {Hit/Miss/In Progress} |
| {Goal 2} | {Target} | {Actual} | {Hit/Miss/In Progress} |
| {Goal 3} | {Target} | {Actual} | {Hit/Miss/In Progress} |

**Talking points:** {Lead with wins, acknowledge misses, don't make excuses}

---

## Slide 3: Wins -- {Story Headline}
**Top 3 achievements this quarter**

1. {Win} -- {Impact and why it matters}
2. {Win} -- {Impact and why it matters}
3. {Win} -- {Impact and why it matters}

**Talking points:** {Connect wins to their business outcomes, not your deliverables}

---

## Slide 4: Learnings -- {Story Headline}
**What we'd do differently**

1. {Learning} -- {What happened and what we'll change}
2. {Learning} -- {What happened and what we'll change}
3. {Learning} -- {What happened and what we'll change}

**Talking points:** {Be honest. Customers respect transparency. This builds trust.}

---

## Slide 5: Insights -- {Story Headline}
**Patterns and recommendations**

1. {Insight} -- {Data behind it} -- {Recommendation}
2. {Insight} -- {Data behind it} -- {Recommendation}
3. {Insight} -- {Data behind it} -- {Recommendation}

**Talking points:** {This is the "you're paying for our expertise, not just execution" slide}

---

## Slide 6: Roadmap -- {Story Headline}
**Next quarter plan**

| Priority | Description | Expected Outcome | Timeline |
|----------|-------------|-----------------|----------|
| 1 | {Initiative} | {Metric/result} | {When} |
| 2 | {Initiative} | {Metric/result} | {When} |
| 3 | {Initiative} | {Metric/result} | {When} |

**Talking points:** {Frame as building on momentum, not starting over}

---

## Slide 7: Expansion -- {Story Headline}
**Growth opportunity**

- **What:** {Description of expanded scope}
- **Why now:** {Connected to results and insights from this quarter}
- **Expected impact:** {Projected outcome}
- **Investment:** {Rough scope/cost if appropriate}

**Talking points:** {Position as logical next step, not a pitch. "Based on what we've learned..."}

---

## Slide 8: Ask -- {Story Headline}
**What we need from you**

1. {Specific ask -- e.g., "Access to your analytics dashboard for deeper insights"}
2. {Specific ask -- e.g., "Intro to your VP of Product for alignment on roadmap"}
3. {Specific ask -- e.g., "Confirm Q2 goals by {date}"}

**Talking points:** {Be direct. QBR is the right moment to ask for what you need.}
```

## Key Principles

1. **A QBR is a strategic conversation, not a status report.** If you're just reading metrics, send an email instead.
2. **The insights slide is your moat.** Anyone can report results. Only a trusted partner can share patterns and recommendations the customer can't see themselves.
3. **Honesty on learnings builds more trust than perfection on results.** Customers know things went wrong. Addressing it proactively earns respect.
4. **Expansion follows value.** Never pitch expansion in a QBR where results were poor. Earn the right to ask for more.
5. **End with a specific ask.** Every QBR should close with concrete next steps from both sides.

## Anti-Patterns

- **Do NOT fabricate metrics.** If performance data is incomplete, mark it as "TBD -- data needed" and note what to collect.
- **Do NOT make the learnings slide a disguised wins slide.** "We learned that our approach works really well" is not a learning. Be real about what didn't work.
- **Do NOT skip the expansion slide.** Even if there's no upsell, position future value. The QBR is your best retention moment.

## What to Do Next

- Build an **ROI model** to support the expansion ask: `/skill roi-calculator`
- Create a **mutual action plan** for the next quarter: `/skill mutual-action-plan`
- Write a **proposal** for the expansion opportunity: `/skill proposal-writer`

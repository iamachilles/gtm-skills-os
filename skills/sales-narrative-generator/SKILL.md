---
name: sales-narrative-generator
description: Generate per-persona sales narratives using the 6-part storyline framework
allowed-tools: Read, Write
metadata:
  author: Achille Morin-Lemoine
  version: "1.0.0"
---

# Sales Narrative Generator

Generate sales narratives for each buyer persona using the 6-part storyline framework. A sales narrative is not a pitch deck or a feature list. It's a story that starts in the buyer's world, validates their experience, and leads them to your solution as the logical conclusion.

Each persona gets their own narrative because each persona experiences the problem differently. The VP of Sales cares about pipeline velocity. The RevOps manager cares about data integrity. Same product, different stories.

## Inputs

- **Persona profiles** (required) — detailed buyer personas with titles, KPIs, pain points, and goals. The richer the persona, the better the narrative.
- **Value proposition** (required) — what the product/service does, key capabilities, and differentiators
- **Proof points** (required) — case studies, customer results, data points, or track record evidence
- **Competitive context** (optional) — key alternatives and how you differ from them
- **Tone guidance** (optional) — formal, conversational, technical, etc.

## Steps

### Step 1 — Read Persona Profiles and Value Props

Thoroughly read all provided persona profiles and value proposition materials. For each persona, identify:
- Their primary KPI (the one metric they lose sleep over)
- The biggest pain point that connects to your solution
- What they've tried before and why it didn't work
- What "success" looks like in their language

Map each value proposition element to the persona(s) it matters most to. Not every feature matters to every persona.

### Step 2 — Write One Narrative Per Persona

For each persona, write a complete 6-part narrative:

**Part 1: Market Change**
What shifted in the buyer's world that makes the old way insufficient? This must be something they recognize and agree with. It's not about your product. It's about their reality.

- Start with an observable trend or event they've experienced
- Make it feel inevitable, not optional
- The buyer should be nodding by the end of this section

Example: "Three years ago, an SDR team of 10 could hit quota by sending 200 cold emails a day. Today, the average reply rate on generic outbound has dropped below 1%. The volume playbook is broken."

**Part 2: Who's Affected**
Which roles and companies feel this change most? Narrow it to this specific persona's experience.

- Describe their day-to-day reality in concrete terms
- Reference specific frustrations, metrics, or situations
- The buyer should think "this person understands my job"

Example: "This hits RevOps leaders hardest. They're asked to report on pipeline accuracy, but 40% of CRM data is stale within 90 days. They spend Fridays running manual cleanup instead of building the systems that would prevent the mess."

**Part 3: Current Alternatives**
What do they do today, and why does it fall short? Cover all alternatives, including doing nothing.

- Acknowledge that they're not stupid. They've tried things.
- Explain why those things don't fully solve the problem
- Common alternatives: manual processes, spreadsheets, point solutions, consultants, building in-house, ignoring the problem

Example: "Most teams try to solve this with CRM hygiene rules and quarterly data audits. The rules get ignored because reps are compensated on activity, not accuracy. The audits find problems 3 months too late."

**Part 4: Unique Solution**
Your approach and why it's fundamentally different. This is where your product enters the story, but framed as the logical next step, not a pitch.

- Lead with the approach, not the feature
- Explain the principle behind your solution, then the mechanism
- Differentiate from the alternatives mentioned in Part 3

Example: "Instead of policing data after it's entered, we validate it at the point of capture. Every field is enriched and verified in real-time before it hits the CRM. Reps don't change their behavior. The system handles accuracy automatically."

**Part 5: Proof**
Specific results, case studies, or data that validate the solution works. This section must be concrete.

- Use specific numbers: revenue impact, time saved, conversion improvements
- Reference companies similar to the buyer's company (same industry, size, or challenge)
- If case studies aren't available, use industry benchmarks or logical projections based on known data

Example: "When Acme Corp implemented this, CRM data accuracy went from 62% to 97% in 6 weeks. Their forecast accuracy improved by 34%, and their RevOps team eliminated 15 hours per week of manual data cleanup."

**Part 6: CTA**
A clear, low-friction next step. Not "buy our product" but "let's explore whether this applies to your situation."

- Match the CTA to the persona's buying authority and position in the process
- Champions get activation CTAs ("want to run a pilot?")
- Economic buyers get strategic CTAs ("worth a 20-minute conversation to see if this applies?")
- Technical evaluators get evidence CTAs ("want to see the integration architecture?")

### Step 3 — Ensure Buyer Language Throughout

Review each narrative and replace any consultant-speak or marketing jargon with language the buyer would actually use:
- "Optimize revenue operations" becomes "stop losing deals because your CRM data is wrong"
- "Drive alignment across teams" becomes "get sales and marketing looking at the same numbers"
- "Leverage AI-powered insights" becomes "the system flags accounts that match your best customers"

Read each narrative as if you're the persona. Would you keep reading, or would you tune out?

### Step 4 — Validate Proof Points

Check that every proof point in Part 5 is:
- Specific (has numbers, names, or timeframes)
- Relevant (the referenced company is similar to the target persona's company)
- Credible (not an obviously cherry-picked outlier)

If proof points are weak, flag them and suggest what evidence would be needed to strengthen the narrative.

## Output Format

Write one document containing all narratives:

```
# Sales Narratives: [Product/Company Name]
Date: [Date]

## How to Use This Document
[Brief instructions: which narrative to use with which persona, when in the sales cycle]

## Narrative 1: [Persona Name — e.g., "The VP of Sales"]

### Market Change
[2-3 paragraphs]

### Who's Affected
[1-2 paragraphs]

### Current Alternatives
[2-3 paragraphs covering major alternatives]

### Unique Solution
[2-3 paragraphs]

### Proof
[1-2 specific proof points with numbers]

### CTA
[1-2 sentences]

---

## Narrative 2: [Persona Name]
[Same structure]

---

## Narrative 3: [Persona Name]
[Same structure]

---

## Appendix: Proof Point Inventory
[All available proof points listed, with confidence level: confirmed / estimated / needed]
```

## Quality Checks

- Every persona has a complete 6-part narrative. No section is skipped or merged with another.
- Part 1 (Market Change) does not mention the product. It exists entirely in the buyer's world.
- Part 3 (Current Alternatives) acknowledges at least 2 alternatives, including "do nothing."
- Part 5 (Proof) contains specific numbers. "Significant improvement" is not proof. "34% increase in forecast accuracy" is proof.
- Narratives differ meaningfully across personas. If you could swap Part 2 between two narratives and it still works, they're too similar.
- No em dashes in any narrative text.
- Language is conversational, not formal. These narratives should sound like how a knowledgeable peer would explain the situation, not how a consultant would present a slide.
- CTAs are appropriate for each persona's authority level. Don't ask an end user to "schedule a strategic alignment session."

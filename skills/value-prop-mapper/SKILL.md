---
name: value-prop-mapper
description: Map features to benefits to value outcomes for each persona. Use when someone says "map value props", "feature benefit mapping", "value proposition matrix", "connect features to outcomes", or "what value do we deliver per persona"
allowed-tools: Read, Write
metadata:
  author: Achille Morin-Lemoine
  version: "1.0.0"
---

# Value Prop Mapper

Map product features through benefits to quantifiable value outcomes, organized by buyer persona. This creates the translation layer between what your product does and why each persona should care. Without this, sales teams default to feature-dumping and marketing writes generic "we help you grow" copy.

The key insight: the same feature delivers different value to different personas. Automated reporting saves the VP of Sales from building board decks manually (time back). It gives RevOps clean pipeline data (accuracy). It gives the CFO forecast confidence (risk reduction). Same feature, three different conversations.

## Inputs

- **Product/service description** (required) -- core features, capabilities, how it works
- **Persona profiles** (required) -- at least 2 personas with titles, KPIs, and pain points. Richer profiles produce better mappings.
- **Customer results or proof points** (optional) -- real data strengthens value outcomes
- **Competitive context** (optional) -- helps sharpen differentiation in the value column

If persona profiles or product description are missing, ask: "I need persona profiles and a product description to build the value prop matrix. Do you have docs/personas/ files and a product overview, or should I work from the GTM Triangle?"

## Steps

### Step 0 -- Check for Existing Output

Search the project for any existing output from a previous run of this skill (check common locations like `docs/`, the project root, or any organized output directory). If a previous version is found, present a summary and ask: "A value prop matrix already exists. Do you want me to (a) refine it with new information, (b) overwrite it completely, or (c) merge new personas/features into the existing matrix?" 

### Step 1 -- Load Context

Read all available context in this order:

1. **GTM Triangle** -- positioning, ICP, and persona summaries
2. **Persona profiles** -- detailed persona profiles
3. `CLAUDE.md` -- project-level instructions
4. Any product documentation, feature lists, or capability decks provided by the user

For each persona, extract and note:
- The 2-3 KPIs they own (the metrics on their performance review)
- Their primary pain point (the problem that consumes their time)
- Their buying criteria (what they evaluate solutions on)

### Step 2 -- List Core Features

Identify 5-10 core features or capabilities of the product. For each feature, write a one-sentence factual description of what it does. No marketing language. Just mechanics.

Features must be:
- Observable (someone could see it working in a demo)
- Distinct (not two ways of saying the same thing)
- Relevant (connects to at least one persona's pain)

If WebSearch returns nothing, write "Not found." Never invent features that don't exist in the source material.

### Step 3 -- Derive Benefits Per Persona

For each feature, ask: "What does this enable [Persona] to do that they couldn't do before, or couldn't do as well?"

Benefits must be:
- Action-oriented (starts with a verb: "Eliminate," "Reduce," "Identify")
- Persona-specific (references their workflow, not generic business improvement)
- Concrete (describes a specific change in their work, not an abstract improvement)

Bad benefit: "Improves efficiency"
Good benefit: "Eliminates the Friday data cleanup ritual that takes 4 hours every week"

### Step 4 -- Derive Value Outcomes

For each benefit, ask: "What KPI does this impact, and by how much?"

Value outcomes must:
- Reference a specific metric the persona is measured on (revenue, pipeline velocity, CAC, time-to-close, churn rate, forecast accuracy)
- Include a directional impact (increases, decreases, eliminates)
- Include a quantified estimate when proof points exist, or a logical range when they don't

Bad value: "Better results"
Good value: "Reduces forecast variance by 20-35%, based on customer benchmarks"

If no data exists for quantification, write the metric and direction without a number, and flag it: "[Needs customer data to quantify]"

### Step 5 -- Build the Matrix

Organize into a per-persona matrix. Each persona gets their own table with minimum 5 rows.

### Step 6 -- Quality Gate

Run these binary checks before saving:

- [ ] Every value outcome references a buyer KPI (revenue, time saved, deals closed, cost reduced, risk mitigated), not a product description
- [ ] No two features have identical benefits for the same persona
- [ ] Each persona has at least 5 rows
- [ ] Benefits use the persona's language, not product marketing language
- [ ] Value outcomes that lack proof points are flagged as needing validation
- [ ] No feature is listed without a clear persona connection. If a feature doesn't matter to any defined persona, remove it.

If any check fails, fix it before proceeding.

## Output Format

Save the output to your project. Suggested filename: `value-prop-matrix.md`

```markdown
# Value Proposition Matrix: [Company/Product Name]
Date: [Date]

## How to Use This Document
Use this matrix to tailor conversations by persona. Each persona section shows what to emphasize and why it matters to them specifically. Sales should pull from the persona they're talking to, not present the whole matrix.

## Persona 1: [Title -- e.g., "VP of Sales"]

| Feature | Benefit | Value Outcome |
|---------|---------|---------------|
| [What it does] | [What it enables this persona to do] | [KPI impact + quantification] |
| ... | ... | ... |

### Key Talking Points for [Persona 1]
- [Top 2-3 most compelling value outcomes for this persona, written as conversation starters]

---

## Persona 2: [Title]

| Feature | Benefit | Value Outcome |
|---------|---------|---------------|
| ... | ... | ... |

### Key Talking Points for [Persona 2]
- [Top 2-3]

---

## Persona 3: [Title]

[Same structure]

---

## Proof Point Gaps
[List value outcomes that need customer data to quantify. Format: "Persona / Feature / What data is needed"]

## Feature Coverage Summary
| Feature | [Persona 1] | [Persona 2] | [Persona 3] |
|---------|-------------|-------------|-------------|
| [Feature 1] | High | Medium | Low |
| ... | ... | ... | ... |
```

## Key Principles

1. **Value outcomes must hit KPIs, not describe features.** "Easy to use" is not a value outcome. "Reduces onboarding time from 6 weeks to 1 week" is.
2. **Same feature, different story per persona.** If the benefit column is identical across personas, you haven't done the translation work.
3. **Flag what you can't prove.** Unquantified value outcomes are hypotheses until validated with customer data. Mark them honestly.
4. **Start from the persona's world, not the product.** The question is "what does this persona need?" not "what does this feature do?"
5. **Fewer strong rows beat many weak rows.** Five compelling feature-benefit-value chains are worth more than fifteen generic ones.

## Anti-Patterns

- **Product-centric value outcomes:** "Powerful analytics dashboard" is a feature restated, not a value outcome. Always translate to business impact.
- **Generic benefits that apply to any product:** "Saves time and money" could describe a stapler. Be specific to this product and this persona.
- **Identical rows across personas:** If the VP of Sales and the SDR Manager get the same benefit from the same feature, you haven't thought hard enough about how they experience the problem differently.

## What to Do Next

- Build the full **messaging-matrix** to turn these value props into copy for each channel: `/skill messaging-matrix`
- Generate **sales narratives** that weave these value props into a compelling story per persona: `/skill sales-narrative-generator`
- Create **objection handlers** that preempt pushback on each value claim: `/skill objection-library`

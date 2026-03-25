---
name: messaging-matrix
description: Generate a full messaging matrix crossing value pillars with personas. Use when someone says "messaging matrix", "messaging framework", "value pillars", "persona messaging", "messaging by audience", or "tailor messaging per persona"
allowed-tools: Read, Write
metadata:
  author: Achille Morin-Lemoine
  version: "1.0.0"
---

# Messaging Matrix

Generate a complete messaging matrix that crosses value pillars with buyer personas. This creates a grid where every cell contains ready-to-use messaging: a headline, supporting copy, proof point, and CTA, all tailored to a specific persona hearing a specific value message.

This is the central messaging asset that feeds everything downstream: cold emails, ad copy, landing pages, sales decks, and outbound sequences. Without it, every piece of content starts from scratch. With it, content creation becomes assembly, not invention.

## Inputs

- **Value proposition matrix** (required) -- feature/benefit/value mapping per persona (from value-prop-mapper)
- **Persona profiles** (required) -- detailed personas with KPIs, pain points, and language preferences
- **Proof points** (optional) -- case studies, metrics, customer quotes
- **Brand voice guidelines** (optional) -- tone, style, vocabulary constraints
- **Channel context** (optional) -- where this messaging will be used (affects copy length and format)

If value prop matrix or personas are missing, ask: "I need the value prop matrix and persona profiles to build the messaging matrix. Do you have docs/value-prop-matrix.md and docs/personas/ files, or should I run value-prop-mapper first?"

## Steps

### Step 0 -- Check for Existing Output

Search the project for any existing output from a previous run of this skill (check common locations like `docs/`, the project root, or any organized output directory). If a previous version is found, present a summary and ask: "A messaging matrix already exists with [N] pillars x [N] personas. Do you want me to (a) add new pillars or personas, (b) refine the copy quality, or (c) rebuild from scratch?" 

### Step 1 -- Load Context

Search the project for any available context. Look in the project root, `docs/`, or any organized directory. Read what you find:

1. **Value proposition mapping** -- the value propositions to translate into messaging
2. **Persona profiles** -- persona profiles for language and tone matching
3. **GTM Triangle** -- positioning context and market change narrative
4. **Sales narratives** -- narrative framing if available
5. `CLAUDE.md` -- project-level instructions

For each persona, note:
- Their primary language patterns (how they describe problems)
- Their authority level (determines CTA type)
- Their evaluation criteria (determines which proof points resonate)

### Step 2 -- Define Value Pillars

Identify 3-5 value pillars by clustering the value proposition matrix. Each pillar represents a strategic theme, not a feature.

Rules for pillars:
- Each pillar must be distinct enough to stand alone as a reason to buy
- Each pillar should resonate with at least 2 personas
- Pillar names should be benefit-oriented, not feature-oriented ("Revenue Predictability" not "Forecasting Module")
- Hard cap: maximum 5 pillars. If you have more, merge or prioritize.

For each pillar, write a one-sentence definition that captures the core promise.

### Step 3 -- Write Cell Content

For each pillar x persona intersection, write four components:

**Headline** (hard cap: 10 words)
- Must speak directly to this persona's primary concern
- Uses their language, not marketing speak
- Should work as an email subject line or ad headline

**Supporting Copy** (exactly 2 sentences)
- Sentence 1: Describe the problem this persona faces related to this pillar
- Sentence 2: Describe the outcome your solution delivers

**Proof Point** (1 specific metric, case study, or data point)
- Must be relevant to this persona's KPI
- Must include a number or specific reference
- If no proof exists, write "[Proof needed: specific customer result for {persona} around {pillar}]"

**CTA** (1 clear action, 5-10 words)
- Match to persona's authority level:
  - Economic buyer: strategic conversation ("See how this impacts your forecast")
  - Champion: tactical next step ("Get the ROI calculator")
  - End user: trial or demo ("Try it with your own data")

### Step 4 -- Differentiation Check

Review each row (same pillar, across personas). The messaging must be meaningfully different:
- Different pain points referenced
- Different language and tone
- Different proof points when possible
- Different CTAs appropriate to authority level

Review each column (same persona, across pillars). The messaging must tell a coherent story:
- Pain points should build on each other, not contradict
- The overall picture should make the persona think "they understand my entire situation"

### Step 5 -- Write Pillar Narratives

For each pillar, write a 2-3 sentence narrative that explains the pillar's strategic importance. This is the "why this matters" context that helps content creators and sales reps understand the intent behind the messaging cells.

### Step 6 -- Quality Gate

Run these checks before saving:

- [ ] Minimum 3 pillars x 3 personas = 9 cells, all complete
- [ ] No two cells in the same row (same pillar, different personas) have identical or near-identical messaging
- [ ] Every headline is 10 words or fewer
- [ ] Every supporting copy is exactly 2 sentences
- [ ] Every CTA matches the persona's authority level
- [ ] Proof points are specific (contain a number or named reference) or explicitly flagged as needed
- [ ] Language in each cell matches the persona's vocabulary (check against persona profiles)
- [ ] No pillar could be removed without losing a meaningful part of the value story

If any check fails, fix it before proceeding.

## Output Format

Save the output to your project. Suggested filename: `messaging-matrix.md`

```markdown
# Messaging Matrix: [Company/Product Name]
Date: [Date]

## How to Use This Document
This matrix is your messaging source of truth. When writing any content, find the intersection of your target persona and the value pillar you want to emphasize. Use the headline as your lead, the supporting copy for body text, the proof point for credibility, and the CTA for your close.

## Value Pillars Summary
1. **[Pillar 1 Name]** -- [One-sentence definition]
2. **[Pillar 2 Name]** -- [One-sentence definition]
3. **[Pillar 3 Name]** -- [One-sentence definition]
4. **[Pillar 4 Name]** -- [One-sentence definition] (if applicable)
5. **[Pillar 5 Name]** -- [One-sentence definition] (if applicable)

---

## Pillar 1: [Pillar Name]

[2-3 sentence strategic narrative for this pillar]

### For [Persona 1 -- e.g., "VP of Sales"]
- **Headline:** [Max 10 words]
- **Supporting Copy:** [Sentence 1 -- problem]. [Sentence 2 -- outcome].
- **Proof Point:** [Specific metric or reference]
- **CTA:** [5-10 words]

### For [Persona 2]
- **Headline:** [Max 10 words]
- **Supporting Copy:** [Two sentences]
- **Proof Point:** [Specific]
- **CTA:** [5-10 words]

### For [Persona 3]
- **Headline:** [Max 10 words]
- **Supporting Copy:** [Two sentences]
- **Proof Point:** [Specific]
- **CTA:** [5-10 words]

---

## Pillar 2: [Pillar Name]
[Same structure]

---

## Pillar 3: [Pillar Name]
[Same structure]

---

## Quick Reference Grid

| | [Persona 1] | [Persona 2] | [Persona 3] |
|---|---|---|---|
| **[Pillar 1]** | [Headline] | [Headline] | [Headline] |
| **[Pillar 2]** | [Headline] | [Headline] | [Headline] |
| **[Pillar 3]** | [Headline] | [Headline] | [Headline] |

## Proof Point Gaps
[List cells that need proof points, with what type of evidence is needed]
```

## Key Principles

1. **Each cell must stand alone.** A sales rep should be able to pull one cell and use it in an email without needing the rest of the matrix.
2. **Persona language trumps brand voice.** If your brand voice says "innovative solutions" but your buyer says "stuff that actually works," use the buyer's words.
3. **Proof points make or break credibility.** A cell without a proof point is a claim. A cell with one is evidence. Prioritize filling proof point gaps.
4. **Headlines do the heavy lifting.** If the headline doesn't earn the reader's attention, the supporting copy never gets read. Spend the most time on headlines.
5. **Less is more with pillars.** Three strong pillars beat five mediocre ones. Each pillar should survive the "would we lose a deal without this?" test.

## Anti-Patterns

- **Persona-blind messaging:** Same headline for every persona with minor word changes. If swapping the persona name doesn't break the message, the message isn't persona-specific.
- **Feature-based pillars:** "AI-Powered Analytics" is a feature, not a value pillar. "Revenue Predictability" is the value that feature delivers.
- **Jargon-heavy copy:** If the persona wouldn't use a word in conversation with a colleague, don't use it in their messaging cell.

## What to Do Next

- Write **cold email sequences** pulling from specific matrix cells: `/skill cold-email-writer`
- Create **ad copy** for each pillar x persona combination: `/skill ad-copy-writer`
- Build **landing page copy** organized by pillar: `/skill landing-page-copy`
- Generate **outbound sequences** using matrix messaging: `/skill write-outbound-sequence`

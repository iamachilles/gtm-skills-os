---
description: Build a structured objection-handling library organized by persona and objection type. Use when someone says "objection handling", "handle objections", "common pushback", "why deals stall", "sales rebuttals", or "overcome resistance"
tools: Read, Write, WebSearch
---

# Objection Library

Build a comprehensive, structured objection-handling library organized by buyer persona and objection category. Every B2B sale faces the same five categories of resistance: pricing, timing, competitor preference, internal politics, and status quo inertia. The difference between a good sales team and a great one is having pre-built, tested responses for each.

This skill goes beyond "here's what to say." Each objection gets root cause analysis (why they're really saying this), a reframe strategy (how to shift the conversation), a proof point (evidence that neutralizes the concern), and a talk track (exact words to use).

## Inputs

- **Buyer personas / buying committee profiles** (required) -- who raises which objections, with their KPIs and pain points
- **Sales narratives or value propositions** (required) -- what claims you're making that trigger pushback
- **Win/loss analysis** (optional) -- real objection data from lost deals is gold
- **Competitor information** (optional) -- for competitive objection handling
- **Pricing details** (optional) -- for pricing objection specificity

If personas or value props are missing, ask: "I need buyer personas and your value proposition to build relevant objection handlers. Do you have docs/personas/ files and docs/value-prop-matrix.md, or should I start from the GTM Triangle?"

## Steps

### Step 0 -- Check for Existing Output

Read `docs/objection-library.md` if it exists. If found, present a summary and ask: "An objection library already exists with [N] objections across [N] personas. Do you want me to (a) add new objections, (b) refine existing handlers, or (c) rebuild from scratch?"

### Step 1 -- Load Context

Read all available context:

1. `docs/buying-committee.md` or `docs/personas/*.md` -- who objects and why
2. `docs/sales-narratives.md` -- the claims that trigger objections
3. `docs/value-prop-matrix.md` -- the value story being challenged
4. `docs/win-loss-analysis.md` -- real objection data if available
5. `docs/competitor-analysis.md` -- competitive landscape
6. `CLAUDE.md` -- project-level instructions

For each persona, note their likely objection triggers based on their role, authority level, and what they're measured on.

### Step 2 -- Identify Objections by Category

For each persona, brainstorm objections across five categories:

1. **Pricing** -- "Too expensive," "Can't justify the ROI," "Need to see value first"
2. **Timing** -- "Not the right time," "We're mid-migration," "Maybe next quarter"
3. **Competitor** -- "We're already using X," "How are you different from Y?"
4. **Internal Resistance** -- "My team won't adopt it," "Leadership won't approve," "IT will block this"
5. **Status Quo** -- "What we have works fine," "We built something internally," "We'll just hire someone"

Use WebSearch to validate and expand:
- Search: "{industry}" "common objections" "{product category}"
- Search: "{competitor name}" vs "{product type}" comparison
- Search: "{persona title}" "why we chose" OR "why we switched" "{product category}"

Aim for 3-5 objections per persona, minimum 2 per category across all personas.

If WebSearch returns nothing relevant, write "Not found." Never invent objections that don't fit the market.

### Step 3 -- Analyze Root Causes

For each objection, dig into the real reason behind it:

- **Surface objection:** What they say ("It's too expensive")
- **Root cause:** What they mean ("I can't quantify the ROI to get budget approval from my CFO")
- **Emotional driver:** What they feel ("If I champion this and it fails, I look bad")

The root cause determines the reframe. If you respond to the surface objection, you lose. If you respond to the root cause, you advance.

### Step 4 -- Build Reframe Strategies

For each objection, create a reframe that shifts the conversation:

- **Cost reframe:** Move from price to cost of inaction. "What's the cost of not solving this for another 6 months?"
- **Timing reframe:** Move from "not now" to "cost of delay." "Every quarter you wait, your team spends X hours on manual work."
- **Competitor reframe:** Move from feature comparison to approach comparison. "The question isn't which tool has more features. It's which approach matches how your team actually works."
- **Internal reframe:** Move from "hard to get buy-in" to "here's how to build the case." Arm the champion.
- **Status quo reframe:** Move from "it works fine" to "what's changed." "It worked fine when you had 5 reps. You have 25 now."

### Step 5 -- Attach Proof Points

Every reframe needs evidence. For each objection handler, attach:

- A specific data point, case study reference, or customer quote
- The proof point must directly counter the root cause, not just generally support your product
- If no proof point exists, flag it: "[Proof needed: customer example of X]"

### Step 6 -- Write Talk Tracks

For each objection, write a natural-sounding talk track (60-100 words). This is what a sales rep would actually say in a conversation. Rules:

- Start by acknowledging the objection. Never dismiss it.
- Use the reframe to redirect.
- End with a question that advances the conversation.
- Write in conversational English. No corporate speak.

### Step 7 -- Quality Gate

Run these checks before saving:

- [ ] Every objection has all four components: root cause, reframe, proof point, talk track
- [ ] Reframe strategies are specific to this product and market. Test: could a competitor use the same reframe? If yes, it's too generic.
- [ ] Talk tracks sound like a real human in a real conversation, not a script
- [ ] At least 3 objections per persona
- [ ] At least 2 objections per category across all personas
- [ ] Proof points are specific (numbers, names, timeframes) or explicitly flagged as needed
- [ ] No talk track exceeds 100 words

If any check fails, fix it before proceeding.

## Output Format

Save to `docs/objection-library.md`:

```markdown
# Objection Library: [Company/Product Name]
Date: [Date]

## How to Use This Document
Look up objections by the persona you're selling to. Each handler gives you the root cause (why they're really objecting), how to reframe, what proof to use, and exactly what to say. Practice the talk tracks until they feel natural, then adapt to your style.

## [Persona 1 -- e.g., "VP of Sales"]

### Pricing Objections

#### "It's too expensive for what it does"
- **Root Cause:** [Why they're really saying this]
- **Reframe:** [How to shift the conversation]
- **Proof Point:** [Specific evidence]
- **Talk Track:** "[Natural language response, 60-100 words]"

#### "[Next objection]"
[Same structure]

### Timing Objections
[Same structure per objection]

### Competitor Objections
[Same structure]

### Internal Resistance Objections
[Same structure]

### Status Quo Objections
[Same structure]

---

## [Persona 2]
[Same structure]

---

## Objection Frequency Map
| Objection | [Persona 1] | [Persona 2] | [Persona 3] | Stage |
|-----------|-------------|-------------|-------------|-------|
| [Objection] | Common | Rare | Never | Discovery |
| ... | ... | ... | ... | ... |

## Proof Point Gaps
[List objections that need stronger evidence. Format: "Persona / Objection / What proof is needed"]
```

## Key Principles

1. **Respond to the root cause, not the surface objection.** "Too expensive" is never about the price. It's about inability to quantify ROI, lack of budget authority, or fear of making a bad decision.
2. **Acknowledge before reframing.** Dismissing an objection makes the buyer defensive. Validating it opens them up to a new perspective.
3. **Arm the champion, don't just persuade the buyer.** Internal resistance objections are solved by giving your champion the ammunition to sell internally.
4. **Talk tracks are starting points, not scripts.** They should sound natural enough that a rep can adapt them to their own voice.
5. **The best objection handlers prevent objections.** If you find yourself handling the same objection repeatedly, the problem is upstream in your positioning or discovery process.

## Anti-Patterns

- **Generic reframes that work for any product:** "Think of it as an investment, not an expense" is useless. The reframe must reference specific value this product delivers.
- **Confrontational talk tracks:** Never argue with the buyer. "Actually, you're wrong about that" guarantees a lost deal.
- **Missing root cause analysis:** Jumping straight to a rebuttal without understanding why the objection exists means you're treating symptoms, not causes.

## What to Do Next

- Build **battlecards** that combine objection handling with competitive intelligence: `/skill battlecard-generator`
- Create a **sales playbook** that embeds these handlers into the sales process: `/skill sales-playbook-writer`
- Set up a **reply handler** for common email/LinkedIn objections: `/skill reply-handler`

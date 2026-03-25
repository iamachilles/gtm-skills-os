---
name: icp-model-creator
description: Create a comprehensive ICP document with 10 sections from source material and research
allowed-tools: Read, Write, WebFetch, WebSearch
metadata:
  author: Achille Morin-Lemoine
  version: "1.0.0"
---

# ICP Model Creator

Create a comprehensive Ideal Customer Profile from source material, research, and analysis. The output is a 10-section document that serves as the single reference for all targeting, messaging, and qualification decisions.

A strong ICP is specific enough to say "no" to bad-fit prospects. If the ICP could describe any B2B company, it's too generic. Every section should contain details that are unique to this market and product.

## Inputs

- **Source material** (required) — any combination of: existing customer data, sales call transcripts, CRM exports, website content, founder notes, or a brief description of the business
- **Company website** (optional) — for additional context
- **Existing ICP** (optional) — current ICP to refine or rebuild
- **Questions to answer** (optional) — specific gaps the user wants filled

## Steps

### Step 1 — Analyze Source Material

Read all provided materials thoroughly. Extract:
- Patterns in existing customers (industries, sizes, stages)
- Language buyers use to describe their problems
- Common buying triggers mentioned in calls or notes
- Deal characteristics (size, cycle length, win/loss reasons)
- Any stated or implied segmentation

Build a working hypothesis for the ICP based on what the data shows.

### Step 2 — Research Online to Fill Gaps

Use WebSearch and WebFetch to supplement the source material:
- Research the company's market and typical buyers
- Look at competitor positioning to understand the landscape
- Check industry benchmarks for company size, team structure, and maturity
- Identify common pain points discussed in forums, LinkedIn, or review sites

Focus research on filling specific gaps in the source material, not general market research.

### Step 3 — Ask Targeted Questions (Last Resort Only)

If critical information cannot be found through source material or research, present a focused list of questions. Limit to 5 or fewer. Each question should be:
- Specific (not "tell me about your customers")
- Tied to a gap that blocks a specific ICP section
- Framed with a default assumption ("I'm assuming X based on Y. Is that correct, or should I adjust?")

Do not ask questions if the information can be reasonably inferred.

### Step 4 — Generate the 10-Section ICP Document

Build each section with the following requirements:

**Section 1: Firmographics**
- Industry/vertical (be specific: "B2B SaaS in the fintech space" not "technology companies")
- Revenue range or headcount range
- Geography
- Company stage or maturity indicators
- Funding stage (if relevant)
- Minimum 3 firmographic criteria, maximum 7

**Section 2: Buyer Personas**
- 3-5 personas with titles, reporting lines, and KPIs
- For each persona: what they care about, how they're measured, what keeps them up at night
- Identify which persona is the entry point vs. the economic buyer

**Section 3: Pain Points (In Buyer Language)**
- 5-8 pain points written the way the buyer would describe them
- Not consultant-speak ("misaligned go-to-market strategy") but buyer language ("we're spending money on leads that sales says are garbage")
- Group by persona if pain points differ across roles

**Section 4: Goals and Outcomes**
- What does the buyer want to achieve? Be specific about metrics.
- "Reduce CAC by 30%" not "improve efficiency"
- "Build a repeatable outbound pipeline generating 20 qualified meetings per month" not "grow revenue"

**Section 5: Buying Triggers**
- Specific events that create urgency: new leadership, missed targets, funding round, competitor loss, regulatory change, team growth
- For each trigger: why it creates urgency and what the buyer does next

**Section 6: Anti-ICP and Disqualifiers**
- Binary tests that disqualify a prospect. Each must be answerable with yes/no.
- Examples: "No dedicated sales team" = disqualify. "Revenue under $1M" = disqualify. "Using a competitor with 2+ years remaining on contract" = disqualify.
- Minimum 5 disqualifiers. These save more time than any other section.

**Section 7: Core Positioning Snapshot**
- Feature/Benefit/Value table with 5+ rows
- Each row connects a product capability to a business outcome the buyer cares about
- The value column must reference a metric or KPI from the persona section

**Section 8: Buying Committee Map**
- 4-6 roles in the buying process
- For each: title, role in the decision (champion, evaluator, approver, blocker), what they need to say yes, likely objections
- Define the typical decision-making process (top-down, bottom-up, committee)

**Section 9: Competitive Landscape**
- Top 3-5 alternatives the buyer considers (including "do nothing" and "build in-house")
- For each: what they offer, where they're strong, where they're weak
- Your differentiation angle against each

**Section 10: Intent Signals to Monitor**
- 5-8 observable signals that indicate a company matching this ICP is entering a buying cycle
- For each: what the signal is, where to find it, what it implies
- Prioritize by signal strength (strong correlation vs. weak correlation)

### Step 5 — Run Quality Gate

Review the complete document against these criteria before delivering:
- Is every firmographic criterion specific enough to filter a prospect list?
- Are pain points written in first-person buyer language, not third-person analyst language?
- Are disqualifiers truly binary (yes/no), not subjective?
- Does the buying committee map identify the entry point persona?
- Are intent signals observable and capturable, not theoretical?

## Output Format

```
# Ideal Customer Profile: [Product/Company Name]
Date: [Date]
Version: 1.0

## 1. Firmographics
## 2. Buyer Personas
## 3. Pain Points
## 4. Goals & Outcomes
## 5. Buying Triggers
## 6. Anti-ICP & Disqualifiers
## 7. Core Positioning Snapshot
## 8. Buying Committee Map
## 9. Competitive Landscape
## 10. Intent Signals

## Appendix: Data Sources & Confidence
[List what was based on hard data vs. inference vs. assumption]
```

## Quality Checks

- All 10 sections are complete. No section is skipped or contains placeholder text.
- Pain points use buyer language, not consultant-speak. Read them aloud. Would a VP say this in a meeting?
- Disqualifiers are binary tests. If you can't answer yes/no, rewrite until you can.
- The buying committee map includes 4-6 roles with entry point clearly marked.
- Firmographics are specific enough to build a prospect list from. "Technology companies" fails this test.
- The appendix honestly distinguishes between data-backed findings and inferences.
- The ICP is specific enough that it excludes at least 80% of the total addressable market.

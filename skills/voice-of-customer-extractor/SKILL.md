---
name: voice-of-customer-extractor
description: Synthesize customer language from transcripts, tickets, and reviews into a vocabulary map. Use when someone asks "extract customer language", "voice of customer", "VOC analysis", "what do customers actually say", "buyer language map", or "how do customers describe their problems"
allowed-tools: Read, Write
metadata:
  author: Achille Morin-Lemoine
  version: "1.0.0"
---

# Voice of Customer Extractor

Extract exact phrases buyers use from source material (call transcripts, support tickets, review text, survey responses) and organize them into a vocabulary map. This is not summarization. This is curation of the actual words customers use so that every piece of content, outreach, and sales material speaks in the buyer's language, not yours.

This skill does NOT use WebSearch. It works only with provided source material. The value is in systematic extraction and categorization, not research.

## Inputs

- **Source material** (required) — one or more of: call transcripts, support tickets, review text, survey responses, sales call recordings/notes, onboarding feedback, churn interviews, NPS comments. Provide as files, pasted text, or file paths.
- **Product/service context** (optional) — what you sell, for categorization context
- **Existing messaging** (optional) — current messaging to compare against buyer language
- **Focus areas** (optional) — specific themes to prioritize extraction for

If no source material is provided, ask for it. Do not proceed without source material. This skill cannot fabricate customer language.

## Steps

### Step 1 — Load Source Material and Context

Read all provided source material files. Also check for:
- ICP document — buyer personas to map language by role
- voice of customer.md documents — existing VOC data to build on
- messaging documents — current messaging to compare
- `CLAUDE.md` — project context

Inventory the source material:
- Type of source (transcript, ticket, review, survey)
- Volume (number of documents/entries)
- Roles represented (if identifiable)
- Time period covered

### Step 2 — Extract Problem Language

Read through all source material and extract exact phrases where buyers describe:
- What's broken or not working
- What frustrates them about their current situation
- What they're struggling with
- What's costing them time, money, or credibility

**Extraction rules:**
- Copy the exact phrase. Do not paraphrase, clean up grammar, or make it sound better.
- Include enough surrounding context to make the phrase meaningful (1-2 sentences max).
- Tag each quote with: source type, speaker role (if known), and a theme label.
- If the same sentiment appears in different words across sources, capture each variation separately. Variations are valuable.

Hard cap: Maximum 30 problem language quotes. If you find more, keep the 30 most specific and frequent.

### Step 3 — Extract Outcome Language

Extract exact phrases where buyers describe:
- What they want to achieve
- What "good" looks like for them
- How they measure success
- What the future state should be

Same extraction rules as Step 2. Capture exact words, not polished versions.

Hard cap: Maximum 20 outcome language quotes.

### Step 4 — Extract Objection Language

Extract exact phrases where buyers express:
- Why they hesitate to buy or change
- What concerns they have about the solution
- What they've tried before that didn't work
- Why they think this might not work for them
- Budget, timing, or authority objections

Hard cap: Maximum 15 objection language quotes.

### Step 5 — Extract Evaluation Language

Extract exact phrases where buyers describe:
- How they compare solutions
- What criteria matter most to them
- What questions they ask during evaluation
- How they justify the decision internally
- What they tell their boss when recommending a purchase

Hard cap: Maximum 15 evaluation language quotes.

### Step 6 — Extract Competitor Mentions

Extract any direct references to:
- Competitor products by name
- Competitor comparisons ("unlike X", "better than Y", "we used to use Z")
- Category descriptions ("tools like these", "this type of software")
- Build-vs-buy language

For each mention: capture the exact quote, note the sentiment (positive, negative, neutral toward competitor), and flag any switching triggers.

Hard cap: Maximum 10 competitor mention quotes.

### Step 7 — Categorize Into Themes

Group all extracted quotes into themes. A theme is a recurring topic that appears across multiple quotes and sources. For each theme:
- **Theme name** — descriptive label (e.g., "Manual reporting burden", "No visibility into pipeline health")
- **Quote count** — how many quotes fall under this theme
- **Sources** — which source types contain this theme
- **Roles** — which buyer roles express this theme (if identifiable)
- **Strength** — Strong (5+ quotes from 3+ sources), Moderate (3-4 quotes from 2+ sources), or Weak (fewer than 2 quotes)

Flag any theme with fewer than 2 direct quotes as "Weak signal. Needs more data."

### Step 8 — Run Quality Gate

Before saving, verify:
- [ ] Every phrase is a direct quote from source material, not paraphrased
- [ ] Each quote is tagged with source type and role (if known)
- [ ] Themes with fewer than 2 quotes are flagged as weak signals
- [ ] Problem language is in the buyer's words, not consultant-speak
- [ ] Outcome language describes what the buyer wants, not what your product does
- [ ] Hard caps are respected (30 problem, 20 outcome, 15 objection, 15 evaluation, 10 competitor)
- [ ] No quotes are fabricated or inferred from general knowledge

## Output Format

Save the output to your project. Suggested filename: `voice-of-customer.md`

```
# Voice of Customer: [Product/Company Name]
Date: [Date]
Sources analyzed: [List of source types and counts]
Total quotes extracted: [Count]

## Source Inventory
| Source Type | Count | Roles Represented | Period |
|------------|-------|-------------------|--------|
| ... | ... | ... | ... |

## Problem Language
Exact phrases buyers use to describe what's broken.

### Theme: [Theme Name] — Strength: [Strong/Moderate/Weak]
| Quote | Source | Role |
|-------|--------|------|
| "[Exact quote]" | [Type] | [Role] |
| "[Exact quote]" | [Type] | [Role] |

[Repeat for each problem theme]

## Outcome Language
Exact phrases buyers use to describe what they want.

### Theme: [Theme Name] — Strength: [Strong/Moderate/Weak]
| Quote | Source | Role |
|-------|--------|------|
| "[Exact quote]" | [Type] | [Role] |

[Repeat for each outcome theme]

## Objection Language
Exact phrases buyers use when they hesitate.

### Theme: [Theme Name] — Strength: [Strong/Moderate/Weak]
| Quote | Source | Role |
|-------|--------|------|
| "[Exact quote]" | [Type] | [Role] |

[Repeat for each objection theme]

## Evaluation Language
Exact phrases buyers use when comparing and deciding.

### Theme: [Theme Name] — Strength: [Strong/Moderate/Weak]
| Quote | Source | Role |
|-------|--------|------|
| "[Exact quote]" | [Type] | [Role] |

[Repeat for each evaluation theme]

## Competitor Mentions
| Quote | Competitor | Sentiment | Switching Trigger? |
|-------|-----------|-----------|-------------------|
| "[Exact quote]" | [Name] | [Pos/Neg/Neutral] | [Yes/No] |

## Theme Summary

| Theme | Category | Quotes | Sources | Roles | Strength |
|-------|----------|--------|---------|-------|----------|
| ... | Problem/Outcome/Objection/Eval | ... | ... | ... | ... |

## Gaps and Recommendations
- **Under-represented roles:** [Which buyer roles have thin or no coverage]
- **Missing perspectives:** [What source types would strengthen weak themes]
- **Recommended next steps:** [What data to collect to fill gaps]
```

## Key Principles

1. **Direct quotes only. No exceptions.** The entire value of this skill is capturing actual buyer language. The moment you paraphrase, you lose the specificity that makes VOC data useful. "We're drowning in spreadsheets" is VOC. "They struggle with manual processes" is consulting.
2. **Variations are features, not duplicates.** Three buyers describing the same problem in three different ways gives you three messaging angles. Do not merge them into one sanitized version.
3. **Weak signals are honest signals.** A theme with one quote is not a pattern. Flag it. This prevents building messaging on thin evidence.
4. **Role attribution matters.** A VP saying "I can't see pipeline health" and an SDR saying "I can't see pipeline health" are the same quote with completely different strategic implications.
5. **This skill is extraction, not interpretation.** Extract and categorize. Do not editorialize, analyze sentiment beyond basic tagging, or draw strategic conclusions. That is the job of downstream skills (messaging-matrix, cold-email-writer).

## Anti-Patterns

- **Do not paraphrase or "improve" customer language.** Bad grammar, incomplete sentences, and rough phrasing are the point. Clean language is your language, not theirs.
- **Do not add quotes from general knowledge or market research.** Every quote must trace back to provided source material. If you cannot point to the source, the quote does not belong.
- **Do not over-categorize.** If a quote fits multiple themes, put it in the most specific one. Do not duplicate quotes across themes.

## Chain Triggers

After completing, suggest:
- "Run **messaging-matrix** to translate VOC themes into positioning and messaging"
- "Run **cold-email-writer** to draft outreach using buyer language from the VOC"
- "Run **write-linkedin-post** to create content that mirrors how buyers describe their problems"

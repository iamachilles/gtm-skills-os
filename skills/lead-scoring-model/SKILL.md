---
name: lead-scoring-model
description: Build a lead scoring model with fit and intent dimensions. Use when someone asks "lead scoring", "score leads", "prioritize leads", "lead scoring model", "ICP scoring rubric", "qualify leads automatically", or "lead prioritization"
allowed-tools: Read, Write
metadata:
  author: Achille Morin-Lemoine
  version: "1.0.0"
---

# Lead Scoring Model

Build a structured lead scoring model that combines Fit Score (firmographic match to ICP) and Intent Score (behavioral signals) into a composite score. The output is an anchored rubric where every point is justified and every threshold triggers a specific action.

## Inputs

- **ICP criteria** (required) — firmographic and technographic qualifiers
- **Available signals** (required) — what behavioral data you can actually capture (email engagement, website visits, content downloads, job postings, funding events, etc.)
- **CRM platform** (optional) — to align field names
- **Current scoring model** (optional) — to improve rather than start from scratch

If ICP criteria or available signals are missing, ask before proceeding.

## Steps

### Step 0 — Idempotency Check

Check if operations documents exists. If it does, ask: "A lead scoring model already exists. Do you want to refine the existing model or overwrite it?"

### Step 1 — Load Context

Read these files if they exist:
- ICP document — ICP criteria for fit scoring
- gtm triangle.md documents — positioning and persona context
- intent signals.md documents — signal definitions
- operations documents — available CRM fields
- `CLAUDE.md` — project context

### Step 2 — Define Fit Score Dimensions (0-50 points)

Fit Score measures how well a company matches the ICP. Break it into weighted dimensions:

| Dimension | Max Points | Source Field |
|-----------|-----------|-------------|
| Industry match | 15 | Industry/Sub-industry |
| Company size | 10 | Employee count |
| Geography | 5 | Country/Region |
| Revenue range | 10 | Revenue or funding |
| Technographic match | 5 | Tech stack |
| Persona match | 5 | Contact title/seniority |

For each dimension, create an **anchored rubric** with exact score values:

Example for Industry Match (15 points):
- 15 pts: Exact target sub-industry (e.g., B2B SaaS, Series A-C)
- 10 pts: Adjacent industry (e.g., B2B tech, not SaaS)
- 5 pts: Tangential industry (e.g., professional services selling to tech)
- 0 pts: Outside target market

Every point value must map to a specific, observable criterion. No subjective judgments like "seems like a good fit."

### Step 3 — Define Intent Score Dimensions (0-50 points)

Intent Score measures buying signals and engagement. Only include signals you can actually capture:

| Signal | Points | Decay | Source |
|--------|--------|-------|--------|
| Hiring for relevant role | 10 | 30 days | Job board monitoring |
| Recent funding round | 8 | 60 days | Crunchbase/news |
| Website visit (pricing page) | 7 | 14 days | Analytics |
| Email reply (positive) | 10 | 30 days | Sequencer |
| Content download | 5 | 21 days | CMS |
| LinkedIn engagement | 3 | 14 days | Manual/tool |
| Conference attendance | 5 | 30 days | Event list |
| Technology adoption signal | 7 | 60 days | Technographic tool |

Rules for Intent Score:
- Each signal has a **decay period** after which points expire
- **Cap repeated signals**: same signal type maxes out (e.g., max 2 website visits count, not 50)
- Signals stack: hiring + funding within 30 days is worth more than either alone
- Maximum Intent Score is 50, even if individual signals sum higher

### Step 4 — Set Composite Score Thresholds

Composite Score = Fit Score + Intent Score (0-100)

| Tier | Score Range | Label | Action |
|------|-----------|-------|--------|
| Tier 1 | 80-100 | Hot | Route to rep immediately, prioritize for outreach within 24 hours |
| Tier 2 | 60-79 | Warm | Add to active sequence, rep follows up within 48 hours |
| Tier 3 | 40-59 | Nurture | Add to nurture campaign, re-score monthly |
| Tier 4 | 0-39 | Cold | Archive or exclude, do not spend rep time |

Additional routing rules:
- Fit Score >= 40 AND Intent Score >= 30 = Hot (regardless of composite)
- Fit Score < 20 = Cold (regardless of Intent Score — bad fit is bad fit)
- Intent Score >= 40 AND Fit Score >= 25 = Warm minimum (high intent compensates for moderate fit)

### Step 5 — Define Scoring Rubric Document

For each dimension, write the complete rubric with:
- Dimension name and weight
- Every possible score value with its exact criterion
- Data source and field name
- How to handle missing data (default to 0, or flag for enrichment)

Missing data rule: if a dimension cannot be scored due to missing data, score it as 0 AND flag the record for enrichment. Do not guess.

### Step 6 — Design Score Maintenance Process

- **Re-scoring frequency**: daily for intent signals, weekly for fit (fit rarely changes)
- **Score override process**: reps can manually override scores with a reason (tracked in CRM notes)
- **Model review cadence**: monthly review of score distribution vs. actual conversion rates
- **Calibration**: if 40%+ of leads are "Hot," thresholds are too loose. If fewer than 5% are "Hot," thresholds are too tight.

### Step 7 — Quality Gate

Before saving, verify:
- [ ] Fit Score dimensions sum to exactly 50 maximum points
- [ ] Intent Score dimensions sum to at least 50 possible points (with cap at 50)
- [ ] Every score value has an anchored, observable criterion (no "good fit" or "seems interested")
- [ ] Threshold tiers have specific routing actions, not just labels
- [ ] Missing data handling is defined for every dimension
- [ ] At least one compound rule exists (Fit + Intent combination override)
- [ ] Decay periods are defined for all intent signals

## Output Format

Save the output to your project. Suggested filename: `lead-scoring-model.md`

```markdown
# Lead Scoring Model: [Company Name]
Date: [Date]
Score Range: 0-100 (Fit: 0-50, Intent: 0-50)

## Score Tiers
| Tier | Range | Label | Routing Action | SLA |
|------|-------|-------|---------------|-----|
| 1 | 80-100 | Hot | [Action] | [Timeframe] |
| 2 | 60-79 | Warm | [Action] | [Timeframe] |
| 3 | 40-59 | Nurture | [Action] | [Timeframe] |
| 4 | 0-39 | Cold | [Action] | [Timeframe] |

## Override Rules
- [Compound rule 1]
- [Compound rule 2]

## Fit Score Rubric (0-50)

### [Dimension Name] — [Max Points] pts
| Score | Criterion | Data Source |
|-------|-----------|------------|
| [X] | [Exact observable criterion] | [Field/Source] |
| [Y] | [Exact observable criterion] | [Field/Source] |
| 0 | [Does not match / Missing data] | — |

[Repeat for each dimension]

## Intent Score Rubric (0-50)

### [Signal Name] — [Points] pts
- **Trigger:** [Exact event]
- **Points:** [X]
- **Decay:** [X days]
- **Cap:** [Max times counted]
- **Source:** [Data source]

[Repeat for each signal]

## Missing Data Handling
| Dimension | If Missing | Action |
|-----------|-----------|--------|
| [Dimension] | Score as 0 | Flag for enrichment |

## Maintenance
- Re-scoring: [Frequency]
- Model review: [Cadence]
- Calibration targets: [% distribution per tier]
```

## Key Principles

1. **Anchored rubrics only.** Every score value maps to a specific, observable criterion. "They seem like a good fit" is not a criterion. "50-200 employees, B2B SaaS, Series A-C" is.
2. **Fit gates intent.** A company with high intent but terrible fit is not a lead. Fit Score below the minimum threshold disqualifies regardless of intent.
3. **Only score what you can capture.** Do not include "website visits" in the model if you have no analytics. Aspirational signals create phantom scores.
4. **Decay prevents stale signals.** A job posting from 6 months ago is not a current buying signal. Every intent signal must decay.
5. **Calibrate against reality.** If your model says 60% of leads are "Hot" but only 5% convert, the model is wrong. Review monthly.

## Anti-Patterns

- **"Score everything on a 1-10 gut feeling."** Subjective scoring is not scoring. It is guessing with extra steps. Use observable criteria.
- **"Include 20 scoring dimensions for precision."** More dimensions does not mean more accuracy. It means more noise and more missing data. Keep it to 6-8 dimensions total.
- **"Set thresholds once and never revisit."** Scoring models drift. Conversion data should calibrate thresholds monthly.

## Hard Caps

- Maximum Fit Score: 50 points
- Maximum Intent Score: 50 points
- Maximum total dimensions: 10 (6-8 recommended)
- Minimum decay period for intent signals: 7 days
- Maximum decay period: 90 days

## Chain Triggers

After completing, suggest:
- "Run **crm-field-mapper** to create the CRM fields needed to capture these scores"
- "Run **enrichment-waterfall** to fill the data gaps identified in missing data handling"
- "Run **signal-monitor-setup** to automate the capture of intent signals in this model"

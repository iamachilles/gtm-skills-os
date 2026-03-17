---
description: Score a company's GTM maturity across 7 dimensions and produce a prioritized fix plan
tools: Read, Write, WebFetch, WebSearch
---

# GTM Diagnostic

Evaluate a company's go-to-market readiness by scoring 7 core dimensions on a 1-5 scale. The diagnostic surfaces exactly where the GTM engine is broken or underperforming, identifies the 3 highest-leverage fixes, and produces a Phase 1 scope proposal that can be used as a project kickoff or sales tool.

This is a strategic assessment, not a checklist. Each dimension should be scored based on evidence (website copy, observable systems, stated processes) rather than assumptions.

## Inputs

- **Company name** (required) — the company to diagnose
- **Company website** (required) — URL to scrape for positioning, messaging, and product info
- **Additional context** (optional) — notes from a discovery call, internal docs, or CRM data
- **Industry vertical** (optional) — helps calibrate scoring benchmarks

## Steps

### Step 1 — Collect Company Information

Gather all available context. Read any provided documents or notes. Identify what you already know and what gaps remain.

### Step 2 — Scrape and Analyze Website

Use WebFetch to pull the company's homepage, product/solution pages, pricing page, and about page. Extract:
- How they describe what they do (positioning)
- Who they say they serve (ICP signals)
- How they differentiate (competitive claims)
- What proof they offer (case studies, logos, numbers)
- What their conversion path looks like (CTAs, demo flow)

### Step 3 — Research Online Presence

Use WebSearch to find:
- Recent funding, press, or leadership changes
- G2/Capterra reviews or analyst mentions
- LinkedIn company page activity and employee count trends
- Job postings (which roles they're hiring for reveals priorities)
- Competitor comparisons or market positioning

### Step 4 — Score Each Dimension (1-5)

Score each dimension using the rubric below. Provide 2-3 sentences of evidence justifying each score.

**Scoring rubric:**
- **1 — Not started:** No visible effort or infrastructure
- **2 — Ad hoc:** Some activity but no system, inconsistent
- **3 — Emerging:** Basic system in place, partially working
- **4 — Operational:** Clear system, producing results, room to optimize
- **5 — Advanced:** Mature, measurable, and continuously improving

**The 7 dimensions:**

1. **ICP Clarity** — Do they know exactly who they sell to? Is it specific enough to drive targeting? Can you tell from their website who the ideal buyer is?
2. **Signal Infrastructure** — Do they capture buying signals (intent data, hiring triggers, funding events, content engagement)? Can they identify accounts in-market?
3. **Outbound System** — Is there a repeatable outbound motion? Sequences, personalization, multichannel cadences, or is it ad hoc LinkedIn DMs?
4. **Content & Demand Gen** — Are they creating content that attracts and educates their ICP? LinkedIn, blog, newsletter, events? Is it consistent?
5. **Sales Process** — Is there a defined sales process with stages, qualification criteria, and handoff points? Or is every deal handled differently?
6. **Data & Tooling** — CRM hygiene, enrichment tools, sequencing tools, analytics. Is the tech stack enabling or just creating shelfware?
7. **Measurement** — Do they track pipeline metrics, conversion rates, CAC, deal velocity? Can they tell what's working?

### Step 5 — Identify Top 3 Highest-Leverage Fixes

From the scored dimensions, identify the 3 fixes that would create the most impact. Prioritize by:
- Severity of the gap (lowest scores)
- Dependency (some fixes unlock others)
- Speed to impact (what can show results in 30-60 days)

Each fix must be specific and actionable. Not "improve outbound" but "build a 10-touch multichannel sequence targeting VP Sales at Series B SaaS companies using the job-posting hiring signal."

### Step 6 — Produce Phase 1 Scope Proposal

Based on the top 3 fixes, draft a Phase 1 engagement scope:
- Objective (what changes by the end of Phase 1)
- Deliverables (specific outputs)
- Timeline (typically 6-8 weeks)
- Dependencies (what's needed from the client)
- Success metrics (how to measure progress)

## Output Format

Write a single document with these sections:

```
# GTM Diagnostic: [Company Name]
Date: [Date]

## Executive Summary
[3-4 sentences: overall GTM maturity, biggest gap, recommended starting point]

## Dimension Scores

| Dimension | Score | Summary |
|-----------|-------|---------|
| ICP Clarity | X/5 | ... |
| Signal Infrastructure | X/5 | ... |
| Outbound System | X/5 | ... |
| Content & Demand Gen | X/5 | ... |
| Sales Process | X/5 | ... |
| Data & Tooling | X/5 | ... |
| Measurement | X/5 | ... |
| **Overall** | **X/5** | |

## Detailed Scoring
[2-3 sentences of evidence per dimension]

## Top 3 Highest-Leverage Fixes
[Specific, actionable recommendations]

## Phase 1 Scope Proposal
[Objective, deliverables, timeline, dependencies, success metrics]
```

## Quality Checks

- Every dimension has a score AND evidence. No dimension left blank or scored without justification.
- Fixes are specific enough that someone could start executing them tomorrow.
- The scope proposal connects directly to the identified fixes.
- No generic consulting language. Use concrete, observable language.
- The overall score is the average of all 7 dimensions, rounded to one decimal.
- If information was unavailable for a dimension, state what was missing and score conservatively.

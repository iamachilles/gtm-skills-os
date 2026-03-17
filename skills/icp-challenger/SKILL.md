---
description: Stress-test ICP assumptions against data and research. Trigger phrases — "challenge the ICP", "stress test ICP", "validate ICP", "ICP assumptions", "are we targeting the right companies"
tools: Read, Write, WebSearch
---

# ICP Challenger

Systematically stress-test every assumption in an existing ICP document. The goal is to find where the ICP is wrong, incomplete, or unvalidated before those gaps cost pipeline and deals.

Most ICPs are built on a mix of data, intuition, and hope. This skill separates the three. Assumptions that survive the challenge become stronger. Assumptions that fail get flagged for revision.

## Inputs

- **ICP document** (required) — an existing ICP to challenge. If `docs/icp.md` exists, load it automatically.
- **Win-loss data** (optional) — if `docs/analytics/win-loss-analysis.md` exists, load it to cross-reference
- **Deal data or CRM export** (optional) — closed-won and closed-lost customer data for validation
- **Market signals** (optional) — any new information that might invalidate current assumptions (market shifts, new competitors, regulation changes)
- **Specific concerns** (optional) — particular assumptions the user wants tested

If no ICP document exists, stop and suggest running `icp-model-creator` first.

## Steps

### Step 1 — Load All Available Context

Read existing project documents:
- `docs/icp.md` — the ICP being challenged (required)
- `docs/analytics/win-loss-analysis.md` — deal outcome patterns
- `docs/competitors/competitive-analysis.md` — competitive landscape
- `docs/market-sizing.md` — market size assumptions
- `CLAUDE.md` — company context

Extract every explicit and implicit assumption from the ICP. An assumption is any statement that could be wrong. Examples:
- "Our buyers are VP-level" (assumption: seniority is correct)
- "Revenue between $10M-$50M" (assumption: size band is right)
- "Main pain point is manual reporting" (assumption: this is actually a pain)

List every assumption found. Target at least 10-15 assumptions from a full ICP.

### Step 2 — Categorize Assumptions

Sort each assumption into one of four categories:

| Category | Definition | Example |
|----------|-----------|---------|
| Firmographic | Company characteristics (size, industry, geography) | "Target companies have 50-200 employees" |
| Persona | Buyer role, seniority, decision authority | "CFO is the economic buyer" |
| Pain/Need | Problems, goals, buying triggers | "Main trigger is failed audit" |
| Competitive | Alternatives, switching behavior, market position | "Primary competitor is manual spreadsheets" |

### Step 3 — Test Assumptions Against Closed-Won Data

If win-loss data or deal data is available, test each assumption:
- Do closed-won customers actually match the firmographic criteria?
- Were the stated personas actually involved in won deals?
- Did the stated pain points come up in sales conversations?
- Were the predicted competitors actually encountered?

For each assumption, record:
- **Confirmed:** Data supports the assumption (cite the evidence)
- **Partially confirmed:** Some data supports it, but with exceptions
- **Challenged:** Data contradicts the assumption
- **Unvalidated:** No data available to test this assumption

### Step 4 — Test Assumptions Against External Research

Use WebSearch to validate or challenge assumptions that lack internal data:

- "{industry} buyer persona survey {year}" — who actually buys in this space?
- "{pain point} priority CIO survey" — is this really a top pain?
- "{industry} company size distribution {geography}" — is the size band accurate?
- "{competitor} market share" — are the competitive assumptions right?
- "{industry} buying process" — does the buying committee match?
- "{trigger event} frequency {industry}" — how often do stated triggers actually occur?
- "average deal size {industry} {solution type}" — does the pricing assumption hold?

If WebSearch returns nothing relevant for a query, record the assumption as "Unvalidated — no external data found." Never fabricate validation.

### Step 5 — Surface Blind Spots

Blind spots are things the ICP doesn't mention that it should. Look for:

- **Missing segments:** Are there adjacent industries or company types being ignored that show buying signals?
- **Missing personas:** Are there roles involved in the buying process that the ICP doesn't list?
- **Missing triggers:** Are there buying triggers happening in the market that the ICP doesn't capture?
- **Missing disqualifiers:** Are there patterns in lost deals that should be disqualifiers but aren't?
- **Over-indexing:** Is the ICP too focused on one segment while ignoring a potentially larger one?

Search for blind spots:
- "{product category} unexpected use cases"
- "{industry} adjacent markets"
- "{product category} who buys besides {stated persona}"

### Step 6 — Score and Rank Assumptions

Score each assumption on two dimensions:

**Validity Score:**
- Confirmed (strong evidence supports it)
- Partially Confirmed (mixed evidence)
- Challenged (evidence contradicts it)
- Unvalidated (no evidence either way)

**Impact Score (if wrong):**
- Critical — changes targeting fundamentally
- High — affects pipeline quality significantly
- Medium — causes some wasted effort
- Low — minor optimization issue

Priority for action = assumptions that are Challenged or Unvalidated AND have Critical or High impact.

### Step 7 — Produce Refined Recommendations

For each challenged or unvalidated assumption, provide:
- What the current ICP says
- What the evidence suggests instead
- A specific recommendation (keep, modify, remove, investigate further)
- How to test the recommendation (what data to collect, what experiment to run)

### Step 8 — Run Quality Gate

Before saving, verify:
- [ ] At least 10 assumptions were extracted and tested
- [ ] Every assumption has a validity score with supporting evidence or "no data found"
- [ ] Blind spots section identifies at least 2 areas the ICP doesn't cover
- [ ] Recommendations are specific enough to act on (not "refine the ICP")
- [ ] No assumption was marked "Confirmed" without citing evidence
- [ ] Challenged assumptions include what the evidence suggests instead

## Output Format

Save to `docs/icp-challenge.md`:

```markdown
# ICP Challenge Report: [Product/Company Name]
Date: [Date]
ICP Version Tested: [version or date of the ICP]

## Executive Summary
[3-4 sentences: how many assumptions tested, how many confirmed/challenged/unvalidated, biggest finding]

## Assumption Audit

| # | Category | Assumption | Validity | Impact | Evidence | Recommendation |
|---|----------|-----------|----------|--------|----------|----------------|
| 1 | Firmographic | [Statement] | Confirmed | — | [Source] | Keep |
| 2 | Persona | [Statement] | Challenged | Critical | [What data shows] | [Specific change] |
| 3 | Pain/Need | [Statement] | Unvalidated | High | No data found | [How to test] |
| [etc.] | | | | | | |

## Challenged Assumptions — Deep Dive

### [Assumption text]
- **Current ICP says:** [quote from ICP]
- **Evidence found:** [what contradicts it]
- **Recommended change:** [specific modification]
- **How to validate:** [experiment or data to collect]

[Repeat for each challenged assumption]

## Blind Spots Identified

### [Blind Spot 1]
- **What's missing:** [description]
- **Why it matters:** [potential impact]
- **Evidence:** [what suggests this is a gap]
- **Recommended action:** [investigate, add to ICP, or deprioritize]

[Repeat for each blind spot]

## Validation Scorecard

| Status | Count | % of Total |
|--------|-------|-----------|
| Confirmed | [n] | [x]% |
| Partially Confirmed | [n] | [x]% |
| Challenged | [n] | [x]% |
| Unvalidated | [n] | [x]% |

## Recommended ICP Changes
[Prioritized list of changes to make, ordered by impact]

## Next Steps
- [Specific action 1]
- [Specific action 2]
- [Specific action 3]
```

## Key Principles

1. **Assume the ICP is wrong until proven right.** The default stance is skepticism. Confirmation bias is the enemy of good ICP work.
2. **Evidence over opinion.** "I think our buyers are VPs" is not evidence. "12 of 15 closed-won deals had VP-level champions" is evidence.
3. **Unvalidated is not the same as wrong.** Flag it honestly and recommend how to validate, but don't treat absence of evidence as evidence of absence.
4. **Impact matters more than validity.** A challenged low-impact assumption is less urgent than an unvalidated critical assumption. Prioritize accordingly.
5. **Make it actionable.** Every challenged assumption needs a specific recommendation and a way to test it. "Needs more research" is not actionable.

## Anti-Patterns

- **Do NOT confirm assumptions just because they sound reasonable.** "Companies with 50-200 employees" sounds right for most B2B products. That doesn't mean it IS right for this one. Demand evidence.
- **Do NOT challenge everything for the sake of being contrarian.** If solid data confirms an assumption, say so and move on. The goal is accuracy, not skepticism theater.
- **Do NOT recommend rebuilding the entire ICP.** Focus on the 3-5 changes that would have the biggest impact. Incremental refinement beats total overhaul.

## Skill Chain

- **Chains from:** `icp-model-creator` (provides the ICP to challenge), `win-loss-analyzer` (provides deal data for validation)
- **Chains to:** `icp-model-creator` (refinement loop — update the ICP with validated changes)

> **Next step:** "Want me to update the ICP with the confirmed changes?" or "Should I build a customer interview guide to validate the unconfirmed assumptions?"

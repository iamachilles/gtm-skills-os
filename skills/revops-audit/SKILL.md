---
description: Audit revenue operations across 6 dimensions with scoring and prioritized fixes. Use when someone says "revops audit", "revenue operations audit", "ops assessment", "GTM audit", "sales ops review", "process audit", or "operations health check"
tools: Read, Write
---

# RevOps Audit

Audit revenue operations across 6 dimensions: process maturity, data quality, tool utilization, reporting accuracy, automation coverage, and team alignment. Score each 1-5, identify the top 3 fixes, and estimate effort/impact for each.

Most RevOps problems are invisible until something breaks (a wrong forecast, a missed renewal, a lead that vanished). This audit makes the problems visible before they become crises.

## Inputs

- **Current tools and systems** (required) -- CRM, marketing automation, sales engagement, analytics
- **Team structure** (required) -- who owns what in revenue operations
- **Known pain points** (optional) -- what's already broken or frustrating
- **Revenue metrics** (optional) -- current pipeline, win rates, cycle times, churn
- **Process documentation** (optional) -- existing SOPs, playbooks, or workflows

If tools and team structure are missing, ask: "I need your current tech stack (CRM, automation tools) and team structure (who owns RevOps) to run the audit."

## Steps

### Step 0 -- Check for Existing Output

Read `docs/ops/revops-audit.md` if it exists. If found, present a summary and ask: "A RevOps audit already exists from {date} with scores [list]. Do you want me to (a) re-score based on changes, (b) focus on the top 3 fixes, or (c) rebuild from scratch?"

### Step 1 -- Load Context

Read all available context:

1. `docs/ops/sales-process.md` -- process definitions
2. `docs/ops/handoff-process.md` -- handoff documentation
3. `docs/ops/deal-desk-playbook.md` -- pricing processes
4. `docs/analytics/forecast-model.md` -- reporting maturity
5. `CLAUDE.md` -- project-level instructions

### Step 2 -- Assess Dimension 1: Process Maturity (1-5)

| Score | Criteria |
|-------|----------|
| 5 | All GTM processes documented, enforced via CRM, reviewed quarterly. Reps follow them consistently. |
| 4 | Core processes documented and mostly followed. Some gaps in enforcement. |
| 3 | Key processes exist informally. Some documentation but not enforced in tools. |
| 2 | Processes are ad hoc. Each rep has their own approach. Minimal documentation. |
| 1 | No defined processes. No documentation. Complete chaos. |

Evaluate: sales process, handoff process, deal desk, forecasting, pipeline management, renewal process.

### Step 3 -- Assess Dimension 2: Data Quality (1-5)

| Score | Criteria |
|-------|----------|
| 5 | CRM data is 95%+ complete and accurate. Required fields enforced. Regular hygiene audits. |
| 4 | CRM data is 80%+ complete. Most required fields filled. Occasional duplicates. |
| 3 | CRM data is spotty. 60-80% completion. Known data quality issues not addressed. |
| 2 | CRM data is unreliable. Major gaps in pipeline data. Duplicates rampant. |
| 1 | CRM is a graveyard. Nobody trusts the data. Decisions made on spreadsheets. |

Evaluate: contact data completeness, deal data accuracy, activity logging, duplicate rate, field utilization.

### Step 4 -- Assess Dimension 3: Tool Utilization (1-5)

| Score | Criteria |
|-------|----------|
| 5 | All tools fully adopted, integrated, and actively used by the team. Clear ROI on each. |
| 4 | Core tools well-adopted. Some features underutilized. Minor integration gaps. |
| 3 | Tools adopted but not fully utilized. Some tools only used by part of the team. |
| 2 | Multiple tools with low adoption. Significant overlap. No clear ownership. |
| 1 | Tools exist but nobody uses them. Shelfware. Reps work around the systems. |

Evaluate: CRM adoption, marketing automation usage, sales engagement utilization, analytics tool usage.

### Step 5 -- Assess Dimension 4: Reporting Accuracy (1-5)

| Score | Criteria |
|-------|----------|
| 5 | Single source of truth for all metrics. Dashboards trusted by leadership. Real-time data. |
| 4 | Reliable reporting on key metrics. Some manual reconciliation needed. |
| 3 | Core reports exist but require manual work. Numbers don't always match across systems. |
| 2 | Reporting is mostly manual. Spreadsheets are the primary tool. Data conflicts common. |
| 1 | No consistent reporting. Everyone has different numbers. Decisions based on gut feel. |

Evaluate: pipeline reports, forecast accuracy, marketing attribution, revenue reporting, customer health metrics.

### Step 6 -- Assess Dimension 5: Automation Coverage (1-5)

| Score | Criteria |
|-------|----------|
| 5 | Key workflows automated end-to-end. Lead routing, deal progression, alerts, and handoffs all automated. |
| 4 | Core automations in place. Some manual steps remain for edge cases. |
| 3 | Basic automations exist (lead assignment, email sequences). Many manual processes. |
| 2 | Minimal automation. Most processes require manual effort. Frequent dropped balls. |
| 1 | No automation. Everything is manual. Team drowns in admin work. |

Evaluate: lead routing, deal stage automation, alert triggers, renewal reminders, reporting automation.

### Step 7 -- Assess Dimension 6: Team Alignment (1-5)

| Score | Criteria |
|-------|----------|
| 5 | Marketing, sales, and CS fully aligned on definitions, metrics, and processes. Regular joint reviews. |
| 4 | Good alignment on most definitions. Regular communication. Minor disagreements on lead quality. |
| 3 | Partial alignment. Some shared definitions but frequent friction between teams. |
| 2 | Poor alignment. Marketing and sales disagree on lead quality. CS disconnected from pre-sale. |
| 1 | No alignment. Teams operate in silos. Finger-pointing is the norm. |

Evaluate: MQL definition agreement, handoff satisfaction, shared metrics, meeting cadence, cross-team visibility.

### Step 8 -- Identify Top 3 Fixes

Rank all improvement areas by impact and effort:

For each fix:
- **What to fix:** Specific problem identified
- **Why it matters:** Revenue impact or risk
- **Effort estimate:** Quick win (1-2 weeks), Medium (1-2 months), or Major (3+ months)
- **Impact estimate:** High (directly affects revenue), Medium (affects efficiency), Low (affects morale)
- **Recommended first step:** The specific action to start

Prioritize: High impact / Low effort first. Then High impact / High effort. Skip Low impact / High effort.

### Step 9 -- Quality Gate

- [ ] All 6 dimensions scored with specific evidence, not just a number
- [ ] Scores are honest (not inflated to avoid uncomfortable conversations)
- [ ] Top 3 fixes are ranked by impact, not by what's easiest
- [ ] Each fix has a specific first step, not just a description of the problem
- [ ] Effort estimates are realistic (not everything is a "quick win")
- [ ] The audit identifies root causes, not just symptoms

If any check fails, fix it before proceeding.

## Output Format

Save to `docs/ops/revops-audit.md`:

```markdown
# RevOps Audit
Date: {Date}
Auditor: {Name}
Overall Score: {Sum}/30

## Scorecard
| Dimension | Score | Key Finding |
|-----------|-------|-------------|
| Process Maturity | {1-5} | {One-line finding} |
| Data Quality | {1-5} | {One-line finding} |
| Tool Utilization | {1-5} | {One-line finding} |
| Reporting Accuracy | {1-5} | {One-line finding} |
| Automation Coverage | {1-5} | {One-line finding} |
| Team Alignment | {1-5} | {One-line finding} |

## Detailed Findings

### Process Maturity: {Score}/5
{2-3 sentences on what was found, what's working, what's not}

### Data Quality: {Score}/5
{2-3 sentences}

[Continue for all 6 dimensions]

## Top 3 Fixes (Priority Order)

### Fix 1: {Title}
- **Problem:** {Specific issue}
- **Impact:** {High/Medium/Low} -- {Why}
- **Effort:** {Quick win/Medium/Major}
- **First step:** {Specific action}
- **Expected outcome:** {What changes}

### Fix 2: {Title}
[Same structure]

### Fix 3: {Title}
[Same structure]

## Full Improvement Roadmap
| Fix | Impact | Effort | Priority | Timeline |
|-----|--------|--------|----------|----------|
```

## Key Principles

1. **Score honestly, not diplomatically.** An inflated audit helps no one. If data quality is a 2, say it's a 2. The point is to identify what to fix.
2. **Root causes over symptoms.** "Forecast is inaccurate" is a symptom. "Deal stages have no entry criteria so reps inflate pipeline" is the root cause. Fix root causes.
3. **Prioritize by revenue impact.** Not all ops problems are equal. A broken handoff process (leads going to waste) is more urgent than imperfect dashboards.
4. **Quick wins build momentum.** Start with one high-impact, low-effort fix. Success creates buy-in for the harder fixes.

## Anti-Patterns

- **Boiling the ocean:** Trying to fix all 6 dimensions at once. Pick the top 3 and focus until they're improved.
- **Tool-first thinking:** "We need a new CRM" is rarely the fix. Usually the problem is process or adoption, not the tool itself.
- **Auditing without action:** Running the audit and filing it away. The audit is worthless without the improvement plan being executed.

## What to Do Next

- Fix the #1 issue: likely `/skill sales-process-designer` or `/skill handoff-designer`
- Design the **operating rhythm** to maintain improvements: `/skill weekly-ritual-designer`
- Build the **forecast model** to improve reporting: `/skill forecast-model`

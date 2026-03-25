---
name: crm-hygiene-audit
description: Audit CRM data quality and produce a cleanup action plan. Use when someone asks "audit CRM data", "CRM data quality", "clean up CRM", "fix CRM data", "deduplicate CRM", "CRM hygiene", or "data quality audit"
allowed-tools: Read, Write
metadata:
  author: Achille Morin-Lemoine
  version: "1.0.0"
---

# CRM Hygiene Audit

Audit CRM data quality by checking for duplicates, missing fields, stale records, and inconsistencies. Produces a data quality score and a prioritized cleanup action plan. This skill works from a CRM export (CSV/description) or from a description of the current CRM state.

## Inputs

- **CRM export or description** (required) — a CSV file, sample data, or detailed description of the CRM's current state (record counts, known issues, field fill rates)
- **CRM platform** (optional) — HubSpot, Pipedrive, Salesforce (for platform-specific recommendations)
- **Record count** (optional) — total contacts and companies in the CRM
- **Known pain points** (optional) — what prompted the audit (bad data, bounced emails, messy reports)

If no CRM data or description is provided, ask for at least a summary of record counts and known issues.

## Steps

### Step 0 — Idempotency Check

Check if operations documents exists. If it does, ask: "A CRM hygiene audit already exists. Do you want to run a fresh audit or update the existing one?"

### Step 1 — Load Context

Read these files if they exist:
- operations documents — expected field structure
- operations documents — fields required for scoring
- ICP document — ICP criteria for data validation
- `CLAUDE.md` — project context

### Step 2 — Check for Duplicates

Identify duplicate records by checking these keys:

**Company duplicates:**
- Same domain (primary dedup key)
- Similar company name (fuzzy match: "Acme Corp" vs. "Acme Corporation" vs. "ACME")
- Same phone number across different company records

**Contact duplicates:**
- Same email address (primary dedup key)
- Same first name + last name + company (secondary key)
- Same phone number across different contact records

For each duplicate cluster, note:
- Number of duplicates
- Which record has the most complete data (merge target)
- Which records have conflicting data (needs manual review)

Classify severity:
- **Critical**: same email appearing on multiple contacts with different companies
- **High**: same domain appearing on multiple company records
- **Medium**: similar names that may or may not be duplicates

### Step 3 — Check Missing Required Fields

For each required field (from CRM field spec or standard fields), calculate fill rate:

| Field | Object | Records with Data | Total Records | Fill Rate | Severity |
|-------|--------|------------------|--------------|-----------|----------|
| Email | Contact | — | — | —% | Critical if < 80% |
| Company | Contact | — | — | —% | Critical if < 90% |
| Title | Contact | — | — | —% | High if < 70% |
| Industry | Company | — | — | —% | High if < 60% |
| Employee Count | Company | — | — | —% | Medium if < 50% |
| ICP Score | Company | — | — | —% | High if < 50% |
| Owner | Both | — | — | —% | Critical if < 95% |

Severity thresholds:
- **Critical**: field is essential for outreach or routing and fill rate is below threshold
- **High**: field is needed for scoring or segmentation
- **Medium**: field is useful but not blocking

### Step 4 — Identify Stale Records

Flag records with no activity in defined timeframes:

| Stale Category | Criteria | Action |
|---------------|----------|--------|
| Zombie leads | Contact status = "New" for 90+ days | Re-engage or archive |
| Dead deals | Deal stage unchanged for 60+ days | Close lost or re-qualify |
| Ghost companies | Company with 0 associated contacts | Delete or enrich |
| Inactive contacts | No email sent or received in 90+ days | Re-engage sequence or archive |
| Outdated contacts | Job title last updated 12+ months ago | Flag for re-enrichment |

For each stale category, estimate the number of affected records and the cost of inaction (cluttered pipeline, wasted sequences, skewed reports).

### Step 5 — Check Data Consistency

Look for logical inconsistencies:

- **Status conflicts**: contact marked "Customer" but company marked "Prospect"
- **Orphaned contacts**: contacts with no associated company
- **Impossible values**: negative employee counts, future dates in historical fields, email addresses without @ symbol
- **Picklist pollution**: free-text values in what should be dropdown fields (e.g., Industry = "tech" vs. "Technology" vs. "Tech/SaaS" vs. "Software")
- **Owner mismatches**: contact owned by one rep, company owned by another, deal owned by a third
- **Lifecycle regression**: contacts that went from "Qualified" back to "New" without explanation

### Step 6 — Calculate Data Quality Score

Score the CRM on a 0-100 scale:

| Dimension | Weight | Score Criteria |
|-----------|--------|---------------|
| Duplicate rate | 20% | < 1% = 20, 1-5% = 15, 5-10% = 10, > 10% = 0 |
| Field completeness | 25% | Average fill rate of critical fields |
| Staleness | 20% | % of records active in last 90 days |
| Consistency | 20% | % of records with no logical conflicts |
| Data freshness | 15% | % of records updated in last 6 months |

**Data Quality Score = weighted sum of dimension scores**

| Score Range | Grade | Interpretation |
|-------------|-------|---------------|
| 80-100 | A | Clean CRM, minor maintenance needed |
| 60-79 | B | Acceptable, targeted cleanup recommended |
| 40-59 | C | Significant issues, prioritized cleanup required |
| 20-39 | D | Severe problems, CRM data is unreliable |
| 0-19 | F | CRM is a liability, consider rebuilding |

### Step 7 — Produce Cleanup Action Plan

Prioritize actions by impact and effort:

| Priority | Action | Records Affected | Effort | Impact | Owner |
|----------|--------|-----------------|--------|--------|-------|
| P0 | Merge duplicate companies by domain | [X] records | Low | High | Ops |
| P0 | Fill missing emails via enrichment | [X] records | Medium | High | Ops |
| P1 | Archive stale leads (90+ days inactive) | [X] records | Low | Medium | Sales Mgr |
| P1 | Standardize industry picklist values | [X] records | Medium | Medium | Ops |
| P2 | Re-enrich outdated titles | [X] records | Medium | Low | Ops |
| P2 | Resolve orphaned contacts | [X] records | High | Low | Sales |

For each action, specify:
- Exact CRM operation (merge, update, delete, enrich)
- How to identify the affected records (filter or list view)
- Whether it can be automated or requires manual review
- Estimated time to complete

### Step 8 — Quality Gate

Before saving, verify:
- [ ] Each audit dimension has specific findings, not just "looks okay"
- [ ] Data quality score is calculated with transparent methodology
- [ ] Cleanup actions are prioritized (P0/P1/P2), not just listed
- [ ] Each action specifies how to identify affected records
- [ ] Duplicate detection covers both exact and fuzzy matches
- [ ] Stale record thresholds are defined (not just "old records")
- [ ] Recommendations are realistic for the team size and CRM platform

## Output Format

Save the output to your project. Suggested filename: `crm-hygiene-audit.md`

```markdown
# CRM Hygiene Audit
Date: [Date]
Platform: [CRM]
Total Records: [X companies, Y contacts, Z deals]
Data Quality Score: [X/100] — Grade [A/B/C/D/F]

## Executive Summary
[2-3 sentences: overall data quality, biggest issues, recommended priority]

## Findings

### Duplicates
- Company duplicates: [X] clusters ([Y] total records)
- Contact duplicates: [X] clusters ([Y] total records)
- Severity: [Critical / High / Medium]
- Top duplicate clusters: [List top 5]

### Missing Fields
| Field | Fill Rate | Severity | Impact |
|-------|-----------|----------|--------|
| ... | ...% | ... | ... |

### Stale Records
| Category | Count | % of Total | Recommended Action |
|----------|-------|-----------|-------------------|
| ... | ... | ...% | ... |

### Consistency Issues
| Issue Type | Count | Severity |
|-----------|-------|----------|
| ... | ... | ... |

## Data Quality Score Breakdown
| Dimension | Weight | Score | Weighted |
|-----------|--------|-------|----------|
| Duplicates | 20% | [X/20] | [X] |
| Completeness | 25% | [X/25] | [X] |
| Staleness | 20% | [X/20] | [X] |
| Consistency | 20% | [X/20] | [X] |
| Freshness | 15% | [X/15] | [X] |
| **Total** | **100%** | — | **[X/100]** |

## Cleanup Action Plan
| Priority | Action | Records | Effort | Impact | Method | Owner |
|----------|--------|---------|--------|--------|--------|-------|
| P0 | ... | ... | ... | ... | [Auto/Manual] | ... |

## Prevention Recommendations
- [Required field enforcement]
- [Deduplication automation]
- [Scheduled hygiene reviews]

## Next Audit
Recommended in [X weeks/months] or after cleanup actions are complete.
```

## Key Principles

1. **Measure before you clean.** The data quality score provides a baseline. Without it, you cannot tell if cleanup efforts are working.
2. **Prioritize by impact, not by count.** 50 duplicate companies might matter more than 500 stale contacts. Focus on what affects pipeline and revenue.
3. **Prevention beats cleanup.** Every audit should produce prevention recommendations (required fields, validation rules, dedup automation) alongside the cleanup plan.
4. **Stale records are not innocent.** They skew reports, waste sequence slots, and make reps distrust the CRM. Archive aggressively.

## Anti-Patterns

- **"Just delete everything and start fresh."** You lose history, attribution, and relationship context. Clean surgically, not with a flamethrower.
- **"Run the audit once and forget about it."** Data quality degrades continuously. Schedule recurring audits (quarterly minimum).
- **"Assign cleanup to the sales team without tooling."** Reps will not manually clean 5,000 records. Automate what you can, batch what you cannot.

## Chain Triggers

After completing, suggest:
- "Run **crm-field-mapper** to redesign fields and add validation rules that prevent future issues"
- "Run **enrichment-waterfall** to fill missing fields identified in the audit"
- "Run **lead-scoring-model** to re-score records after cleanup is complete"

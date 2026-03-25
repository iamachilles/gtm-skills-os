---
name: clay-table-designer
description: Architect a Clay table blueprint for a specific workflow. Use when someone asks "design a Clay table", "Clay workflow", "Clay enrichment table", "set up Clay columns", "Clay table architecture", or "build Clay pipeline"
allowed-tools: Read, Write
metadata:
  author: Achille Morin-Lemoine
  version: "1.0.0"
---

# Clay Table Designer

Architect a Clay table blueprint for a specific workflow. This skill produces a column-by-column specification with enrichment order, formula logic, AI prompt columns, and output routing. The output is a human-readable blueprint that someone can implement directly in Clay.

This skill does NOT create the table in Clay. It produces the specification.

## Inputs

- **Workflow description** (required) — what the table should accomplish (e.g., "enrich a list of companies, find decision-makers, score them, push to HubSpot")
- **Data needs** (required) — what data comes in and what needs to come out
- **ICP criteria** (optional) — for building filter and scoring columns
- **Output destination** (optional) — where enriched data goes (CRM, sequencer, Slack, Google Sheet)

If workflow description is missing, ask before proceeding.

## Steps

### Step 0 — Idempotency Check

Determine the workflow slug from the description (e.g., "prospect-enrichment", "signal-monitoring", "lead-scoring"). Check if operations documents exists. If it does, ask: "A Clay table spec for this workflow already exists. Do you want to refine it or overwrite it?"

### Step 1 — Load Context

Read these files if they exist:
- ICP document — ICP criteria for filtering/scoring columns
- operations documents — enrichment provider sequence
- operations documents — scoring logic to implement
- operations documents — CRM field mapping for output columns
- `CLAUDE.md` — project context

### Step 2 — Define Input Columns

Specify what data enters the table:

| Column Name | Type | Source | Required | Example |
|------------|------|--------|----------|---------|
| Company Name | Text | Import / Webhook | Yes | "Acme Corp" |
| Domain | Text | Import / Webhook | Yes | "acme.com" |
| LinkedIn URL | URL | Import | No | "linkedin.com/company/acme" |

Input sources: CSV import, webhook trigger, Clay integration (CRM pull), or manual entry.

Define the **trigger method**: how rows enter the table (manual import, scheduled CRM sync, webhook from n8n/Zapier, or Clay's built-in source integrations).

### Step 3 — Define Enrichment Columns

For each enrichment step, specify the Clay enrichment to use:

| Column Name | Clay Enrichment | Input Column(s) | Output Fields | Order | Condition |
|------------|----------------|-----------------|--------------|-------|-----------|
| Company Info | Clearbit Company Enrich | Domain | Size, Industry, Revenue | 1 | Always |
| Find Contacts | Apollo People Search | Domain + Title filter | Name, Email, Title | 2 | After Company Info |
| Verify Email | Email Verifier | Email | Status, Catch-All flag | 3 | Only if email found |

Rules:
- Order matters: enrichments that depend on prior data must run after their dependencies
- Use **conditions** to avoid wasting credits (don't verify emails that were not found)
- Note Clay credit cost per enrichment where known
- If an enrichment waterfall exists in docs, follow that provider sequence

### Step 4 — Define Formula Columns

Formula columns compute values from enrichment results:

| Column Name | Formula Type | Logic | Output |
|------------|-------------|-------|--------|
| ICP Fit | Score formula | IF(industry in [list], 15, 0) + IF(size between 50-500, 10, 0) + ... | Number (0-50) |
| Company Tier | Categorize | IF(ICP Fit >= 40, "A", IF(ICP Fit >= 25, "B", "C")) | Text |
| Email Status | Conditional | IF(verified = true AND catch_all = false, "Valid", "Skip") | Text |

For scoring formulas, reference the lead scoring model if one exists. Translate the rubric into Clay formula logic.

### Step 5 — Define AI Prompt Columns

Specify columns that use Clay's AI (GPT/Claude) for extraction or generation:

| Column Name | AI Model | Prompt | Input Columns | Output Format |
|------------|----------|--------|--------------|--------------|
| Personalization Hook | Claude | "Based on this company description: {company_description} and this person's title: {title}, write a one-sentence personalization hook for a cold email about [product]. Be specific, reference something observable." | Company Description, Contact Title | Text (1 sentence) |
| Pain Point Inference | Claude | "Given this company: {name}, industry: {industry}, size: {size}, and these signals: {signals}, what is the most likely operational pain point related to [your solution]? One sentence, specific." | Name, Industry, Size, Signals | Text (1 sentence) |

Rules for AI columns:
- Prompts must reference specific input columns using `{column_name}` syntax
- Always specify the expected output format and length
- Include anti-hallucination instructions: "Only reference information provided in the input columns. Do not make up facts."
- AI columns should run AFTER all enrichment and formula columns (they need the data)

### Step 6 — Define Output Columns

Specify which columns get pushed to the destination:

| Column Name | Destination Field | Destination | Condition |
|------------|------------------|-------------|-----------|
| Company Name | company_name | HubSpot | Always |
| Email | email | HubSpot | Only if Email Status = "Valid" |
| ICP Fit Score | icp_score | HubSpot | Always |
| Personalization Hook | custom_personalization | Lemlist | Only if Tier = "A" or "B" |

Define the **push trigger**: what condition must be met before a row is pushed (e.g., "ICP Fit >= 25 AND Email Status = Valid").

### Step 7 — Define Views and Filters

Specify saved views for the table:

| View Name | Filters | Sort | Purpose |
|-----------|---------|------|---------|
| Ready to Push | Email Status = Valid AND Tier in (A, B) | ICP Fit DESC | Records ready for CRM/sequencer |
| Needs Enrichment | Email = blank OR Company Info = blank | Created date ASC | Records that failed enrichment |
| Review Required | Tier = "C" AND ICP Fit between 20-30 | ICP Fit DESC | Borderline records for manual review |

### Step 8 — Quality Gate

Before saving, verify:
- [ ] Enrichment columns run in the correct order (dependencies respected)
- [ ] Conditions prevent wasted credits (no enrichment on already-complete data)
- [ ] Formula columns match the scoring model if one exists
- [ ] AI prompts include anti-hallucination instructions
- [ ] Output push has a condition (never push unqualified or unverified records)
- [ ] At least one filter view exists for failed/incomplete enrichments
- [ ] Credit cost estimates are noted for each enrichment column

## Output Format

Save the output to your project. Suggested filename: `clay-table-{workflow-slug}.md`

```markdown
# Clay Table Blueprint: [Workflow Name]
Date: [Date]
Purpose: [One-sentence description]
Trigger: [How rows enter the table]
Output: [Where enriched data goes]

## Column Specification

### Input Columns
| # | Column Name | Type | Source | Required |
|---|------------|------|--------|----------|
| 1 | ... | ... | ... | ... |

### Enrichment Columns
| # | Column Name | Provider | Input | Output | Order | Condition | Est. Credits |
|---|------------|----------|-------|--------|-------|-----------|-------------|
| ... | ... | ... | ... | ... | ... | ... | ... |

### Formula Columns
| # | Column Name | Logic | Output Type |
|---|------------|-------|------------|
| ... | ... | [Full formula] | ... |

### AI Columns
| # | Column Name | Model | Prompt | Inputs | Output Format |
|---|------------|-------|--------|--------|--------------|
| ... | ... | ... | [Full prompt text] | ... | ... |

### Output Columns
| # | Column Name | Destination | Destination Field | Push Condition |
|---|------------|-------------|------------------|---------------|
| ... | ... | ... | ... | ... |

## Views
| View Name | Filters | Purpose |
|-----------|---------|---------|
| ... | ... | ... |

## Estimated Costs
- Credits per row: [X]
- Monthly volume: [X rows]
- Monthly cost: [$X]

## Implementation Notes
- [Dependencies or prerequisites]
- [Rate limit considerations]
- [Manual steps required]
```

## Key Principles

1. **Column order is execution order.** Clay runs enrichments left to right. If Column C needs data from Column B, Column B must be to the left. Plan the sequence before naming columns.
2. **Conditions save credits.** Every enrichment column should have a condition that prevents it from running on rows where the data already exists or the record is disqualified.
3. **AI columns come last.** They need enriched data as input. Running AI on empty columns produces hallucinated output.
4. **One table, one workflow.** Do not design a single table that does prospect enrichment AND signal monitoring AND lead scoring. Split into focused tables.
5. **Anti-hallucination is non-negotiable.** Every AI prompt column must include instructions to reference only provided data.

## Anti-Patterns

- **"Put everything in one mega-table with 50 columns."** Large tables are slow, hard to debug, and expensive. Keep tables under 20 columns. Split complex workflows into chained tables.
- **"Run every enrichment on every row."** Use conditions to skip enrichments for rows that already have data or do not qualify. Clay credits are money.
- **"Trust AI output without verification."** AI columns should inform human review, not replace it. Flag AI-generated content for review before it reaches prospects.

## Hard Caps

- Maximum 20 columns per table (split if needed)
- AI prompt columns must include anti-hallucination instructions
- Output push requires at least one quality condition
- Enrichment columns must specify credit cost estimates

## Chain Triggers

After completing, suggest:
- "Run **enrichment-waterfall** to define the provider sequence for enrichment columns"
- "Run **lead-scoring-model** to define the scoring logic for formula columns"
- "Run **n8n-workflow-builder** to design the automation that triggers this Clay table"

# How to Write a Production-Quality SKILL.md

> Internal reference for building GTM Skills OS skills. Based on analysis of 11 production-tested skills, 12 community skills (marketingskills, gtm-agents, gtm-engineer-playbook), and best practices guides.

---

## Structural Template

Every skill follows this skeleton:

```markdown
---
description: [what it does + when to use it, with trigger phrases]
tools: [explicit comma-separated tool list]
---

# Skill Name

[1-2 sentence framing: what the agent is doing and what the output is used for]

## Inputs

- **Input 1** (required) — description
- **Input 2** (optional) — description

If required inputs are missing, ask the user before proceeding. Do not guess.

## Execution Steps

### Step 1 — Load Context
Read any relevant project files (CLAUDE.md, ICP docs, etc.) before doing anything else.

### Step 2 — Research
[Concrete search queries with fill-in variables, not "research the topic"]

### Step 3 — Build the Deliverable
[Core work with rubrics, frameworks, and specific instructions]

### Step 4 — Quality Gate
[Binary checks — self-correct any failures before saving]

### Step 5 — Deliver Output
[Explicit format, save location, and what to report back]

### Step 6 — Chain to Next Skill
[Trigger prompts for downstream skills]

## Key Principles
[3-6 behavioral calibration rules]
```

---

## The 14 Patterns That Matter

### 1. Frontmatter = Contract
- `description`: what it does + trigger phrases ("Use when...")
- `tools`: explicit capability list — only declare what's needed

### 2. Input Gate — Ask Before Proceeding
- List required vs optional inputs clearly
- Use AskUserQuestion if inputs are missing
- Exception: if user already provided everything, skip the ask
- Never proceed with missing required inputs

### 3. "Read Context First" as Step 1
- Always check for project-level context (CLAUDE.md, ICP files, existing deliverables)
- List what to look for, not hardcoded paths
- Example: "Check if the project has an ICP document. If found, read it before proceeding."

### 4. Concrete Search Queries, Not Abstract Instructions
BAD: "Research the company's competitors"
GOOD: "WebSearch: '[company name] alternatives', '[company name] vs', 'best [product category] tools 2026'"

BAD: "Look at their job postings"
GOOD: "WebSearch: '[target title]' '[industry]' job description — read responsibilities and requirements sections"

Always provide 3-5 specific search query templates with {variables}.

### 5. Anchored Scoring Rubrics
When scoring or prioritizing, provide anchor definitions:
```
- 5: [concrete example of excellent]
- 3: [concrete example of mediocre]
- 1: [concrete example of terrible]
```
Don't just say "rate 1-5" — calibrate what each level means.

### 6. Quality Gates Before Save
Run 3-5 binary checks before delivering output. Format:
```
Check 1 — [Name]: [specific test]. If failing, [specific fix instruction].
Check 2 — [Name]: [specific test]. If failing, [specific fix instruction].
```
The quality gate is a loop: self-correct failures, don't just flag them.

### 7. Template-Driven Output
Define the exact output structure with:
- Section headings
- Table column names
- Placeholder syntax: {variable}
- Conditional notes: "Remove sections that don't apply"
- Minimum requirements: "At least 5 rows in this table"

### 8. Trigger Prompts for Chaining
End every skill with a pre-formatted block for the next skill:
```
--- NEXT: [Skill Name] ---
/skill-name

Input 1: {value from this skill's output}
Input 2: {value from this skill's output}
```

### 9. Named Anti-Patterns
Include 2-3 explicit "don't do this" examples:
- "If it sounds like a press release, rewrite it"
- "Not 'we help companies grow' — that's the whole point of this skill"
- "'Best', 'leading', 'innovative' are banned words"

These calibrate judgment better than positive instructions alone.

### 10. Conditional Branches with Decision Rules
For optional steps, provide if/else:
```
If the user wants competitor analysis:
  → Run [specific steps]
If not:
  → Note "Section X: Pending — not run" and continue
```
Always define the skip path, not just the do path.

### 11. "Ask Questions as Last Resort" Hierarchy
1. Exhaust source material first
2. Exhaust online research second
3. Ask the user third — max 3-5 questions, each referencing the exact gap

### 12. Behavioral Calibration in Key Principles
End with 3-6 rules that shape HOW the model executes:
- "Timing > copy: a mediocre message at the right moment beats a perfect message at the wrong one"
- "Hiring signals > press releases — what a company hires for reveals actual strategy"
These aren't steps — they're judgment anchors.

### 13. Structured Return Blocks for Inter-Skill Injection
If this skill feeds another, define the exact output shape:
- "Return a markdown block formatted for injection into Section 9 of the ICP document"
- This is the inter-skill API contract

### 14. Thin Wrappers Are Valid
For simple skills, ~30-50 lines is fine:
- Collect inputs
- Define rules and constraints
- Point to the output format
- Don't over-engineer what doesn't need engineering

---

## Line Count Guidelines

| Skill complexity | Lines | Has template? |
|-----------------|-------|---------------|
| Simple (single output) | 60-100 | No |
| Medium (multi-step research) | 100-150 | Optional |
| Deep (multi-section deliverable) | 150-250 | Yes |

---

## Additional Patterns from Community Research

### 15. Context Loading Before Questions (Load-Then-Ask)
Before asking the user anything, check if context already exists in project files.
```
### Step 1 — Context Loading
Check if `docs/icp.md` exists using Read.
If it exists: load it, extract relevant fields, summarize to user.
If not: ask these questions: [...]
```

### 16. Anti-Fabrication Rules
Explicitly state the LLM must not fabricate data. If WebSearch returns nothing, write "No signal detected." Every factual claim must have a source.
```
Rules:
- Every claim must have a source URL. No source, no claim.
- If WebSearch returns nothing, write "Not found." Do not invent.
- Never fabricate company data.
```

### 17. Hard Caps and Constraints
Set explicit numerical limits: word counts, character counts, max items.
```
- Email body: under 100 words (hard cap)
- LinkedIn message: under 300 characters
- Max 5 competitors per run
- Subject lines: 2-6 words
```

### 18. Idempotency — Check Before Overwriting
Before writing output, check if the file already exists. Offer: refine, overwrite, or merge.
```
Step 0 — Check for Existing Output
Read `docs/icp.md`. If it exists:
- Present summary
- Ask: "(A) refine it, (B) start fresh, (C) add a new segment?"
```

### 19. User Confirmation Gates Between Steps
After producing intermediate artifacts (segments, scores, personas), present and confirm before proceeding.
```
Present the segments in a table.
Ask: "Do these look right? Should I adjust any?"
Wait for confirmation before Step 3.
```

### 20. File Convention for Skill Chaining
Skills produce outputs at known paths. Downstream skills check for those files automatically.
```
docs/icp.md          ← ICP Architect output
docs/signals/         ← Signal Scanner output
docs/sequences/       ← Outreach Builder output
docs/battlecards/     ← Battlecard Generator output
```

---

## Quality Spectrum Reference

| Dimension | Low (stubs) | Medium (knowledge) | High (executable) |
|---|---|---|---|
| Line count | 40-50 | 170-300 | 250-400 |
| Inputs | None | Conversational | Load-from-files + explicit questions |
| Steps | One-liners | Section-based | Numbered, strictly ordered |
| Tools | Not mentioned | External tools named | Claude tools + search queries |
| Output | Template names only | Section names | Full markdown templates + file paths |
| Quality | None | Gut-check lists | User gates + hard caps + anti-fabrication |

**Our target: HIGH quality for all skills.**

---

## Common Mistakes to Avoid

1. **Vague research instructions** — "look into competitors" instead of specific search queries
2. **No quality gate** — hoping the first draft is good enough
3. **Over-asking the user** — 10 questions before doing any work
4. **Generic output** — filler like "varies by company" instead of specific answers
5. **No chaining** — skill produces output but doesn't tell the user what to do next
6. **Missing anti-patterns** — positive instructions only, no calibration of "what bad looks like"
7. **Tool hoarding** — declaring tools you don't actually use
8. **No input validation** — proceeding with garbage inputs

---

## GTM Skills OS File Convention

All skills should read from and write to these standard paths. This enables automatic chaining.

```
docs/
├── icp.md                    ← ICP Model Creator output
├── gtm-triangle.md           ← GTM Triangle Builder output
├── buying-committee.md       ← Buying Committee Mapper output
├── sales-narratives.md       ← Sales Narrative Generator output
├── positioning.md            ← Positioning Statement output
├── messaging-matrix.md       ← Messaging Matrix output
├── objection-library.md      ← Objection Library output
├── pricing-strategy.md       ← Pricing Strategy output
├── signals/
│   ├── signal-map.md         ← Intent Signals output
│   └── {company}.md          ← Per-company signal reports
├── competitors/
│   ├── landscape.md          ← Competitor Analysis summary
│   └── {competitor}.md       ← Per-competitor battlecards
├── prospects/
│   ├── prospect-list.csv     ← Build Prospect List output
│   └── {account}.md          ← Per-account research briefs
├── sequences/
│   ├── {persona}-sequence.md ← Outbound sequence per persona
│   └── {trigger}-campaign.md ← Micro-campaign per trigger
├── content/
│   ├── calendar.md           ← Content Calendar output
│   ├── posts/                ← LinkedIn post drafts
│   └── assets/               ← Lead magnets, carousels
├── sales/
│   ├── playbook.md           ← Sales Playbook output
│   ├── battlecards/          ← Competitive battlecards
│   └── proposals/            ← Client proposals
├── analytics/
│   ├── campaign-report.md    ← Campaign Analyzer output
│   └── pipeline-audit.md     ← Pipeline Health Check output
└── ops/
    ├── sales-process.md      ← Sales Process Designer output
    ├── crm-fields.md         ← CRM Field Mapper output
    └── tech-stack-audit.md   ← Tech Stack Auditor output
```

### Convention Rules
1. Every skill's Step 1 checks for upstream files at these paths
2. Every skill's save step writes to the convention path
3. If a file exists, offer to refine/overwrite/merge (idempotency)
4. Use `{slug}` variables derived from company/persona/competitor names
5. Skills that produce multiple files should also update a README or index in their directory

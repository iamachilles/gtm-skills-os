---
description: Analyze job postings to infer company priorities and generate outreach angles. Use when someone asks "analyze their hiring", "what are they hiring for", "job posting signals", "infer company priorities from jobs", or "hiring intent analysis"
tools: Read, Write, WebFetch, WebSearch
---

# Job Posting Analyzer

Analyze a company's active job postings to infer strategic priorities, growth trajectory, and pain points. Job postings are one of the most underused sources of buyer intelligence. They reveal what a company is investing in, what capabilities they lack, and what problems they're trying to solve. This skill turns that raw data into actionable outreach angles.

## Inputs

- **Company name** (required) — the company to analyze
- **Company website** (optional) — for additional context
- **Relevant role types** (optional) — focus area (e.g., "GTM roles", "engineering", "operations"). Defaults to GTM/sales/marketing/ops roles.
- **Your product/service** (optional) — to tailor outreach angle recommendations

If company name is missing, ask before proceeding.

## Steps

### Step 1 — Load Context

Check for and read these files if they exist:
- `docs/prospects/{company-slug}*.md` — existing prospect research
- `docs/icp.md` — ICP criteria to assess fit
- `CLAUDE.md` — project context

### Step 2 — Search for Active Job Postings

Search across multiple job posting surfaces:
- "site:linkedin.com/jobs {company}"
- "{company} careers"
- "{company} open positions"
- "{company} job openings {relevant roles}"
- "site:greenhouse.io {company}"
- "site:lever.co {company}"
- "site:boards.greenhouse.io {company}"
- "{company} hiring {year}"

Use WebFetch to pull career pages and individual job postings when URLs are found. Prioritize:
- GTM roles: Sales, Marketing, Business Development, Revenue Operations, Customer Success, Partnerships
- Leadership roles: VP, Director, Head of (any department)
- Operations roles: RevOps, Sales Ops, Marketing Ops, Data/Analytics

Capture at least 10 postings if available. If fewer than 5 are found, note the limited data and adjust confidence levels accordingly.

### Step 3 — Extract Hiring Signals

For each job posting, extract:

**Role metadata:**
- Job title and seniority level
- Department
- Location (remote/hybrid/on-site and geography)
- Reporting line (if mentioned)

**Priority indicators:**
- Tech stack requirements (specific tools mentioned: Salesforce, HubSpot, Outreach, etc.)
- Responsibilities that reveal current gaps ("build from scratch", "establish the function", "scale the team")
- Growth language ("first hire", "founding member", "building a team of X")
- Pain indicators ("replace existing process", "improve current systems", "streamline workflows")
- Metrics mentioned (ARR targets, team size goals, pipeline numbers)
- Experience requirements that signal maturity level ("startup experience", "enterprise background")

### Step 4 — Categorize and Analyze Patterns

Group findings into these analysis categories:

**1. Hiring velocity and direction**
- Total open roles and department distribution
- Seniority mix (IC vs. management vs. executive)
- New function creation vs. team expansion vs. backfill signals

**2. Strategic priorities inferred**
- What initiatives are they building toward? (e.g., "Hiring 3 SDRs + Sales Manager = building outbound motion")
- What capabilities are they investing in? (e.g., "RevOps hire requiring Salesforce + data tools = CRM infrastructure build")
- What problems are they trying to solve? (e.g., "Demand Gen Manager with ABM experience = shifting from inbound to targeted")

**3. Tech stack signals**
- Tools mentioned across postings (consolidate into a stack picture)
- Missing tools (notable absences that suggest gaps)
- Transition signals ("experience migrating from X to Y")

**4. Growth stage indicators**
- Team size clues from postings (current team mentions, "join a team of X")
- Revenue stage clues (ARR targets, deal size mentions)
- Maturity indicators (process sophistication implied by requirements)

### Step 5 — Map to Outreach Angles

For each major finding, create an outreach angle:

- **Signal observed:** [What the job posting reveals]
- **What it implies:** [The strategic priority or pain point behind the hire]
- **Relevance to your product:** [How your solution connects to this priority]
- **Outreach approach:** [Specific tactic — email, LinkedIn, warm intro path]
- **Opening line:** [One sentence referencing the signal without being creepy]
- **Timing:** [Why now is the right moment to reach out]

Create 3-5 outreach angles ranked by strength of signal.

Guidelines for outreach angles:
- Reference the initiative, not the job posting itself. "I see you're building out your outbound motion" not "I saw your SDR job posting."
- Connect to a pain they're likely experiencing during this transition.
- Be specific about how you help with this exact situation.

### Step 6 — Identify Key Contacts

Based on the hiring patterns, identify:
- **Who is likely driving these hires** — the hiring manager or executive sponsor
- **Suggested contact titles** — who to reach out to based on the org structure implied
- **Best entry point** — which role level and department for initial outreach

### Step 7 — Run Quality Gate

Before saving, verify:
- [ ] At least 5 job postings analyzed (or data limitation noted)
- [ ] Tech stack is consolidated from all postings, not just one
- [ ] Strategic priorities are inferred with reasoning, not just listed
- [ ] Outreach angles reference specific signals, not generic value props
- [ ] Opening lines are natural and non-creepy (no "I stalked your job board")
- [ ] Growth stage assessment is supported by evidence from postings
- [ ] Confidence levels are noted where data is thin

## Output Format

Save to `docs/prospects/{company-slug}-job-analysis.md`:

```
# Job Posting Analysis: [Company Name]
Date: [Date]
Postings analyzed: [Count]
Sources: [LinkedIn, Greenhouse, careers page, etc.]

## Hiring Overview
- **Total open roles:** [Count]
- **Department breakdown:** [Sales: X, Marketing: Y, Ops: Z, etc.]
- **Seniority mix:** [X ICs, Y Managers, Z Directors+]
- **Hiring velocity signal:** [Aggressive growth / Steady scaling / Selective hiring / Backfilling]

## Key Roles

| Title | Seniority | Department | Key Signal |
|-------|-----------|------------|------------|
| ... | ... | ... | ... |

## Tech Stack (From Postings)

| Category | Tools Mentioned | Frequency |
|----------|----------------|-----------|
| CRM | ... | X postings |
| Sales Engagement | ... | X postings |
| Marketing Automation | ... | X postings |
| Analytics/BI | ... | X postings |
| Other | ... | X postings |

## Inferred Strategic Priorities

### Priority 1: [Name]
- **Evidence:** [Which postings and what language supports this]
- **What it means:** [The initiative or problem behind the hire]
- **Confidence:** [High/Medium/Low based on evidence strength]

### Priority 2: [Name]
[Same structure]

### Priority 3: [Name]
[Same structure]

## Growth Stage Assessment
- **Estimated team size:** [Based on clues in postings]
- **Revenue stage signals:** [What postings imply about ARR/stage]
- **Maturity level:** [Early / Growth / Scale / Mature]
- **Evidence:** [Specific language supporting assessment]

## Outreach Angles

### Angle 1: [Name] — Signal Strength: [Strong/Medium]
- **Signal:** [What you observed]
- **Implication:** [What it means for them]
- **Your relevance:** [How you help with exactly this]
- **Opening line:** "[Example]"
- **Timing:** [Why now]
- **Contact to reach:** [Suggested title/role]

### Angle 2: [Name]
[Same structure]

### Angle 3: [Name]
[Same structure]

## Recommended Next Steps
1. [Specific action with timeline]
2. [Specific action]
3. [Specific action]
```

## Key Principles

1. **Job postings reveal strategy.** A company doesn't hire a "Head of Partnerships" casually. Every posting signals a strategic bet. Your job is to read between the lines.
2. **Infer, don't fabricate.** "They're hiring 3 SDRs, which suggests they're building outbound" is inference. "They're struggling with pipeline" is fabrication unless a posting says so. Always show the evidence chain.
3. **Recency matters.** A posting from 6 months ago may be filled. Prioritize recent postings. Note when postings appear stale.
4. **The opening line is everything.** A good job-posting-based outreach feels insightful. A bad one feels like surveillance. Reference the initiative, not the posting.
5. **Consolidate across postings.** The value is in the pattern across 10 postings, not one posting in isolation. A tool mentioned once is a data point. A tool mentioned in 5 postings is a commitment.

## Anti-Patterns

- **Do not copy-paste entire job descriptions.** Extract signals and patterns, not raw text walls.
- **Do not over-infer from a single posting.** One SDR hire could mean many things. Three SDR hires plus a Sales Manager is a pattern.
- **Do not write outreach that references the job posting directly.** "I saw you're hiring..." feels invasive. "Companies building outbound teams at your stage often face..." feels helpful.

## Chain Triggers

After completing, suggest:
- "Run **outreach-personalizer** to craft personalized outreach based on these signals"
- "Run **pre-call-brief** to build a full prospect brief before reaching out"
- "Run **signal-list-generator** to find more companies with similar hiring patterns"

---
description: Generate a one-page pre-call brief for a prospect meeting. Trigger phrases — "pre-call brief", "prep for call", "meeting prep", "research prospect", "brief me on {company}", "call prep"
tools: Read, Write, WebSearch
---

# Pre-Call Brief

Generate a one-page research brief before a prospect call. Covers company context, key stakeholders, buying committee mapping, recent signals, and tailored discovery questions. Everything a rep needs to walk in prepared, nothing they don't.

A good pre-call brief makes the prospect feel like you already understand their world. A bad one is a Wikipedia summary with a logo on top.

## Inputs

- **Company name** (required) -- the prospect company
- **Meeting context** (optional) -- who you're meeting, their role, how the meeting was booked
- **Specific concerns** (optional) -- anything you already know or want to dig into

If company name is missing, ask: "Which company is the call with? I'll research them and build your brief."

## Steps

### Step 0 -- Check for Existing Output

Read `docs/sales/pre-call-{company-slug}.md` if it exists. If found, present a summary and ask: "A pre-call brief for {company} already exists (dated {date}). Do you want me to (a) refresh with new data, or (b) start from scratch?"

### Step 1 -- Load Context

Read available context files:

1. `docs/icp.md` -- qualification criteria to assess fit
2. `docs/gtm-triangle.md` -- positioning and messaging context
3. `docs/personas/` -- relevant persona files for the contact's role
4. `CLAUDE.md` -- project-level instructions

### Step 2 -- Research the Company

Use WebSearch to gather current intelligence. Run these searches:

- `"{company}" news` -- recent press, announcements
- `"{company}" funding` -- investment history, financial context
- `"{company}" leadership team` -- key executives
- `site:linkedin.com "{company}"` -- company page, headcount signals
- `"{company}" hiring` -- open roles reveal strategic priorities
- `"{company}" {industry} challenges` -- market context

Extract and verify:
- What the company does (one sentence)
- Founded / HQ / headcount / funding stage
- Recent news (last 90 days)
- Strategic priorities (inferred from hiring, press, product launches)

### Step 3 -- Identify Key Stakeholders

From research, identify the likely buying committee:
- **Champion** -- who could advocate internally
- **Economic Buyer** -- who controls budget
- **Technical Evaluator** -- who assesses feasibility
- **End User** -- who uses the solution daily
- **Blocker** -- who might resist change

Map the meeting attendee(s) to these roles. If meeting attendee is unknown, flag it and recommend asking before the call.

### Step 4 -- Identify Signals and Triggers

List 3-5 recent signals that create urgency or relevance:
- Hiring patterns (new roles, team expansion)
- Funding events
- Leadership changes
- Product launches or pivots
- Competitor moves in their space
- Regulatory or market shifts affecting them

For each signal, note why it matters to your conversation.

### Step 5 -- Write Discovery Questions

Write 5 discovery questions tailored to this specific company and situation. Each question must:
- Reference something specific to their business (not generic)
- Open a conversation about a pain point you can solve
- Be open-ended (no yes/no questions)

Include a follow-up prompt for each question based on likely answers.

### Step 6 -- Quality Gate

Before saving, verify:

- [ ] Brief fits on one page (~500 words max). Count them.
- [ ] Every data point has a source (URL, search result, or stated as inferred)
- [ ] No fabricated facts -- if data wasn't found, say "not found" rather than guessing
- [ ] Discovery questions reference specific company details, not generic templates
- [ ] Buying committee roles are mapped, even if some are "unknown -- confirm before call"
- [ ] At least 3 signals are identified with relevance explained

If any check fails, fix it before proceeding.

## Output Format

Save to `docs/sales/pre-call-{company-slug}.md`:

```markdown
# Pre-Call Brief: {Company Name}
Date: {Date}
Meeting: {Attendee name + role, if known}

## Company Snapshot
- **What they do:** {One sentence}
- **Founded:** {Year} | **HQ:** {Location} | **Headcount:** {Estimate}
- **Funding:** {Stage / total raised / last round}
- **Industry:** {Sector}

## Recent Signals
1. {Signal} -- {Why it matters to your conversation} [Source: {URL}]
2. {Signal} -- {Why it matters} [Source: {URL}]
3. {Signal} -- {Why it matters} [Source: {URL}]

## Buying Committee Map
| Role | Likely Person | Confidence | Notes |
|------|--------------|------------|-------|
| Champion | {Name/Title} | {High/Med/Low} | {Context} |
| Economic Buyer | {Name/Title} | {High/Med/Low} | {Context} |
| Technical Evaluator | {Name/Title} | {High/Med/Low} | {Context} |
| End User | {Name/Title} | {High/Med/Low} | {Context} |

## Discovery Questions
1. {Question tied to signal or company context}
   - If they say X: {follow-up}
2. {Question}
   - If they say X: {follow-up}
3. {Question}
   - If they say X: {follow-up}
4. {Question}
   - If they say X: {follow-up}
5. {Question}
   - If they say X: {follow-up}

## ICP Fit Assessment
{Quick assessment against ICP criteria -- fit / partial fit / poor fit, with reasoning}

## Talk Track Suggestion
{2-3 sentences on how to open the call based on the research}
```

## Key Principles

1. **Specificity is respect.** A prospect can tell in 30 seconds whether you did your homework. Generic questions signal you didn't care enough to prepare.
2. **Signals beat facts.** Knowing their headcount is table stakes. Knowing they just hired three data engineers tells you where they're investing.
3. **Every data point needs a source.** If you can't cite it, don't include it. Fabricated intel is worse than no intel.
4. **Brevity is the point.** A rep reads this in 5 minutes before the call. If it takes 20 minutes, it won't get read.

## Anti-Patterns

- **Do NOT fabricate company data.** If funding info isn't available, write "Not publicly available" rather than estimating. Wrong facts destroy credibility on the call.
- **Do NOT write generic discovery questions.** "What are your biggest challenges?" is not tailored. "I saw you recently hired a VP of RevOps -- are you rebuilding your pipeline infrastructure?" is.
- **Do NOT include irrelevant background.** The rep doesn't need the company's founding story. They need what matters for this conversation.

## What to Do Next

- Build a **battlecard** if a competitor is in the deal: `/skill battlecard-generator`
- Generate **discovery question set** for a specific framework: `/skill discovery-question-set`
- Write a **follow-up sequence** after the call: `/skill follow-up-sequence`

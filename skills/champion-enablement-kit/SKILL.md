---
name: champion-enablement-kit
description: Create materials your champion can use to sell internally. Trigger phrases — "champion kit", "champion enablement", "internal selling", "help my champion", "one-pager for champion", "internal advocate materials", "champion emails"
allowed-tools: Read, Write
metadata:
  author: Achille Morin-Lemoine
  version: "1.0.0"
---

# Champion Enablement Kit

Create a complete kit of materials your internal champion can use to sell your solution to their colleagues. Includes a one-pager, FAQ, ROI summary, and email templates for different stakeholders. Your champion is selling internally. Give them the words.

Most deals die not because the champion didn't want to buy, but because they couldn't articulate the case to their boss, procurement, and technical team. This skill removes that bottleneck.

## Inputs

- **Prospect company** (required) -- the account
- **Champion name and role** (required) -- who your internal advocate is
- **Solution/scope** (required) -- what you're proposing
- **Key value props** (required) -- the 2-3 outcomes that matter most to this account
- **Proof points** (optional) -- case studies, metrics, references that support the case
- **Known objections** (optional) -- concerns raised by other stakeholders
- **Deal context** (optional) -- stage, competing options, decision timeline

If champion role or key value props are missing, ask: "I need to know who your champion is (role/title) and the top 2-3 value propositions for this account. What outcomes matter most to them?"

## Steps

### Step 0 -- Check for Existing Output

Search the project for any existing output from a previous run of this skill (check common locations like `docs/`, the project root, or any organized output directory). If a previous version is found, present a summary and ask: "A champion kit for {prospect} already exists. Do you want me to (a) update it, or (b) rebuild?" 

### Step 1 -- Load Context

Read available context files:

1. **ICP definition** -- buyer profile context
2. **GTM Triangle** -- positioning and messaging
3. **Messaging matrix** -- persona-specific messaging
4. **Roi Model Prospect** documents -- ROI data if available
5. **Prospect** documents -- proposal if already written
6. `CLAUDE.md` -- project-level instructions

### Step 2 -- Write the One-Pager

Create a single-page document the champion can share with anyone. Structure:

1. **The Problem** (2-3 sentences) -- written in the language of their organization, not yours
2. **The Solution** (2-3 sentences) -- what you're proposing, focused on outcomes
3. **The Proof** (3 bullet points) -- specific metrics or case study references
4. **The Ask** (1 sentence) -- what the champion needs from the reader

The entire one-pager must fit on one printed page. Maximum 250 words.

### Step 3 -- Write the FAQ

Write 10 questions that the champion's boss, procurement team, and technical evaluators will ask. For each:
- The question as they'd actually phrase it
- A concise answer (2-4 sentences max)
- Supporting evidence or reference

Typical question categories:
- Cost and ROI ("What does this cost and what's the payback?")
- Risk ("What if it doesn't work?")
- Alternatives ("Why not build this in-house / use competitor X?")
- Implementation ("How long does this take and what resources do we need?")
- Security/compliance ("Does this meet our requirements?")

### Step 4 -- Write ROI Summary

Create a 3-bullet ROI summary that a non-financial person can understand:
- Bullet 1: The investment (total cost, simply stated)
- Bullet 2: The return (primary financial benefit, with formula)
- Bullet 3: The payback (when they break even)

If a full ROI model exists, pull the key numbers. If not, use the best available data and flag assumptions.

### Step 5 -- Write Email Templates

Create 3 email templates the champion can forward or adapt:

**Email A: To their boss (economic buyer)**
- Subject line
- 4-5 sentences: why this matters, what it costs, what it returns, the ask

**Email B: To procurement**
- Subject line
- 4-5 sentences: what's being purchased, vendor details, timeline, process request

**Email C: To the technical team**
- Subject line
- 4-5 sentences: what the solution does, integration requirements, evaluation request

Each email must sound like it was written by the champion, not by a vendor. Use internal language, not marketing copy.

### Step 6 -- Quality Gate

Before saving, verify:

- [ ] One-pager is under 250 words and fits on one page
- [ ] FAQ covers at least 10 questions across cost, risk, alternatives, implementation, and security
- [ ] ROI summary has exactly 3 bullets that a non-financial person can understand
- [ ] Email templates sound like an internal employee wrote them, not a sales rep
- [ ] No marketing jargon or buzzwords. Language matches how the prospect's team talks.
- [ ] Proof points are specific (named companies, real metrics), not generic claims
- [ ] Each email has a clear, single ask

If any check fails, fix it before proceeding.

## Output Format

Save the output to your project. Suggested filename: `champion-kit-{prospect-slug}.md`

```markdown
# Champion Enablement Kit: {Prospect Company}
Date: {Date}
Champion: {Name, Title}
Solution: {What you're proposing}

---

## One-Pager: {Solution Name}

### The Problem
{2-3 sentences in their organizational language}

### The Solution
{2-3 sentences focused on outcomes}

### The Proof
- {Metric/case study 1}
- {Metric/case study 2}
- {Metric/case study 3}

### The Ask
{One sentence: what you need the reader to do}

---

## FAQ -- Questions Your Team Will Ask

**1. {Question}**
{Answer. 2-4 sentences.}

**2. {Question}**
{Answer.}

[...through question 10]

---

## ROI Summary
- **Investment:** {Total cost, simply stated}
- **Return:** {Primary benefit with formula}
- **Payback:** {When they break even}

---

## Email Templates

### Email A: To {Boss Title}
**Subject:** {Subject line}

{4-5 sentence email body}

### Email B: To Procurement
**Subject:** {Subject line}

{4-5 sentence email body}

### Email C: To Technical Team
**Subject:** {Subject line}

{4-5 sentence email body}

---

## Usage Notes for Champion
- Share the one-pager first. Let it generate questions.
- Use the FAQ to prepare for the meeting, not as a handout.
- Forward the emails as-is or adapt them. The tone is intentionally internal.
- The ROI summary is your closer. Use it when budget is the objection.
```

## Key Principles

1. **Your champion is selling internally. Give them the words.** They know their company, but they don't know your product as well as you do. Bridge that gap.
2. **Internal language beats marketing language.** "This tool improves pipeline velocity" sounds like a brochure. "This helps our reps spend less time on data entry and more time selling" sounds like an employee.
3. **One page, every time.** Executives scan. If the one-pager is two pages, it won't get read. Ruthlessly edit.
4. **Anticipate the skeptic.** The FAQ should answer the toughest questions, not the softballs. If procurement will ask about SOC 2 compliance, include it.
5. **Make forwarding effortless.** The email templates should require zero editing. Copy, paste, send.

## Anti-Patterns

- **Do NOT write materials that sound like they came from a vendor.** The champion loses credibility if their colleagues can tell the emails were ghostwritten by a sales rep.
- **Do NOT skip the hard questions in the FAQ.** Avoiding "What if it doesn't work?" or "Why not use competitor X?" leaves your champion unprepared for the exact moments that matter.

## What to Do Next

- Build a detailed **ROI model** to back up the summary: `/skill roi-calculator`
- Create a **mutual action plan** to keep the deal moving: `/skill mutual-action-plan`
- Write the **proposal** the champion will attach: `/skill proposal-writer`

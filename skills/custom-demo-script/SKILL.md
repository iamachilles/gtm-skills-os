---
description: Write a demo script tailored to a specific account — their use case, pain points, competitive context, and success metrics. Use when preparing a demo for a prospect, customizing a product walkthrough, or writing a demo flow for a strategic account.
tools: Read, Write, WebSearch
---

# Custom Demo Script

You are writing a demo script tailored to a specific prospect account. The demo should feel like it was built for them — referencing their industry, pain points, competitive context, and success metrics. Generic feature tours don't close deals.

## Inputs

- **Company name** (required) — the account you're demoing for
- **Primary contact / persona** (required) — who will be in the room
- **Their use case or stated need** (required) — what problem they want to solve
- **Demo duration** (optional, default: 30 minutes) — total time available
- **Competitive context** (optional) — competitors they're evaluating

If required inputs are missing, ask the user before proceeding.

## Execution Steps

### Step 0 — Check for Existing Script

Check if `docs/sales/demo-script-{company-slug}.md` exists.
If it does, ask: "(A) update it with new context, (B) start fresh, (C) keep it and skip?"

### Step 1 — Load Context

Read these files if they exist:
- `docs/icp.md` — for persona and pain point context
- `docs/sales/pre-call-{company-slug}.md` — for account research
- `docs/sales/battlecards/` — for competitive positioning
- `docs/buying-committee.md` — for stakeholder dynamics
- `CLAUDE.md` — for product context and positioning

### Step 2 — Research the Account

Run these searches to understand their world:
- WebSearch: `"{company}" challenges OR priorities {year}`
- WebSearch: `"{company}" {industry} news`
- WebSearch: `"{primary contact name}" linkedin` — understand their role and priorities

Extract: current challenges, recent initiatives, competitive landscape, metrics they likely care about.

### Step 3 — Design the Demo Flow

Structure the demo in 5 acts:

**Act 1 — Context Setting (3 min)**
- Recap what you've learned about their situation (shows you did homework)
- Confirm the problem they want to solve
- Set the agenda: "I'll show you 3 things relevant to [their use case]"

**Act 2 — The "Aha" Moment (7 min)**
- Lead with the ONE capability that most directly addresses their stated pain
- Show it working with their scenario (use their industry, their data shape, their terminology)
- Connect to their KPI: "This is how [companies like yours] went from X to Y"

**Act 3 — Supporting Capabilities (10 min)**
- Show 2-3 additional features that strengthen the first impression
- Each tied to a secondary pain point or buying criterion
- Weave in competitive differentiators naturally (not "unlike [competitor]..." but "what makes this unique is...")

**Act 4 — Proof (5 min)**
- Reference a case study from a similar company (same industry, size, or use case)
- Share specific results: "Company in [their industry] saw [X metric] improve by [Y%] in [Z weeks]"
- If no exact match, use the closest available proof point

**Act 5 — Close & Next Steps (5 min)**
- Summarize the 3 key takeaways
- Ask: "Which of these resonated most with your team?"
- Propose concrete next step (pilot, technical evaluation, stakeholder presentation)
- Offer to send a follow-up with relevant resources

### Step 4 — Write Objection Preparation

Anticipate the top 3 objections likely to come up during or after the demo:

For each objection:
- **Objection**: what they'll say
- **Root cause**: why they're really concerned
- **Redirect**: how to reframe without being defensive
- **Proof**: specific evidence that addresses the concern

### Step 5 — Quality Gate

Before saving, verify:
- [ ] Demo references the prospect's company name, industry, and use case — not generic
- [ ] Act 2 "Aha" moment directly addresses their stated need, not your favorite feature
- [ ] At least one specific proof point with numbers from a similar company
- [ ] No more than 5 features shown total — focus beats breadth
- [ ] Timing adds up to the allocated demo duration
- [ ] No competitor trash-talking — differentiation is stated positively

If any check fails, revise before saving.

### Step 6 — Save and Report

Write to `docs/sales/demo-script-{company-slug}.md`.

Report:
- Demo structure summary
- Top 3 moments designed to resonate
- Objections prepared for
- Recommended follow-up materials to send after the demo

## Output Template

```markdown
# Demo Script: {Company Name}

**Date:** {YYYY-MM-DD}
**Duration:** {X} minutes
**Primary audience:** {Contact name, title}
**Their stated need:** {One sentence}

---

## Act 1 — Context Setting ({X} min)

**Say:** "{Scripted opening referencing their situation}"

**Confirm:** "{Question to validate their priority}"

**Agenda:** "I'll walk you through three things: [1], [2], [3]."

---

## Act 2 — The "Aha" Moment ({X} min)

**Show:** {Feature/capability}
**Their scenario:** {How this applies to their specific use case}
**Bridge to KPI:** "{Specific outcome statement}"

---

## Act 3 — Supporting Capabilities ({X} min)

### Capability 1: {Name}
**Show:** {What to demonstrate}
**Connect to:** {Their secondary pain point}

### Capability 2: {Name}
**Show:** {What to demonstrate}
**Connect to:** {Their buying criterion}

### Capability 3: {Name}
**Show:** {What to demonstrate}
**Differentiator:** {What makes this unique}

---

## Act 4 — Proof ({X} min)

**Case study:** {Similar company — industry, size, use case}
**Result:** {Specific metric improvement}
**Timeline:** {How long it took}

---

## Act 5 — Close ({X} min)

**Summarize:** "The three things I showed you today: [1], [2], [3]."
**Ask:** "Which of these resonated most with your team?"
**Next step:** {Specific proposal}
**Follow-up:** {What to send after}

---

## Objection Preparation

| Objection | Root Cause | Redirect | Proof |
|-----------|-----------|----------|-------|
| {objection 1} | {why} | {reframe} | {evidence} |
| {objection 2} | {why} | {reframe} | {evidence} |
| {objection 3} | {why} | {reframe} | {evidence} |
```

## What to Do Next

```
--- NEXT: Write Proposal ---
/proposal-writer
Prospect: {company name}
Needs: {from demo discussion}
Scope: {based on what resonated}
```

## Key Principles

1. **Show their problem, not your product.** The demo is about them, not you. Every feature shown must connect to their stated need.
2. **Less is more.** 3 features shown well beats 10 features rushed through. Depth creates conviction.
3. **The "Aha" moment is everything.** If Act 2 doesn't land, the rest is damage control. Invest most of your prep time here.
4. **Proof beats promises.** "A company like yours saw X" is 10x more persuasive than "our platform enables X."
5. **End with their words, not yours.** Ask what resonated. Their answer tells you what to emphasize in the proposal.

## Anti-Patterns

- **The feature parade:** showing every feature in rapid succession. Nobody remembers feature #7.
- **The generic demo:** using fake data or "Acme Corp" when you could use their industry, their metrics, their language.
- **Competitor bashing:** "Unlike [competitor], we..." is defensive. "What makes our approach unique is..." is confident.

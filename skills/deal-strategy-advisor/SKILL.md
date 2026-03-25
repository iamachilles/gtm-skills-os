---
name: deal-strategy-advisor
description: Analyze a deal and recommend next steps to advance or disqualify. Trigger phrases — "deal strategy", "deal review", "analyze this deal", "deal health", "next steps for deal", "should I pursue this deal", "deal stuck"
allowed-tools: Read, Write
metadata:
  author: Achille Morin-Lemoine
  version: "1.0.0"
---

# Deal Strategy Advisor

Analyze a deal's health based on provided notes and stakeholder context, then recommend specific next steps. This is your second opinion on any deal -- identifying gaps you might be too close to see and recommending actions to advance or disqualify.

A deal without a strategy is a deal that depends on luck. This skill removes the luck.

## Inputs

- **Deal notes** (required) -- everything known about the deal: discovery notes, email threads, call summaries, CRM data
- **Stakeholders involved** (required) -- who you've engaged, their roles, and their disposition
- **Current stage** (required) -- where the deal sits in the pipeline (discovery, demo, proposal, negotiation, etc.)
- **Deal size** (optional) -- helps calibrate effort recommendations
- **Competition** (optional) -- known competitors in the deal
- **Target close date** (optional) -- timeline context

If deal notes are missing, ask: "I need your deal notes to analyze this. Share whatever you have: call notes, email context, stakeholder list, and current stage."

## Steps

### Step 0 -- Check for Existing Output

Search the project for any existing output from a previous run of this skill (check common locations like `docs/`, the project root, or any organized output directory). If a previous version is found, present a summary and ask: "A strategy for this deal already exists (dated {date}). Do you want me to (a) update based on new information, or (b) start fresh?" 

### Step 1 -- Load Context

Read available context files:

1. **ICP definition** -- check deal against qualification criteria
2. **GTM Triangle** -- positioning context
3. **Battlecards** documents -- competitive intel if relevant
4. `CLAUDE.md` -- project-level instructions

### Step 2 -- Assess Deal Health

Evaluate each dimension of deal health:

1. **Champion identified?** -- Is there someone inside the account actively selling for you? Rate: Strong / Weak / None
2. **Economic buyer engaged?** -- Have you met or influenced the person who controls budget? Rate: Engaged / Aware / Unknown
3. **Decision criteria known?** -- Do you know what they'll evaluate against? Rate: Known / Partially / Unknown
4. **Decision process mapped?** -- Do you know every step from here to signed contract? Rate: Mapped / Partial / Unknown
5. **Timeline confirmed?** -- Is there a real deadline or event driving urgency? Rate: Hard deadline / Soft goal / No urgency
6. **Competition identified?** -- Do you know who else is in the deal? Rate: Known / Suspected / Unknown
7. **Pain quantified?** -- Can the prospect articulate the cost of their current problem? Rate: Quantified / Acknowledged / Vague
8. **Next step committed?** -- Is there a specific, scheduled next action? Rate: Scheduled / Verbal / None

### Step 3 -- Identify Gaps

For each dimension rated below "strong" or "known," explain:
- What information is missing
- Why this gap puts the deal at risk
- What specific action closes the gap

Prioritize gaps by risk level: which missing piece is most likely to kill the deal?

### Step 4 -- Recommend Actions

Provide exactly 3 specific, actionable next steps. Each action must include:
- What to do
- Who to engage
- What to say or ask
- Expected outcome
- Timeline (when to do this)

Actions should address the highest-risk gaps first.

### Step 5 -- Flag Risks

Identify the top 3 risks to this deal:
- What could go wrong
- How likely it is (High / Medium / Low)
- What the early warning sign would be
- Mitigation strategy

### Step 6 -- Stakeholder Engagement Map

Recommend which stakeholders to engage next:
- Who is missing from the conversation
- Who might be a blocker you haven't identified
- Who could be an additional champion
- Specific approach for each recommended engagement

### Step 7 -- Quality Gate

Before saving, verify:

- [ ] Every health dimension has a rating with supporting evidence from the deal notes
- [ ] Gaps are specific, not generic ("We haven't identified the economic buyer" not "Needs more stakeholder engagement")
- [ ] All 3 recommended actions include who, what, when, and expected outcome
- [ ] Risks are deal-specific, not boilerplate
- [ ] No assumptions stated as facts. If something is inferred, label it as such.
- [ ] Overall deal verdict is honest, even if the answer is "disqualify"

If any check fails, fix it before proceeding.

## Output Format

Save the output to your project. Suggested filename: `deal-strategy-{deal-slug}.md`

```markdown
# Deal Strategy: {Company Name}
Date: {Date}
Stage: {Current Stage}
Deal Size: {Amount}
Target Close: {Date}

## Deal Health Scorecard

| Dimension | Rating | Evidence |
|-----------|--------|----------|
| Champion | {Strong/Weak/None} | {Why} |
| Economic Buyer | {Engaged/Aware/Unknown} | {Why} |
| Decision Criteria | {Known/Partial/Unknown} | {Why} |
| Decision Process | {Mapped/Partial/Unknown} | {Why} |
| Timeline | {Hard/Soft/None} | {Why} |
| Competition | {Known/Suspected/Unknown} | {Why} |
| Pain Quantified | {Yes/Partial/No} | {Why} |
| Next Step | {Scheduled/Verbal/None} | {Why} |

**Overall Health:** {Green / Yellow / Red}

## Critical Gaps
1. {Gap} -- {Risk it creates} -- {Action to close it}
2. {Gap} -- {Risk it creates} -- {Action to close it}
3. {Gap} -- {Risk it creates} -- {Action to close it}

## Recommended Next Steps
1. **{Action}** -- {Who to engage}, {what to say/ask}, {by when}. Expected outcome: {what this unlocks}
2. **{Action}** -- {Details}. Expected outcome: {what this unlocks}
3. **{Action}** -- {Details}. Expected outcome: {what this unlocks}

## Risk Assessment
| Risk | Likelihood | Early Warning | Mitigation |
|------|-----------|---------------|------------|
| {Risk 1} | {H/M/L} | {Signal to watch} | {What to do} |
| {Risk 2} | {H/M/L} | {Signal to watch} | {What to do} |
| {Risk 3} | {H/M/L} | {Signal to watch} | {What to do} |

## Stakeholder Map
| Person | Role | Disposition | Next Action |
|--------|------|------------|-------------|
| {Name} | {Buying role} | {Supporter/Neutral/Blocker} | {What to do} |
| {Unknown} | {Role to find} | {TBD} | {How to identify} |

## Verdict
{One paragraph: honest assessment of deal viability and recommended path forward. Include "disqualify" as an option if warranted.}
```

## Key Principles

1. **Honesty over optimism.** The worst deal strategy is one that tells you what you want to hear. If the deal is weak, say so.
2. **Gaps kill deals.** The deal isn't lost to the competitor. It's lost to the unknown. Every "unknown" in the scorecard is a risk.
3. **Actions must be specific.** "Follow up with the prospect" is not a strategy. "Email the CFO with the ROI model by Thursday to get budget confirmation before their Q2 planning meeting" is.
4. **Champion is non-negotiable.** A deal without a champion is a deal that depends on your sales skills alone. That's not enough for complex B2B.

## Anti-Patterns

- **Do NOT invent information.** If the deal notes don't mention competition, rate it as "Unknown" rather than assuming there's none.
- **Do NOT give generic advice.** Every recommendation must reference something specific from this deal's context.
- **Do NOT sugarcoat.** If a deal should be disqualified, say so clearly. Wasting time on dead deals is the most expensive mistake in sales.

## What to Do Next

- Build a **mutual action plan** for advancing the deal: `/skill mutual-action-plan`
- Create a **champion enablement kit** for your internal advocate: `/skill champion-enablement-kit`
- Generate a **proposal** based on what you've learned: `/skill proposal-writer`

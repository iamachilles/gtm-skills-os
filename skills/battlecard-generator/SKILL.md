---
name: battlecard-generator
description: Create a competitive battlecard for sales conversations. Trigger phrases — "battlecard", "competitive battlecard", "compete against {competitor}", "how to sell against", "competitive positioning", "objection matrix"
allowed-tools: Read, Write, WebSearch
metadata:
  author: Achille Morin-Lemoine
  version: "1.0.0"
---

# Battlecard Generator

Create a competitive battlecard that arms reps with specific talk tracks, trap-setting questions, and objection responses for deals where a named competitor is involved. This is not a feature comparison chart. It's a tactical guide for winning competitive conversations.

The goal is not to trash the competitor. It's to help the prospect make an informed decision that favors you.

## Inputs

- **Competitor name** (required) -- the competitor to build the battlecard against
- **Competitor website** (optional) -- speeds up research
- **Known strengths/weaknesses** (optional) -- anything the team already knows from deal experience
- **Common objections** (optional) -- objections reps hear when this competitor is in the deal

If competitor name is missing, ask: "Which competitor do you need the battlecard for?"

## Steps

### Step 0 -- Check for Existing Output

Search the project for any existing output from a previous run of this skill (check common locations like `docs/`, the project root, or any organized output directory). If a previous version is found, present a summary and ask: "A battlecard for {competitor} already exists (dated {date}). Do you want me to (a) update with new intel, or (b) rebuild from scratch?" 

### Step 1 -- Load Context

Read available context files:

1. **ICP definition** -- your target buyer profile
2. **GTM Triangle** -- your positioning and messaging
3. **Competitive analysis** -- existing competitive intel
4. `CLAUDE.md` -- project-level instructions

### Step 2 -- Research Competitor Positioning

Use WebSearch to gather intelligence:

- `"{competitor}" positioning` -- how they describe themselves
- `"{competitor}" vs` -- comparison articles and discussions
- `"{competitor}" weaknesses` -- known gaps
- `"switching from {competitor}"` -- why customers leave
- `"{competitor}" reviews complaints` -- G2, Capterra, Reddit threads
- `"{competitor}" pricing` -- pricing model and range

Extract:
- Their core positioning claim
- Primary target audience
- Pricing model (if public)
- Key features they emphasize
- What their customers praise
- What their customers complain about

### Step 3 -- Build Objection Matrix

Create a "They Say / The Truth / We Say" matrix for the top 5-7 objections or competitive claims:

- **They Say:** The competitor's claim or the prospect's objection
- **The Truth:** The nuanced reality (acknowledge what's true, clarify what's misleading)
- **We Say:** Your response that redirects to your advantage

Never lie. Never dismiss real strengths. Acknowledge, then redirect.

### Step 4 -- Design Trap-Setting Questions

Write 5 questions that naturally expose the competitor's weaknesses without mentioning them directly. These are questions a rep asks during discovery that lead the prospect to realize a gap on their own.

Good trap question: "How important is it that your team can customize workflows without engineering resources?"
Bad trap question: "Did you know {competitor} requires custom code for every workflow change?"

The prospect should arrive at the conclusion themselves.

### Step 5 -- Identify Deal Killers and Win Themes

**Deal killers** (when they win): 3-5 scenarios where this competitor has a genuine advantage and you're likely to lose. Knowing when to walk away is as valuable as knowing how to win.

**Win themes** (when you win): 3-5 scenarios or buyer priorities where you have a clear advantage. These are the conversations you want to steer toward.

### Step 6 -- Quality Gate

Before saving, verify:

- [ ] No false claims about the competitor. Every weakness cited is sourced or based on documented customer feedback.
- [ ] Objection matrix acknowledges real competitor strengths before redirecting
- [ ] Trap-setting questions are genuinely useful discovery questions, not leading gotchas
- [ ] Deal killers are honest. If you can't win a certain deal type, say so.
- [ ] Win themes are specific enough to guide conversation steering
- [ ] All research points cite sources

If any check fails, fix it before proceeding.

## Output Format

Save the output to your project. Suggested filename: `{competitor-slug}.md`

```markdown
# Battlecard: {Competitor Name}
Date: {Date}
Last Updated: {Date}

## Quick Summary
- **They position as:** {One sentence}
- **They're strong at:** {2-3 bullet points}
- **They're weak at:** {2-3 bullet points}
- **Their pricing:** {Model and range if known}
- **Their typical customer:** {Profile}

## Objection Matrix

| They Say | The Truth | We Say |
|----------|-----------|--------|
| "{Claim 1}" | {Nuanced reality} | "{Our response}" |
| "{Claim 2}" | {Nuanced reality} | "{Our response}" |
| "{Claim 3}" | {Nuanced reality} | "{Our response}" |

## Trap-Setting Questions
Ask these during discovery to expose gaps naturally:
1. {Question} -- exposes: {what it reveals}
2. {Question} -- exposes: {what it reveals}
3. {Question} -- exposes: {what it reveals}
4. {Question} -- exposes: {what it reveals}
5. {Question} -- exposes: {what it reveals}

## When We Win
{Scenarios and buyer priorities where we have the advantage}
1. {Win theme + why}
2. {Win theme + why}
3. {Win theme + why}

## When They Win (Deal Killers)
{Be honest. These are deals to qualify out early.}
1. {Scenario + why they win}
2. {Scenario + why they win}
3. {Scenario + why they win}

## Landmines to Set
{Specific things to say or ask early in the deal that make it harder for the competitor later}
- {Landmine 1}
- {Landmine 2}
- {Landmine 3}

## Sources
- {URL or reference for each major claim}
```

## Key Principles

1. **Never lie about competitors.** Acknowledge real strengths, then redirect to your advantages. Reps who trash competitors lose credibility with sophisticated buyers.
2. **Trap questions beat feature comparisons.** A question that makes the prospect discover a gap is ten times more powerful than you pointing it out.
3. **Know when to walk away.** The best battlecard includes "don't compete here" scenarios. Chasing unwinnable deals wastes pipeline.
4. **Keep it fresh.** Competitors ship features, change pricing, and pivot positioning. A battlecard older than 90 days needs a refresh.

## Anti-Patterns

- **Never fabricate competitor weaknesses.** If you can't find evidence for a weakness, don't include it. Getting caught in a lie during a competitive deal is fatal.
- **Never build a feature checklist.** Feature-by-feature comparisons commoditize the conversation. Compete on outcomes and approach, not checkboxes.
- **Never ignore competitor strengths.** If they genuinely excel at something, acknowledge it. Then explain why your approach is better for this buyer's situation.

## What to Do Next

- Run a full **competitor analysis** for strategic planning: `/skill competitor-analysis`
- Build a **proposal** that positions against this competitor: `/skill proposal-writer`
- Create **discovery questions** to qualify deals early: `/skill discovery-question-set`

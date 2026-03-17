---
description: Analyze a sales call transcript for coaching insights with scoring and improvement recommendations. Trigger phrases — "coaching analysis", "sales coaching", "analyze call", "call review", "coach me", "talk ratio", "call scoring", "rep feedback"
tools: Read, Write
---

# Sales Coaching Analyzer

Analyze a sales call transcript to produce actionable coaching feedback. Scores the rep across five dimensions, identifies specific moments that worked or didn't, and provides concrete improvement recommendations tied to this specific call.

Generic coaching advice is useless. "Ask more open-ended questions" teaches nothing. "When the prospect said 'we've been evaluating options for months,' you should have asked 'What's changed that makes this a priority now?' instead of jumping to the demo" teaches everything.

## Inputs

- **Call transcript** (required) -- full transcript or detailed notes from the sales call
- **Rep name** (optional) -- for the output file name
- **Call type** (optional) -- discovery, demo, negotiation, follow-up
- **Deal context** (optional) -- stage, prospect, what was supposed to happen on this call

If transcript is missing, ask: "Paste the call transcript and I'll analyze it for coaching insights. Full transcripts work best, but detailed notes also work."

## Steps

### Step 0 -- Check for Existing Output

Read `docs/sales/coaching-{rep-slug}-{date}.md` if it exists. If found, present a summary and ask: "A coaching analysis for {rep} from {date} already exists. Do you want me to (a) analyze a new call, or (b) compare against this previous analysis?"

### Step 1 -- Load Context

Read available context files:

1. `docs/personas/` -- to assess whether the rep adapted to the persona
2. `docs/sales/discovery-*.md` -- recommended discovery questions for comparison
3. `CLAUDE.md` -- project-level instructions

### Step 2 -- Calculate Talk Ratio

Count approximate words spoken by the rep vs. the prospect:
- **Target:** 40% rep / 60% prospect (for discovery calls)
- **Target:** 50% rep / 50% prospect (for demo calls)
- **Target:** 30% rep / 70% prospect (for negotiation calls)

Report the actual ratio and how it compares to the target for this call type.

### Step 3 -- Analyze Questions

Count and categorize every question the rep asked:
- **Open-ended questions:** Questions that require explanation (target: 10+)
- **Closed questions:** Yes/no questions (should be minimal)
- **Leading questions:** Questions that suggest the answer (flag these)
- **Follow-up questions:** Questions that build on what the prospect just said (these show active listening)

Calculate the ratio of open to closed questions.

### Step 4 -- Evaluate Objection Handling

For each objection or concern the prospect raised, assess whether the rep:
1. **Acknowledged** the concern (did they validate before responding?)
2. **Reframed** the objection (did they shift perspective rather than argue?)
3. **Offered proof** (did they back up their response with evidence?)
4. **Confirmed resolution** (did they check that the prospect was satisfied?)

Score each objection handling instance and identify the best and worst examples.

### Step 5 -- Check for Next-Step Commitment

Assess how the call ended:
- Did the rep secure a concrete next step? (specific date, time, action)
- Or did they end with a vague "let's circle back" / "I'll send you some info"?
- Was the next step mutual (both sides committed) or one-sided?

### Step 6 -- Score Overall Performance

Score each dimension on a 1-5 scale:

| Dimension | 1 (Poor) | 3 (Average) | 5 (Excellent) |
|-----------|----------|-------------|---------------|
| Talk Ratio | >70% rep talk | 50/50 | 40/60 or better |
| Question Quality | Mostly closed/leading | Mix of open/closed | Mostly open with follow-ups |
| Objection Handling | Ignored or argued | Acknowledged, no proof | Full framework: acknowledge, reframe, prove, confirm |
| Active Listening | No follow-ups, repeated topics | Some follow-ups | Consistent follow-ups, referenced prior answers |
| Next-Step Commitment | No next step | Vague next step | Specific, mutual, calendared |

### Step 7 -- Write Specific Recommendations

For each dimension scored below 4, write a specific recommendation:
- **The moment:** Quote or reference the exact part of the call
- **What happened:** What the rep said or did
- **What to do instead:** The specific alternative response or question
- **Why it matters:** How it would have changed the conversation

Minimum 3 recommendations, maximum 5. Quality over quantity.

### Step 8 -- Quality Gate

Before saving, verify:

- [ ] Talk ratio is calculated with actual word counts (approximate is fine, but show the numbers)
- [ ] Every question asked by the rep is categorized (open, closed, leading, follow-up)
- [ ] Each objection handling instance is individually assessed
- [ ] Scores are justified with specific evidence from the transcript
- [ ] Recommendations reference exact moments in the call, not general advice
- [ ] No generic coaching platitudes. Every recommendation is tied to this specific call.
- [ ] Positive moments are highlighted, not just areas for improvement

If any check fails, fix it before proceeding.

## Output Format

Save to `docs/sales/coaching-{rep-slug}-{date}.md`:

```markdown
# Sales Call Coaching: {Rep Name}
Date: {Date}
Call Type: {Discovery / Demo / Negotiation / Follow-up}
Prospect: {Company / Contact}

## Scorecard

| Dimension | Score (1-5) | Key Finding |
|-----------|------------|-------------|
| Talk Ratio | {X}/5 | {Actual ratio vs target} |
| Question Quality | {X}/5 | {Open:Closed ratio, follow-up count} |
| Objection Handling | {X}/5 | {Summary} |
| Active Listening | {X}/5 | {Evidence} |
| Next-Step Commitment | {X}/5 | {What happened} |
| **Overall** | **{Avg}/5** | |

## Talk Ratio Analysis
- **Rep:** {X}% ({approx word count})
- **Prospect:** {X}% ({approx word count})
- **Target for {call type}:** {X/X}
- **Assessment:** {One sentence}

## Question Analysis
- **Total questions asked:** {N}
- **Open-ended:** {N} ({X}%)
- **Closed:** {N} ({X}%)
- **Leading:** {N} ({X}%)
- **Follow-ups:** {N} ({X}%)

**Best question asked:**
> "{Quote from transcript}"
{Why this worked}

**Missed opportunity:**
> "{Prospect said something that deserved a follow-up}"
{What the rep should have asked}

## Objection Handling Review

### Objection 1: "{What the prospect said}"
- Acknowledged: {Yes/No}
- Reframed: {Yes/No}
- Proof offered: {Yes/No}
- Resolution confirmed: {Yes/No}
- **Assessment:** {What worked or didn't}

[Repeat for each objection]

## What Went Well
1. {Specific positive moment with quote}
2. {Specific positive moment with quote}

## Improvement Recommendations

### 1. {Specific area}
**The moment:** "{Quote or reference from transcript}"
**What happened:** {What the rep did}
**Do this instead:** "{Specific alternative response}"
**Why:** {Impact on the conversation}

### 2. {Specific area}
**The moment:** "{Quote or reference}"
**What happened:** {What the rep did}
**Do this instead:** "{Specific alternative}"
**Why:** {Impact}

### 3. {Specific area}
**The moment:** "{Quote or reference}"
**What happened:** {What the rep did}
**Do this instead:** "{Specific alternative}"
**Why:** {Impact}

## One Thing to Practice
{Single most impactful change this rep could make, stated in one sentence}
```

## Key Principles

1. **Specific beats generic.** "Ask more questions" is worthless. "When the prospect said X, ask Y instead of Z" is coaching.
2. **Quote the transcript.** Every recommendation must reference an actual moment. If you can't point to it, you can't coach it.
3. **Celebrate what works.** Good coaching reinforces strengths, not just fixes weaknesses. Always include positive moments.
4. **One thing to practice.** Reps can't improve five things at once. End with the single highest-leverage change.
5. **Talk ratio is a leading indicator.** If the rep talks more than 50% on a discovery call, most other metrics will suffer too.

## Anti-Patterns

- **Do NOT give generic coaching advice.** "Ask more open-ended questions" without citing the specific closed question that should have been open is lazy coaching.
- **Do NOT only criticize.** A coaching analysis that's 100% negative is demoralizing and won't drive improvement. Balance is essential.
- **Do NOT fabricate transcript quotes.** If the transcript is incomplete, work with what's available and note the limitation.

## What to Do Next

- Generate a **discovery question set** for the rep to practice: `/skill discovery-question-set`
- Write a **meeting recap** from this same call: `/skill meeting-recap-writer`
- Build an **objection library** from recurring patterns: `/skill objection-library`

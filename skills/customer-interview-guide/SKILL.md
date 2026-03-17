---
description: Generate a structured discovery interview script with synthesis template. Trigger phrases — "interview guide", "customer interview", "discovery questions", "interview script", "customer research questions"
tools: Read, Write
---

# Customer Interview Guide

Generate a structured interview script for customer discovery, win-loss interviews, or persona validation. The output includes the full question script with interviewer notes, follow-up branches, and a synthesis template for capturing findings consistently across interviews.

Good interview questions are open-ended, specific enough to avoid rambling, and sequenced to build trust before asking hard questions. This skill produces questions that a non-expert interviewer can run and get useful data from.

## Inputs

- **Interview purpose** (required) — what you're trying to learn. Examples: "Validate ICP pain points," "Understand why we lost 5 deals last quarter," "Map the buying process for enterprise deals," "Test messaging for new product launch"
- **ICP document** (optional) — if `docs/icp.md` exists, load it for persona context
- **Persona target** (optional) — which specific persona(s) will be interviewed
- **Win-loss analysis** (optional) — if `docs/analytics/win-loss-analysis.md` exists, load it to inform loss-related questions
- **Specific hypotheses to test** (optional) — particular assumptions the interviews should validate or invalidate
- **Interview format** (optional, default: 30-minute call) — length and medium (call, in-person, async survey)

If the interview purpose is missing, ask before proceeding. A guide without a clear purpose produces generic questions that waste the interviewee's time.

## Steps

### Step 1 — Load Context

Read existing project documents to inform question design:
- Check for `docs/icp.md` — load personas, pain points, buying triggers
- Check for `docs/analytics/win-loss-analysis.md` — load loss patterns and open questions
- Check for `docs/icp-challenge.md` — load unvalidated assumptions that need testing
- Check for `CLAUDE.md` — load company context and positioning

From the loaded context, extract:
- Target persona details (title, responsibilities, KPIs)
- Known pain points to explore deeper
- Assumptions that need validation
- Competitive alternatives the interviewee might reference
- Buying process stages to map

### Step 2 — Design Interview Structure

Map the interview into timed sections based on the format:

**For a 30-minute interview (default):**
| Section | Time | Purpose |
|---------|------|---------|
| Warm-up & context | 3-4 min | Build rapport, understand their role |
| Current state | 5-7 min | How they handle the problem today |
| Pain exploration | 8-10 min | Depth on specific frustrations and impact |
| Buying process | 5-7 min | How decisions get made, who's involved |
| Competitive landscape | 3-4 min | What alternatives they've considered |
| Wrap-up & outcomes | 2-3 min | What success looks like, next steps |

**For a 45-minute interview:** Add a "Future state" section (5 min) and expand pain exploration to 12-15 min.

**For a 60-minute interview:** Add "Solution reaction" section (10 min) where you describe your approach and capture reactions.

Adjust section allocation based on the interview purpose. If the goal is buying process mapping, allocate more time there. If the goal is pain validation, weight that section.

### Step 3 — Write Questions for Each Section

For each section, write 3-5 primary questions plus follow-up branches. Follow these rules:

**Question design rules:**
- Start broad, then narrow. "Tell me about your role" before "How do you measure pipeline quality?"
- Use "how" and "what" questions, not "do you" questions. "How do you handle X?" not "Do you have a process for X?"
- Ask for specifics. "Can you walk me through the last time that happened?" not "Does that happen often?"
- Include the follow-up before the interviewee answers. Plan where to go based on likely responses.
- Never ask leading questions. "How does poor data quality affect you?" not "Poor data quality must be frustrating, right?"

**Maximum question counts:**
- 30-minute interview: 15-18 total questions (including follow-ups)
- 45-minute interview: 20-25 total questions
- 60-minute interview: 25-30 total questions

### Step 4 — Add Interviewer Notes

For each question, add:
- **Why this matters:** What the answer will tell you (1 sentence)
- **Listen for:** Specific phrases, emotions, or signals that indicate something important
- **If they say X, ask:** Conditional follow-up branches for likely responses
- **Red flag:** Responses that indicate this person isn't a good interviewee for your purpose

### Step 5 — Create Synthesis Template

Build a template that the interviewer fills out after each interview. This ensures consistent data capture across multiple interviews.

The template should include:
- Interview metadata (who, when, company, persona match)
- Key findings per section (structured fields, not free text)
- Quotes worth capturing verbatim (with context)
- Assumption validation (which hypotheses were confirmed/challenged)
- Surprise findings (things you didn't expect to learn)
- Follow-up actions (next steps triggered by this interview)
- Confidence score (how reliable was this interviewee for your purpose)

### Step 6 — Run Quality Gate

Before saving, verify:
- [ ] Every question is open-ended (no yes/no questions as primary questions)
- [ ] Questions are sequenced from easy/broad to hard/specific
- [ ] No leading questions that reveal what answer you want
- [ ] Follow-up branches exist for at least 5 key questions
- [ ] Time allocations add up to the stated interview length
- [ ] Synthesis template has structured fields, not just "notes" boxes
- [ ] Question count stays within the limit for the interview length

## Output Format

Save to `docs/customer-interview-guide.md`:

```markdown
# Customer Interview Guide
Date: [Date]
Purpose: [Interview objective]
Target Persona: [Title/Role]
Format: [Duration] [Medium]
Interviews Planned: [Number, if known]

## Interview Setup
- **Scheduling note:** [How to position the interview when booking — what to say and what NOT to say]
- **Recording:** [Whether to record, how to ask permission]
- **Materials needed:** [Anything to prepare or bring]

## Interview Script

### Section 1: Warm-Up & Context (X min)

**Q1: [Question text]**
- Why this matters: [1 sentence]
- Listen for: [signals]

**Q2: [Question text]**
- Why this matters: [1 sentence]
- Listen for: [signals]
- If they mention [X], ask: "[Follow-up question]"

### Section 2: Current State (X min)

**Q3: [Question text]**
[...]

### Section 3: Pain Exploration (X min)

**Q4: [Question text]**
[...]

[Continue for all sections]

### Closing

**Thank you script:** [Exact language for closing, including any next steps or referral ask]

## Synthesis Template

### Interview Metadata
- Interviewee: [Name, Title, Company]
- Date: [Date]
- Duration: [Actual time]
- Persona match: [How well they match the target persona — Strong/Moderate/Weak]

### Key Findings

**Current state:**
- How they handle [problem] today: [finding]
- Tools/processes currently used: [finding]

**Pain points validated:**
| Pain Point (from ICP) | Validated? | Verbatim Quote | Severity (1-5) |
|----------------------|-----------|---------------|----------------|
| [Pain 1] | Yes/No/Partial | "[quote]" | [score] |
| [Pain 2] | Yes/No/Partial | "[quote]" | [score] |

**Buying process:**
- Decision makers involved: [names/titles]
- Evaluation criteria: [what matters to them]
- Timeline: [typical decision timeline]
- Budget source: [where funding comes from]

**Competitive landscape:**
- Alternatives considered: [list]
- Current solution: [what they use now]
- Switching triggers: [what would make them change]

### Surprise Findings
- [Anything unexpected]

### Assumptions Tested

| Assumption | Result | Evidence |
|-----------|--------|----------|
| [Assumption 1] | Confirmed/Challenged/Unclear | [What they said] |

### Confidence Score
[1-5: How reliable is this interview for your stated purpose? 5 = perfect persona match, engaged interviewee, candid responses]

### Follow-Up Actions
- [ ] [Action item]
- [ ] [Action item]
```

## Key Principles

1. **Open-ended only.** Primary questions must never be answerable with yes or no. Follow-ups can be narrower, but leads must be open.
2. **Sequence builds trust.** Start with easy, non-threatening questions about their role and context. Pain and buying process questions come after rapport is established.
3. **Listen for language.** The exact words buyers use to describe their problems are more valuable than any summary. The synthesis template should capture verbatim quotes.
4. **Interviewer notes prevent wasted interviews.** Without "listen for" and "if they say X" guidance, interviewers miss signals and fail to dig deeper.
5. **Synthesis over transcription.** The template should force structured analysis, not just "what did they say?" Raw notes are useless without interpretation.
6. **Respect their time.** Stay within the stated duration. Every question should earn its place. If a question doesn't connect to the interview purpose, cut it.

## Anti-Patterns

- **Do NOT write leading questions.** "Don't you find it frustrating when..." is coaching the answer. Ask "How do you feel about..." instead.
- **Do NOT create a 40-question script for a 30-minute interview.** You'll rush through everything and explore nothing. Fewer questions with better follow-ups beats more questions.
- **Do NOT skip the synthesis template.** An interview without structured synthesis is a conversation, not research. The template is what turns anecdotes into data.
- **Do NOT fabricate example answers or hypothetical responses.** The questions are real; the answers come from real interviews. If you need placeholder text in the synthesis template, write "[To be filled after interview]" — never invent sample findings.

## Skill Chain

- **Chains from:** `icp-model-creator` (provides personas and pain points), `win-loss-analyzer` (provides loss patterns to investigate), `icp-challenger` (provides unvalidated assumptions)
- **Chains to:** Voice of Customer analysis, ICP refinement

> **Next step:** "Ready to run the interviews? After you complete 5+, I can help synthesize the findings and update the ICP." or "Want me to adapt this guide for a different persona?"

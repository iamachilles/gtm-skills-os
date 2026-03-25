---
name: executive-briefing
description: Create a personalized C-level briefing with research, business case, and CTA. Use when someone says "executive briefing", "exec brief", "C-level brief", "CEO briefing", "CXO prep", "executive meeting prep", or "board-level pitch"
allowed-tools: Read, Write, WebSearch
metadata:
  author: Achille Morin-Lemoine
  version: "1.0.0"
---

# Executive Briefing

Create a personalized briefing document for a specific C-level executive. This combines research on the person, their company, and their industry into a tailored business case that speaks to their priorities, not your product features.

Executive briefings are for Tier 1 accounts only. They take real research and produce a document that would embarrass you if it contained generic filler. Hard cap: 2 pages maximum.

## Inputs

- **Executive name and title** (required) -- who you're briefing for
- **Company name** (required) -- their organization
- **Your value proposition** (required) -- what you offer, framed for their level
- **Meeting context** (optional) -- upcoming meeting, warm intro, or cold outreach
- **Specific proof points** (optional) -- case studies or metrics relevant to their industry

If executive name is missing, ask: "Which executive are we preparing this briefing for? I need their name, title, and company."

## Steps

### Step 0 -- Check for Existing Output

Search the project for any existing output from a previous run of this skill (check common locations like `docs/`, the project root, or any organized output directory). If a previous version is found, present a summary and ask: "An executive briefing for {name} already exists from {date}. Do you want me to (a) refresh the research, (b) update the business case, or (c) rebuild from scratch?" 

### Step 1 -- Load Context

Search the project for any available context. Look in the project root, `docs/`, or any organized directory. Read what you find:

1. **Company** documents -- existing account play
2. **Persona profiles** -- persona matching this executive's role
3. **Messaging matrix** -- messaging pillars
4. **Value proposition mapping** -- feature-benefit mapping
5. `CLAUDE.md` -- project-level instructions

### Step 2 -- Research the Executive

Search for the executive's background and priorities:

- Search: `"{executive name}" linkedin`
- Search: `"{executive name}" {company name} interview OR podcast OR keynote`
- Search: `"{executive name}" priorities OR strategy OR vision`

Extract: career background, recent public statements, strategic priorities, leadership style indicators, and any published perspectives on relevant topics.

### Step 3 -- Research the Company

Search for current company context:

- Search: `"{company name}" strategy {current_year}`
- Search: `"{company name}" earnings OR revenue OR growth`
- Search: `"{company name}" challenges OR competitive`

Extract: financial performance, strategic direction, recent announcements, competitive position, technology investments, and organizational changes.

### Step 4 -- Add Industry Context

Search for relevant benchmarks and trends:

- Search: `"{industry}" benchmarks {current_year}`
- Search: `"{industry}" trends OR challenges {current_year}`

Extract: peer comparisons, industry benchmarks, emerging trends, and regulatory changes that affect the executive's priorities.

### Step 5 -- Write the Tailored Business Case

Structure the briefing around the executive's world, not yours:

1. **Situation:** What their company is facing right now (from research)
2. **Challenge:** The specific problem that connects to your value prop
3. **Industry context:** How peers are handling this (benchmarks, trends)
4. **Approach:** How you address this (framed as outcome, not feature)
5. **Evidence:** One proof point from a similar company or situation
6. **Recommended next step:** Specific, actionable CTA

Write at the executive's level. No jargon they wouldn't use. No features they don't care about. Every sentence must pass the test: "Would this executive find this valuable or would they skim past it?"

### Step 6 -- Craft the CTA

Design a specific, low-friction next step:

- Not "let's schedule a call" but "I'd like to share how {similar company} approached {specific challenge} in 20 minutes"
- Tie the CTA to something from the research (a stated priority, a recent initiative)
- Make it about their goals, not your sales process

### Step 7 -- Quality Gate

- [ ] Briefing is 2 pages or less (hard cap)
- [ ] Executive's name appears with correct spelling and current title
- [ ] At least 2 specific facts from research appear in the document (not generic statements)
- [ ] Business case connects to the executive's stated or likely priorities
- [ ] No product feature lists. Only outcomes and evidence.
- [ ] Industry context includes at least one specific benchmark or peer comparison
- [ ] CTA is specific, low-friction, and tied to their priorities
- [ ] No em dashes in any copy

If any check fails, fix it before proceeding.

## Output Format

Save the output to your project. Suggested filename: `exec-briefing-{name-slug}.md`

```markdown
# Executive Briefing: {Executive Name}
**{Title}, {Company}**
Date: {Date}
Prepared for: {Your name / meeting context}

## Their World
{2-3 sentences on the company's current situation and strategic direction, drawn from research}

## The Challenge
{2-3 sentences connecting a specific challenge to the executive's priorities}

## Industry Context
{2-3 sentences with peer benchmarks, trends, or competitive dynamics}

## Our Approach
{2-3 sentences on how you address this, framed as outcomes}

## Evidence
{One specific proof point: company name, metric, timeframe}

## Recommended Next Step
{Specific CTA tied to their priorities}

---

## Research Notes (Internal Only)
- **Executive background:** {Key career points}
- **Recent statements:** {Quotes or positions}
- **Company financials:** {Revenue, growth, key metrics}
- **Competitive position:** {Where they stand}
- **Warm paths:** {Mutual connections or intro opportunities}
```

## Key Principles

1. **Their world first, your pitch second.** The briefing should demonstrate that you understand their situation before you say a word about what you sell.
2. **Specificity is respect.** Generic observations waste an executive's time. Every claim should be backed by a specific data point, quote, or fact.
3. **Two pages, no exceptions.** Executives don't read long documents from vendors. If you can't make the case in two pages, you don't understand it well enough.
4. **The CTA earns the meeting.** A vague "let's connect" is easy to ignore. A specific "here's what I'd share and why it matters to your Q3 priority" gets responses.

## Anti-Patterns

- **Product brochure in disguise.** If the briefing reads like a sales deck with the executive's name pasted in, it fails. The research must change the content.
- **Stale research.** Using last year's earnings call quotes or outdated news. If your research is more than 3 months old, refresh it.
- **Over-promising in the CTA.** Claiming you'll "transform their business" in an initial meeting. Start small: share an insight, show one proof point, earn the next conversation.

## What to Do Next

- Design a **full account play** for this executive's company: `/skill account-play-designer`
- Write a **cold email** to this executive: `/skill cold-email-writer`
- Prepare a **meeting agenda** for the briefing: `/skill dinner-event-planner`

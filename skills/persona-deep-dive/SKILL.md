---
name: persona-deep-dive
description: Create a rich, research-backed buyer persona profile. Use when someone says "persona deep dive", "build a persona", "who is our buyer", "understand the buyer", "persona research", or "buyer profile"
allowed-tools: Read, Write, WebSearch
metadata:
  author: Achille Morin-Lemoine
  version: "1.0.0"
---

# Persona Deep Dive

Create a rich, research-backed buyer persona profile that goes far beyond demographics and job titles. This skill produces personas that feel like real people, built from research into how they actually spend their days, what metrics they're judged on, what communities they belong to, and what language they use to describe their problems.

The difference between a useful persona and a useless one: can a sales rep read it and immediately know what to say in a cold call? Can a content writer read it and know what headline will get a click? If the answer is no, the persona is too abstract.

## Inputs

- **Role title** (required) -- the job title or role to profile (e.g., "VP of Revenue Operations")
- **Industry** (required) -- the vertical or sector (e.g., "B2B SaaS, Series B-D")
- **Company size** (optional, default: 50-500 employees) -- headcount or revenue range
- **Geographic focus** (optional, default: US) -- market context
- **Existing persona notes** (optional) -- any internal knowledge about this buyer

If role title or industry is missing, ask: "I need at least a role title and industry to research this persona. What role are you targeting, and in what industry?"

## Steps

### Step 0 -- Check for Existing Output

Search the project for any existing output from a previous run of this skill (check common locations like `docs/`, the project root, or any organized output directory). If a previous version is found, present a summary and ask: "A persona profile for [role] already exists. Do you want me to (a) enrich it with new research, (b) overwrite it, or (c) keep it and build a different persona?" 

### Step 1 -- Load Context

Read available context:

1. **GTM Triangle** -- ICP and positioning context
2. **Persona profiles** -- existing personas for consistency
3. `CLAUDE.md` -- project-level instructions
4. Any user-provided notes about this role

### Step 2 -- Research the Role

Use WebSearch with specific queries to build a factual foundation. Run these searches:

- `"{role title}" "{industry}" "day in the life"` -- how they describe their work
- `"{role title}" "biggest challenge" OR "hardest part"` -- their pain points in their words
- `"{role title}" "KPIs" OR "metrics" OR "measured on"` -- what they're accountable for
- `"{role title}" "tech stack" OR "tools" "{industry}"` -- what software they use daily
- `"{role title}" "report to" OR "reports to"` -- org chart position
- `"{role title}" community OR forum OR slack OR newsletter` -- where they gather
- `"{role title}" conference OR event "{industry}"` -- events they attend
- `"{role title}" LinkedIn` -- how they describe themselves

For each search, extract concrete details: specific tools named, specific metrics mentioned, specific frustrations described. If WebSearch returns nothing for a query, write "Not found." Never invent details.

### Step 3 -- Build the Day-in-the-Life

Based on research, construct a realistic daily schedule. What does a typical Monday look like? What about end-of-quarter?

This should include:
- What meetings they attend and with whom
- What tools they open first thing in the morning
- What recurring tasks consume their time
- What fires they put out regularly
- What they wish they had time for but don't

### Step 4 -- Map the Org Chart Context

Define their position in the organization:
- **Reports to:** Their direct manager (title, what that person cares about)
- **Direct reports:** Who works for them (titles, how many)
- **Cross-functional relationships:** Which departments they interact with most and why
- **Influence vs. authority:** What can they decide alone vs. what needs approval

### Step 5 -- Identify Buying Triggers

Based on research, list specific events or conditions that make this persona start looking for solutions:
- Internal triggers (new exec hire, board pressure, missed targets, team scaling)
- External triggers (market change, competitor move, regulatory shift)
- Timing triggers (budget cycles, planning seasons, fiscal year starts)

Each trigger should be observable and specific. "Needs to improve" is not a trigger. "Just missed quarterly pipeline target for the second time" is.

### Step 6 -- Document Their Language

Collect the actual words and phrases this persona uses to describe their problems. This comes directly from the research in Step 2.

- How they describe their role on LinkedIn
- How they describe their challenges in forums or interviews
- Industry jargon they use vs. avoid
- How they frame success vs. failure

This section is critical for sales and marketing teams who need to speak the buyer's language.

### Step 7 -- Quality Gate

Run these checks before saving:

- [ ] Profile is based on research, not assumptions. Every major claim links back to a search finding or is flagged as an inference.
- [ ] KPIs are specific metrics with units (e.g., "pipeline coverage ratio, target 3x"), not vague goals
- [ ] Day-in-the-life is concrete enough that a salesperson could reference it in a cold call
- [ ] At least 3 buying triggers are listed, each observable and specific
- [ ] Language section contains actual phrases from research, not paraphrased summaries
- [ ] Tools list includes specific product names, not categories
- [ ] Communities section names specific Slack groups, newsletters, podcasts, or conferences
- [ ] The profile would be recognizable to someone who actually holds this role

If any check fails, fix it before proceeding.

## Output Format

Save the output to your project. Suggested filename: `{persona-slug}.md`

```markdown
# Persona: [Role Title]
Industry: [Industry]
Company Size: [Range]
Date: [Date]

## Overview
[2-3 sentence summary of who this person is and what defines their role]

## Job Titles
- [Primary title]
- [Alternate title 1]
- [Alternate title 2]
- [Alternate title 3]

## Org Chart Position
- **Reports to:** [Title] -- [what that person cares about]
- **Direct reports:** [Titles and typical team size]
- **Key cross-functional relationships:** [Departments and why]
- **Decision authority:** [What they can approve alone vs. what needs sign-off]

## KPIs They Own
1. [Metric 1] -- [target or benchmark if known]
2. [Metric 2] -- [target or benchmark]
3. [Metric 3] -- [target or benchmark]
4. [Metric 4] -- [target or benchmark]

## Day in the Life
### Typical Day
[Narrative description of how they spend a normal workday]

### End of Quarter
[How their priorities shift during crunch time]

## Core Pain Points
1. **[Pain point 1]** -- [Concrete description with impact]
2. **[Pain point 2]** -- [Concrete description]
3. **[Pain point 3]** -- [Concrete description]

## Goals and Aspirations
- **Professional:** [What career success looks like]
- **Operational:** [What "running a great team" looks like]
- **Personal:** [What they want to be known for]

## Tools They Use
- [Tool 1] -- [what they use it for]
- [Tool 2] -- [what they use it for]
- [Tool 3] -- [what they use it for]
- [Tool 4+]

## Content They Consume
- **Newsletters:** [Specific names]
- **Podcasts:** [Specific names]
- **Communities:** [Slack groups, forums, LinkedIn groups]
- **Conferences:** [Specific events]
- **Thought leaders they follow:** [Names]

## Buying Triggers
1. [Trigger 1] -- [Observable event or condition]
2. [Trigger 2] -- [Observable event]
3. [Trigger 3] -- [Observable event]
4. [Trigger 4] -- [Observable event]

## How They Evaluate Solutions
- [Criterion 1]
- [Criterion 2]
- [Criterion 3]
- [Criterion 4]

## Language They Use
### How they describe their problems:
- "[Direct quote or phrase from research]"
- "[Direct quote or phrase]"
- "[Direct quote or phrase]"

### Words they use vs. avoid:
| Uses | Avoids |
|------|--------|
| [Term] | [Term] |
| [Term] | [Term] |

## Common Objections
1. [Objection 1] -- [Why they raise it]
2. [Objection 2] -- [Why they raise it]
3. [Objection 3] -- [Why they raise it]

## Research Sources
[List of search queries that produced useful results and key findings from each]
```

## Key Principles

1. **Research-first, inference-second.** Every claim should trace back to a search result. When you infer, say so explicitly.
2. **Specific beats general.** "Uses Salesforce" is useful. "Uses CRM software" is not. "Attends SaaStr Annual" is useful. "Goes to conferences" is not.
3. **The persona must be recognizable.** If someone holding this role reads the profile, they should think "this describes my life" -- not "this is vaguely about someone in my field."
4. **Language matters most.** The words and phrases section is the highest-value part of the profile. It directly feeds sales scripts, ad copy, and content.
5. **Update, don't replace.** Personas evolve. When new information emerges, enrich the profile rather than starting over.

## Anti-Patterns

- **Demographic-only personas:** "Sarah, 35, lives in San Francisco, likes yoga" tells you nothing useful for selling. Focus on professional context.
- **Aspirational personas:** Describing who you wish your buyer was, not who they actually are. If research says they care about cost, don't write that they care about innovation.
- **Copy-paste personas:** If you could swap the industry and the persona still reads the same, it's too generic.

## What to Do Next

- Map this persona into the **buying committee** to understand their role in the purchase: `/skill buying-committee-mapper`
- Write **personalized outreach** based on this persona's triggers and language: `/skill outreach-personalizer`
- Create **cold emails** that speak directly to this persona's pain: `/skill cold-email-writer`

---
name: case-study-builder
description: Structure a client result into a compelling case study. Use when someone says "write a case study", "build a case study", "document a win", "client success story", "customer story", or "case study from this engagement"
allowed-tools: Read, Write
metadata:
  author: Achille Morin-Lemoine
  version: "1.0.0"
---

# Case Study Builder

Structure client results into a compelling, proof-dense case study that sales teams can use in deals, marketing can repurpose into content, and champions can forward internally to build consensus. A good case study is not a narrative essay. It's a precision instrument: dense with proof, organized for scanning, and structured so any section can stand alone as a proof point.

Hard cap: 500-800 words. Every sentence must earn its place. If a sentence doesn't add proof or context, cut it.

## Inputs

- **Client name** (required) -- or anonymized descriptor if under NDA (e.g., "Series B SaaS company, 200 employees")
- **Engagement results** (required) -- quantified outcomes, before/after metrics, timeline
- **Engagement details** (required) -- what you did, methodology, duration, team involved
- **Client context** (optional) -- industry, size, stage, relevant background
- **Client quotes** (optional) -- direct quotes from stakeholders
- **Permission level** (optional) -- full attribution, logo only, anonymous

If client name and results are missing, ask: "I need the client name (or anonymous descriptor) and the quantified results to build the case study. What engagement should I document?"

## Steps

### Step 0 -- Check for Existing Output

Search the project for any existing output from a previous run of this skill (check common locations like `docs/`, the project root, or any organized output directory). If a previous version is found, present a summary and ask: "A case study for [client] already exists. Do you want me to (a) update it with new results, (b) rewrite it with a different angle, or (c) keep it?" 

### Step 1 -- Load Context

Search the project for any available context. Look in the project root, `docs/`, or any organized directory. Read what you find:

1. **Case studies** -- existing case studies for format consistency
2. **GTM Triangle** -- positioning context (ensures the case study reinforces your narrative)
3. **Value proposition mapping** -- which value props this case study proves
4. `CLAUDE.md` -- project-level instructions
5. Any engagement notes, project docs, or raw material provided

### Step 2 -- Extract and Organize Facts

From all provided material, extract and organize:

**The Company:**
- Name, industry, size (headcount and/or revenue), stage
- Relevant context about their market or situation

**The Challenge:**
- What specific problem they faced
- How long they'd had the problem
- What they'd tried before (and why it didn't work)
- Quantified impact of the problem (cost, time lost, revenue missed)

**The Approach:**
- What you actually did (methodology, not vague descriptions)
- Timeline from start to results
- Key milestones or phases
- Who was involved (roles, not just "the team")

**The Results:**
- Primary metrics (before vs. after, with specific numbers)
- Secondary metrics (supporting outcomes)
- Timeline to results
- Ongoing impact (if the engagement is complete, what's the lasting effect?)

**Quotable Proof:**
- Direct quotes from stakeholders
- Specific moments or anecdotes that illustrate impact
- Internal feedback or reactions

If any critical facts are missing, flag them explicitly: "[Missing: before-state metric for pipeline coverage]"

### Step 3 -- Write the Case Study

Write a 500-800 word case study following the SCAR framework:

**Situation** (75-100 words)
- Who the client is and the relevant context
- Set the scene without unnecessary background
- Include industry, size, and stage only if relevant to the story

**Challenge** (100-150 words)
- The specific problem, quantified
- What they'd tried before
- Why it mattered (business impact)
- This section should make the reader think "I have this problem too"

**Approach** (100-150 words)
- What you did, step by step
- Methodology referenced by name
- Timeline and key milestones
- This section should feel credible and replicable, not magical

**Results** (150-200 words)
- Lead with the biggest number
- Before vs. after comparisons
- Supporting metrics
- Timeline to results
- This section is the payload. Make every word count.

Then add:

**Quotable Proof** (2-3 pull quotes or snippets)
- Format as blockquotes
- Each quote should illustrate a different aspect of the impact
- If no real quotes are available, write "[Quote needed from {stakeholder role} about {topic}]"

### Step 4 -- Write Scannable Summary

Create a summary block that someone can read in 10 seconds:

- **Client:** [Name or descriptor]
- **Industry:** [Sector]
- **Challenge:** [One sentence]
- **Result:** [Top metric]
- **Timeline:** [How long]

### Step 5 -- Identify Repurposing Angles

List 3-5 ways this case study can be used:
- Which persona it resonates with most
- Which objection it counters
- Which value pillar it proves
- What content formats it could become (LinkedIn post, email proof point, slide, landing page testimonial)

### Step 6 -- Quality Gate

Run these checks before saving:

- [ ] Word count is between 500-800 words (case study body only, excluding metadata)
- [ ] Results section contains at least one specific number (percentage, dollar amount, time saved, deals closed)
- [ ] Challenge section quantifies the problem, not just describes it
- [ ] Approach section describes methodology with enough detail to be credible
- [ ] Before vs. after comparison is included for at least one metric
- [ ] Timeline from start to results is specified
- [ ] No fluff sentences. Every sentence adds proof or necessary context.
- [ ] Missing information is explicitly flagged, not glossed over

If any check fails, fix it before proceeding.

## Output Format

Save the output to your project. Suggested filename: `{client-slug}.md`

```markdown
# Case Study: [Client Name or Descriptor]
Date: [Date]
Permission: [Full attribution / Logo only / Anonymous]

## At a Glance
- **Client:** [Name or descriptor]
- **Industry:** [Sector]
- **Size:** [Headcount or revenue]
- **Challenge:** [One sentence]
- **Key Result:** [Top metric, before vs. after]
- **Timeline:** [Duration]

## Situation
[75-100 words]

## Challenge
[100-150 words]

## Approach
[100-150 words]

## Results
[150-200 words with specific metrics]

## Quotable Proof
> "[Quote 1]" -- [Name, Title]

> "[Quote 2]" -- [Name, Title]

> "[Quote 3]" -- [Name, Title]

## Repurposing Guide
- **Best persona fit:** [Which buyer persona this resonates with]
- **Objection it counters:** [Which objection this neutralizes]
- **Value pillar it proves:** [Which value pillar this demonstrates]
- **Content formats:** [LinkedIn post, email snippet, slide, landing page section]

## Missing Information
[List any gaps that need to be filled with client input]
```

## Key Principles

1. **Numbers are the point.** A case study without specific metrics is a testimonial. Testimonials are nice. Case studies close deals.
2. **Dense proof, not narrative fluff.** Every sentence should either provide evidence or necessary context. "We were delighted to work with them" is fluff. Cut it.
3. **The challenge must be relatable.** If the reader doesn't see their own problem in the challenge section, the case study doesn't work for them.
4. **Approach must be credible.** Vague descriptions ("we leveraged our expertise") undermine trust. Specific methodology ("we ran a 3-week sprint starting with ICP definition") builds it.
5. **Flag what's missing honestly.** A case study with gaps you're transparent about is more trustworthy than one that papers over missing data.

## Anti-Patterns

- **The hero story:** Making it all about how brilliant you were. The client is the hero. You're the guide who helped them get results.
- **Results without context:** "Revenue increased 40%" means nothing without the baseline, timeline, and what changed. Always include before/after and timeframe.
- **Overstuffed case studies:** Going past 800 words means you're including unnecessary context. Edit ruthlessly.

## What to Do Next

- Repurpose into **LinkedIn content** using the case study angles: `/skill write-linkedin-post`
- Build a **champion enablement kit** the client can share internally: `/skill champion-enablement-kit`
- Add proof points to your **objection library**: `/skill objection-library`

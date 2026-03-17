---
description: Extract a publishable case study from a client engagement. Use when someone says "case study from engagement", "write up this client", "document engagement results", "engagement case study", "publish client results", or "client success case study"
tools: Read, Write
---

# Case Study from Engagement

Extract a publishable case study from a completed engagement. Writes the case study in SCAR format, creates an anonymized version, drafts a client approval request, and generates derivative content ideas.

## Inputs

- **Engagement results** (required) -- quantified outcomes, before/after metrics, timeline
- **Client name** (required) -- or anonymous descriptor if under NDA
- **Engagement details** (optional) -- methodology, phases, team, duration
- **Permission status** (optional) -- full attribution, logo only, anonymous, or unknown
- **Client reports** (optional) -- existing progress reports to extract from

If engagement results are missing, ask: "I need the quantified results from this engagement (before/after metrics, timeline). What did we achieve?"

## Steps

### Step 0 -- Check for Existing Output

Read `docs/case-studies/{client-slug}.md` if it exists. If found, present a summary and ask: "A case study for this client already exists. Do you want me to (a) update with new results, (b) rewrite with a different angle, or (c) keep it?"

### Step 1 -- Load Context

Read all available context:

1. `docs/sales/client-report-{client-slug}-*.md` -- engagement reports with metrics
2. `docs/sales/sow-{client-slug}.md` -- original engagement scope
3. `docs/case-studies/*.md` -- existing case studies for format consistency
4. `docs/gtm-triangle.md` -- positioning (case study should reinforce your narrative)
5. `CLAUDE.md` -- project-level instructions

### Step 2 -- Extract Story Arc

From all engagement materials, construct:

**The Setup:** Who the client is and why they came to you
**The Challenge:** What specific problem they faced (quantified)
**The Turning Point:** What you did differently from what they'd tried before
**The Resolution:** What results were achieved (quantified)
**The Ongoing Impact:** What changed permanently as a result

### Step 3 -- Write Full Case Study (SCAR Format)

**Situation** (75-100 words): Who the client is, industry, size, relevant context.

**Challenge** (100-150 words): The specific problem, quantified. What they'd tried. Why it mattered.

**Approach** (100-150 words): What you did. Methodology by name. Timeline. Key phases.

**Results** (150-200 words): Lead with the biggest number. Before vs. after. Supporting metrics. Timeline to results.

Total: 500-800 words. Every sentence earns its place.

### Step 4 -- Create Anonymized Version

Rewrite the case study with identifying details removed:

- Company name becomes descriptor: "a Series B SaaS company" or "a 200-person fintech startup"
- Specific product names become categories: "their CRM platform" or "a marketing automation tool"
- Revenue figures become ranges or percentages: "$2.3M" becomes "7-figure pipeline"
- Keep the story structure and metrics. Change the identifiers.

### Step 5 -- Write Approval Request Email

Draft an email to the client requesting permission to publish:

- **Subject:** Can we share your results? (quick ask)
- **Body:**
  - Reference the specific results achieved
  - Explain how you'd like to share them (case study on your site/LinkedIn)
  - Offer three options: full attribution, logo only, or anonymous
  - Attach the case study draft for their review
  - Make it easy to say yes (reply with "yes" is enough)

### Step 6 -- Generate 3 Derivative Content Ideas

From the case study, identify content that can be spun off:

| # | Content Type | Angle | Key Proof Point |
|---|-------------|-------|----------------|
| 1 | LinkedIn post | {specific angle from the engagement} | {metric to highlight} |
| 2 | Email proof point | {how to use in outreach} | {result to reference} |
| 3 | {blog/presentation/slide} | {broader lesson from the engagement} | {framework or insight} |

Each derivative should be able to stand alone without reading the full case study.

### Step 7 -- Quality Gate

- [ ] Case study is 500-800 words
- [ ] Results include at least one specific number
- [ ] Before/after comparison is included
- [ ] Anonymized version maintains the story without identifying details
- [ ] Approval email is drafted
- [ ] 3 derivative content ideas are generated
- [ ] Missing information is flagged, not fabricated
- [ ] No em dashes in any copy

## Output Format

Save to `docs/case-studies/{client-slug}.md`:

```markdown
# Case Study: {Client Name}

Date: {Date}
Permission: Full / Logo Only / Anonymous / Pending
Engagement: {Duration and type}

## At a Glance
- **Client:** {Name or descriptor}
- **Industry:** {Sector}
- **Challenge:** {One sentence}
- **Key Result:** {Top metric}
- **Timeline:** {Duration}

## Full Case Study

### Situation
{75-100 words}

### Challenge
{100-150 words}

### Approach
{100-150 words}

### Results
{150-200 words}

---

## Anonymized Version
{Full case study with identifying details removed}

---

## Approval Request Email
**Subject:** {subject}
**Body:**
{Email text}

---

## Derivative Content Ideas
| # | Type | Angle | Proof Point |
|---|------|-------|-------------|
| 1 | {type} | {angle} | {metric} |
| 2 | {type} | {angle} | {metric} |
| 3 | {type} | {angle} | {metric} |

## Missing Information
{Gaps to fill with client input}
```

## Key Principles

1. **The engagement produced the case study. You just need to extract it.** Don't write fiction. Extract the actual story, actual numbers, and actual methodology from your engagement materials.
2. **Always create an anonymized version.** Even if the client says yes, having an anonymous version ready means you can use it immediately while awaiting approval.
3. **Make approval easy.** A long, formal request email reduces the chance of getting a yes. Keep it short, offer options, and make replying frictionless.
4. **Derivative content multiplies ROI.** A case study sitting on your website reaches few people. A LinkedIn post about the same result reaches thousands. Always plan the derivatives.

## Anti-Patterns

- **Fabricating details.** If you don't have a specific number, flag it as missing. Don't estimate or round generously. Credibility depends on accuracy.
- **Writing the case study months later.** Extract and write while the engagement is fresh. Waiting 6 months means details are forgotten and the client has moved on.
- **Not asking for permission.** Publishing without approval damages the relationship. Always ask, even if you think they'll say yes.

## What to Do Next

- Write a **LinkedIn post** from derivative idea #1: `/skill write-linkedin-post`
- Add proof points to your **proposal template**: `/skill client-engagement-scoper`
- Build the full **case study** with deeper structure: `/skill case-study-builder`

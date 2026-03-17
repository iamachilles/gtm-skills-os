---
description: Design a lead magnet with content outline, visual spec, promotion post, and DM template. Use when someone says "lead magnet", "create a freebie", "gated content", "content asset", "downloadable resource", or "build a guide for leads"
tools: Read, Write
---

# Lead Magnet Creator

Design a lead magnet that earns contact information by delivering genuine value. A lead magnet is not a teaser. It's a standalone asset good enough that people feel they got more than they gave. This skill produces the content outline, visual format spec, LinkedIn promotion post, and DM response template.

The best lead magnets solve one narrow problem completely rather than covering a broad topic superficially.

## Inputs

- **Topic area** (required) -- the problem space or subject matter
- **Target audience** (required) -- who this is for (role, industry, stage)
- **Format preference** (optional) -- tool/script, guide/framework, template, database
- **Author context** (optional) -- who is creating this and their credibility on the topic

If topic or audience are missing, ask: "I need a topic area and target audience. What problem does your audience need solved, and who specifically are they?"

## Steps

### Step 0 -- Check for Existing Output

Read `docs/content/assets/lead-magnet-{topic-slug}.md`. If found, present summary and ask: "A lead magnet on [topic] already exists. Do you want me to (a) update the outline, (b) change the format, or (c) rebuild from scratch?"

### Step 1 -- Load Context

Read all available context:

1. `docs/personas/*.md` -- target audience profiles
2. `docs/content-strategy.md` -- content positioning and themes
3. `docs/gtm-triangle.md` -- market positioning
4. `docs/value-prop-matrix.md` -- value props for this audience
5. `CLAUDE.md` -- project-level instructions

Extract from persona files:
- Top 3 pain points for this audience
- What they've already tried (so the magnet goes beyond basics)
- Their preferred content consumption format
- What would make them share this with a colleague

### Step 2 -- Choose Format

Select the format that best matches topic and audience:

**Tool/Script** -- a calculator, scoring template, or automated workflow the reader can use immediately. Best when the value is in saving time on a repeatable task.

**Guide/Framework** -- a structured methodology with steps, examples, and decision criteria. Best when the value is in organizing thinking around a complex topic.

**Template** -- a fill-in-the-blank document the reader can customize. Best when the audience knows what to do but struggles with the blank page.

**Database/Swipe File** -- a curated collection of examples, benchmarks, or resources. Best when the value is in aggregation and curation.

If a format was provided, validate it against the topic. If it's a poor fit, recommend a better one with reasoning.

### Step 3 -- Write Content Outline

Write 10-15 sections for the lead magnet:

1. **Title page** -- benefit-driven title (not clever, clear)
2. **The problem** -- why this topic matters right now
3. **What most people get wrong** -- common mistakes that create the need
4. Sections 4-12: Core content organized by the chosen format
5. **Quick-start guide** -- "Do this first" action step
6. **Resources/Next steps** -- where to go deeper

For each section, write:
- Section title (under 10 words)
- 2-3 bullet points covering what to include
- One specific example, data point, or template element

Hard cap: 10-15 sections. More than 15 means the scope is too broad. Split into a series.

### Step 4 -- Design Visual Format Spec

Recommend the delivery format:

- **Interactive GIF walkthrough** -- for tools and calculators
- **PDF document** -- for guides, frameworks, and templates
- **Notion template** -- for databases and swipe files
- **Google Sheet** -- for calculators and trackers
- **Video + PDF combo** -- for complex methodologies

Include: page count estimate, visual style notes, and whether it needs custom design or can be text-only.

### Step 5 -- Write the LinkedIn Promotion Post

Write a complete LinkedIn post to promote the lead magnet. Structure:

1. **Hook** -- create curiosity about the problem the magnet solves
2. **Inventory** -- list 3-5 specific things included in the asset
3. **Proof of origin** -- why you're credible to create this (experience, data, results)
4. **CTA** -- "Comment [keyword] and I'll DM it to you" or "DM me [keyword]"

Write 2 hook variants. Keep the post under 250 words.

### Step 6 -- Write DM Response Template

Write the template message to send when someone requests the magnet:

- Personalized opener (reference their comment or profile)
- Brief context on what they're getting
- The link or attachment
- One follow-up question that starts a conversation
- Sign-off

Keep under 75 words. No walls of text in DMs.

### Step 7 -- Quality Gate

- [ ] The lead magnet solves one specific problem, not five vague ones
- [ ] Content outline has 10-15 sections, each with concrete content direction
- [ ] The asset would be valuable even if the reader never buys anything
- [ ] Promotion post has a clear hook, inventory, proof of origin, and CTA
- [ ] DM template is under 75 words and includes a conversation-starting question
- [ ] Format matches the content type (not forcing a PDF when a spreadsheet is better)
- [ ] Title is benefit-driven and specific (not "The Ultimate Guide to X")

If any check fails, fix it before proceeding.

## Output Format

Save to `docs/content/assets/lead-magnet-{topic-slug}.md`:

```markdown
# Lead Magnet: [Title]
Topic: [Topic area]
Audience: [Target audience]
Format: [Tool/Guide/Template/Database]
Date: [Date]

## Asset Overview
**Problem it solves:** [One sentence]
**Why it works:** [Why this format for this audience]
**Estimated size:** [Pages/slides/rows]

## Content Outline

### Section 1: [Title]
- [Content direction]
- [Specific example or data point]

### Section 2: [Title]
[Continue for all 10-15 sections]

## Visual Format Spec
- **Delivery format:** [PDF/Notion/Sheet/etc.]
- **Design needs:** [Custom design / text-only / template-based]
- **Style notes:** [Visual direction]

## LinkedIn Promotion Post

**Hook 1 (recommended):**
[Hook text]

**Hook 2:**
[Hook text]

**Full Post:**
[Complete post with hook 1, inventory, proof, CTA]

## DM Response Template
[Template text]

## Distribution Plan
- LinkedIn post on [day]
- Follow-up post with results in [timeframe]
- Repurpose into [other formats]
```

## Key Principles

1. **The asset must be good enough that people feel they got more than they gave.** If the reader feels tricked into giving their email for thin content, you've lost them forever.
2. **Solve one problem completely, not ten problems superficially.** Narrow scope with deep value beats broad scope with shallow coverage.
3. **The promotion post sells the problem, not the asset.** People don't want a PDF. They want the outcome the PDF delivers.
4. **The DM is the start of a relationship, not a transaction.** Always include a question that opens a real conversation.

## Anti-Patterns

- **The "Ultimate Guide" trap:** 50-page PDFs that nobody reads. Keep it focused and actionable. If it takes more than 20 minutes to consume, it's too long.
- **All sizzle, no substance:** A beautifully designed asset with generic advice the reader could find in any blog post. The content must be specific and original.
- **Missing the conversation:** Sending the asset in a DM with no follow-up question. The magnet is a door-opener, not the destination.

## What to Do Next

- Write additional **LinkedIn posts** to promote the magnet: `/skill write-linkedin-post`
- Build a **content calendar** around the magnet launch: `/skill content-calendar`
- Create a **nurture sequence** for people who downloaded: `/skill nurture-sequence-writer`

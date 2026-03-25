---
name: content-repurposer
description: Turn one piece of content into 5+ derivatives across channels. Use when someone says "repurpose content", "turn this into posts", "content derivatives", "repurpose blog", "repurpose podcast", or "multi-channel content"
allowed-tools: Read, Write
metadata:
  author: Achille Morin-Lemoine
  version: "1.0.0"
---

# Content Repurposer

Turn one piece of content into 5+ derivatives across different channels. Every long-form content piece contains multiple standalone insights. Repurposing is not reformatting. It's extracting distinct ideas and rebuilding each for a specific channel's native format.

Each derivative must stand alone. It should be valuable without reading the original.

## Inputs

- **Source content** (required) -- blog post, podcast transcript, video transcript, or long-form piece
- **Target channels** (optional) -- which platforms to create for (default: LinkedIn, Twitter/X, newsletter, carousel, email)
- **Author context** (optional) -- voice and perspective

If source content is missing, ask: "I need the source content to repurpose. Can you share the blog post, transcript, or long-form piece?"

## Steps

### Step 0 -- Check for Existing Output

Read content documents. If found, ask: "Repurposed content from [source] already exists. Do you want me to (a) add new derivatives, (b) update existing ones, or (c) rebuild?"

### Step 1 -- Load Context

Read available context:

1. Source content (provided)
2. **Content strategy** -- channel strategy
3. **Persona profiles** -- audience per channel
4. `CLAUDE.md` -- project-level instructions

### Step 2 -- Extract Key Insights

Read the source content and extract 5-8 standalone insights:

For each insight:
- **Core idea** (one sentence)
- **Supporting evidence** (the data, example, or story behind it)
- **Audience resonance** (which persona cares most about this)
- **Standalone score** (1-5: can this work without context from the original?)

Only proceed with insights scoring 3+ on standalone. Discard anything that requires the full original to make sense.

### Step 3 -- Create Derivatives

For each qualifying insight, create format-specific versions:

**LinkedIn text post (150-250 words)**
- Hook (first 2 lines)
- Body (one idea, specific examples)
- CTA (engagement or lead-focused)

**Twitter/X thread hook (under 280 characters)**
- The opening tweet that would start a thread
- Thread structure suggestion (3-5 tweets)

**Newsletter snippet (75-100 words)**
- Commentary-style paragraph with the insight and your analysis
- Formatted as a standalone section in a curated newsletter

**Carousel slide concept (header + body)**
- One slide from a potential carousel
- Header under 8 words, body under 30 words

**Email marketing snippet (50-75 words)**
- The insight framed as a teaser in a marketing email
- Links back to the original content

### Step 4 -- Map to Channels with Timing

Create a publishing schedule:
- Day 1: LinkedIn post (strongest insight)
- Day 2: Twitter/X thread
- Day 3: Include snippet in next newsletter
- Day 5: LinkedIn post (second insight)
- Day 7: Carousel combining 3-4 insights
- Week 2+: Email sequence using remaining snippets

### Step 5 -- Quality Gate

- [ ] At least 5 distinct insights extracted
- [ ] Each derivative stands alone without the original
- [ ] LinkedIn posts are 150-250 words
- [ ] Twitter hooks are under 280 characters
- [ ] No two derivatives tell the same story the same way
- [ ] Publishing schedule is included with timing
- [ ] No em dashes in any derivative
- [ ] Each derivative matches its platform's native format

If any check fails, fix it before proceeding.

## Output Format

Save the output to your project. Suggested filename: `repurposed-{source-slug}.md`

```markdown
# Repurposed Content: [Source Title]
Source: [Original content reference]
Insights extracted: [Number]
Derivatives created: [Number]
Date: [Date]

## Insights Extracted
1. **[Insight title]** -- [One sentence] (Standalone: [score]/5)
2. **[Insight title]** -- [One sentence] (Standalone: [score]/5)
[Continue for all insights]

---

## Insight 1: [Title]

### LinkedIn Post
[Full post text]

### Twitter/X Thread Hook
[Opening tweet + thread structure]

### Newsletter Snippet
[Commentary paragraph]

### Carousel Slide
**Header:** [Text]
**Body:** [Text]

### Email Snippet
[Teaser text]

---

## Insight 2: [Title]
[Same structure]

---

## Publishing Schedule
| Day | Channel | Content | Insight # |
|---|---|---|---|
| Day 1 | LinkedIn | Text post | 1 |
| Day 2 | Twitter/X | Thread | 2 |
[Continue]

## Notes
- **Strongest insight for engagement:** [Which one and why]
- **Best for lead gen:** [Which one and why]
- **Content gaps:** [What the source didn't cover that could be a new piece]
```

## Key Principles

1. **Each derivative must stand alone.** It should be valuable without reading the original. If a derivative only makes sense as a teaser, it's not a derivative, it's an ad.
2. **Repurposing is not reformatting.** Copy-pasting a blog paragraph into a LinkedIn post is not repurposing. Each channel demands its own structure, length, and hook.
3. **The source is a mine, not a mold.** Extract the raw insights, then rebuild for each medium. The blog structure doesn't dictate the LinkedIn structure.
4. **Timing matters.** Space derivatives across days and weeks. Publishing everything at once cannibalizes your own reach.

## Anti-Patterns

- **The copy-paste reformat:** Taking a blog paragraph and posting it on LinkedIn without restructuring. Different platforms have different reading behaviors.
- **Derivative overload:** Creating 15 pieces from a source that only has 3 real insights. If you're stretching, you're diluting. Quality over quantity.
- **Forgetting the original:** All derivatives and no link back. At least one piece should drive traffic to the original long-form content.

## What to Do Next

- Write full **LinkedIn posts** from the strongest insights: `/skill write-linkedin-post`
- Build a **carousel** from combined insights: `/skill carousel-outliner`
- Add derivatives to the **content calendar**: `/skill content-calendar`

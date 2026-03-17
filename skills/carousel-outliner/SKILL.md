---
description: Outline a LinkedIn carousel with 12-15 slides including headers, body text, and visual direction. Use when someone says "carousel", "slide deck for LinkedIn", "carousel outline", "swipe post", or "LinkedIn slides"
tools: Read, Write
---

# Carousel Outliner

Outline a LinkedIn carousel with 12-15 slides. Carousels are the highest-reach format on LinkedIn because each swipe counts as engagement. But reach without value is noise. Every slide must deliver a standalone insight while building toward a complete argument.

This skill produces the full slide-by-slide outline with headers, body text, and visual direction.

## Inputs

- **Topic** (required) -- what the carousel teaches or argues
- **Key points** (required) -- the 5-8 main ideas to cover
- **Author context** (optional) -- who is creating this
- **Visual style** (optional) -- brand colors, font preferences, clean vs. bold

If topic or key points are missing, ask: "I need a topic and 5-8 key points for the carousel. What are you teaching or arguing, and what are the main ideas?"

## Steps

### Step 0 -- Check for Existing Output

Read `docs/content/carousel-{topic-slug}.md`. If found, ask: "A carousel on [topic] already exists with [N] slides. Do you want me to (a) revise specific slides, (b) reorder, or (c) rebuild?"

### Step 1 -- Load Context

Read available context:

1. `docs/content-strategy.md` -- content positioning
2. `docs/personas/*.md` -- audience profiles
3. `CLAUDE.md` -- project-level instructions

Identify:
- What the audience already knows about this topic
- What level of detail is appropriate
- What visual style matches existing content

### Step 2 -- Structure the Carousel

Design 12-15 slides following this architecture:

**Slide 1: Title Slide (The Hook)**
- The hook that makes them swipe
- Must create curiosity or promise specific value
- Format: bold statement or question + "Swipe to learn" or similar

**Slides 2-3: Problem Framing**
- Why this topic matters right now
- The cost of getting it wrong
- Creates the need for the solution you're about to share

**Slides 4-10: Core Content**
- One point per slide (this is non-negotiable)
- Each slide should be valuable even if seen in isolation
- Build in logical sequence
- Include specific examples, numbers, or mini case studies

**Slides 11-12: Summary/Takeaway**
- Recap the key points (bullet list)
- The "so what" -- what the reader should do with this information
- Connect back to the hook's promise

**Final Slide: CTA**
- What to do next (follow, save, share, DM)
- Profile reference or resource mention
- Keep it simple. One ask.

### Step 3 -- Write Slide Content

For each slide, provide three elements:

**Header** (under 8 words)
- Bold, scannable, tells the point at a glance
- Must work even if the reader only reads headers

**Body text** (under 30 words)
- Supports the header with detail, example, or evidence
- Short sentences. No paragraphs on slides.
- Use bullets or numbered lists when possible

**Visual direction**
- What should be on screen besides text (icon, diagram, screenshot, illustration)
- Layout suggestion (text left/image right, centered, full bleed)
- Color or emphasis notes

### Step 4 -- Validate the Swipe

Read just the headers in sequence. They should:
1. Tell a complete story from Slide 1 to Final Slide
2. Create forward momentum (each header makes you want the next)
3. Cover the topic without redundancy
4. Build from problem to solution to action

If the header sequence doesn't flow, restructure.

### Step 5 -- Write Companion Post

Write the LinkedIn text post that accompanies the carousel:
- 3-5 sentences that frame the carousel's value
- End with "Swipe through the carousel" or "Save this for later"
- Include 1-2 relevant hashtags

### Step 6 -- Quality Gate

- [ ] 12-15 slides total
- [ ] Slide 1 creates curiosity or promises specific value
- [ ] One point per slide in the core content section
- [ ] Every header is under 8 words
- [ ] Every body text is under 30 words
- [ ] Headers alone tell a coherent story
- [ ] Final slide has a clear, single CTA
- [ ] Visual direction is provided for each slide
- [ ] Companion post is included
- [ ] No em dashes

If any check fails, fix it before proceeding.

## Output Format

Save to `docs/content/carousel-{topic-slug}.md`:

```markdown
# Carousel: [Topic]
Slides: [Number]
Date: [Date]

## Header Sequence
1. [Slide 1 header]
2. [Slide 2 header]
...
[All headers listed for flow check]

---

## Slide 1: Title
**Header:** [Hook text]
**Body:** [Supporting text]
**Visual:** [Direction]

## Slide 2: [Section]
**Header:** [Text]
**Body:** [Text]
**Visual:** [Direction]

[Continue for all slides]

## Final Slide: CTA
**Header:** [CTA text]
**Body:** [Supporting text]
**Visual:** [Direction]

---

## Companion Post
[LinkedIn text to accompany the carousel]

## Design Notes
- **Style:** [Clean/bold/minimal]
- **Colors:** [Suggestions]
- **Font:** [Suggestions]
- **Tool:** [Canva/Figma/etc.]
```

## Key Principles

1. **One point per slide.** The moment a slide tries to make two points, both get lost. If you can't say it in 30 words, it needs its own slide.
2. **Headers carry the narrative.** Most people skim headers and skip body text. The header sequence must tell the full story.
3. **The first slide earns the swipe.** If Slide 1 doesn't create curiosity, nobody sees Slide 2. Treat it like a hook.
4. **Carousels are saved, not shared.** Design for "save" behavior. Actionable, reference-worthy content gets saved. Generic advice does not.

## Anti-Patterns

- **The wall-of-text slide:** Cramming a paragraph onto a slide. If there are more than 30 words of body text, split into two slides.
- **The beautiful but empty carousel:** Stunning design with no substance. Each slide must teach something. Design amplifies content, it doesn't replace it.
- **No companion post:** Posting a carousel without framing text. The text post gives context and tells LinkedIn's algorithm what the content is about.

## What to Do Next

- Write **hooks** for the companion post: `/skill hook-generator`
- Add this carousel to the **content calendar**: `/skill content-calendar`
- Turn the carousel topic into a **blog post**: `/skill blog-post-writer`

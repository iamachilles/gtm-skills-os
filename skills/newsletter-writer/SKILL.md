---
description: Write a newsletter edition with subject lines, body sections, and CTA. Use when someone says "write a newsletter", "email newsletter", "newsletter edition", "weekly update", or "subscriber email"
tools: Read, Write
---

# Newsletter Writer

Write a newsletter edition that subscribers actually open and read. A newsletter is not a link dump. It's your voice, your analysis, delivered to people who chose to hear from you. Every piece you share must include your own commentary. Curation without opinion is just an RSS feed.

## Inputs

- **Topic** (required) -- the theme or focus for this edition
- **Recent content** (optional) -- posts, articles, or resources to reference
- **Audience context** (optional) -- who subscribes and what they care about
- **Format preference** (optional) -- curated insights, single deep-dive, or roundup
- **Author context** (optional) -- voice, tone, and perspective

If topic is missing, ask: "What's the focus for this edition? A single topic you want to go deep on, or a theme to curate around?"

## Steps

### Step 0 -- Check for Existing Output

Read `docs/content/newsletter-{date}.md`. If found, present summary and ask: "A newsletter edition for [date] already exists. Do you want me to (a) edit specific sections, (b) change the format, or (c) rewrite?"

### Step 1 -- Load Context

Read all available context:

1. `docs/content-strategy.md` -- content positioning
2. `docs/personas/*.md` -- subscriber profiles
3. Recent content provided by the user
4. `CLAUDE.md` -- project-level instructions

Identify:
- What the audience cares about right now
- What you've published recently that connects to this topic
- What industry events or trends are relevant

### Step 2 -- Choose Format

**Curated Insights (3-4 items with commentary)**
Best for: regular cadence, when you have multiple interesting sources. Each item gets 50-100 words of your analysis. Total: 3-4 items.

**Single Deep-Dive (one topic, explored fully)**
Best for: when you have a strong opinion or original insight. Structure like a mini-essay. Total: one main section with 2-3 sub-points.

**Roundup (themed collection with a through-line)**
Best for: monthly editions, year-end, or topic compilations. 5-7 items with brief commentary. Total: items connected by a narrative thread.

### Step 3 -- Write Subject Lines

Write 3 variants:

1. **Curiosity-driven:** Creates an information gap
2. **Benefit-driven:** States what the reader will get
3. **Specific/numbered:** Uses a number or specific claim

Rules:
- Under 50 characters (shows fully on mobile)
- No clickbait. The email must deliver on the subject line.
- No ALL CAPS or excessive punctuation

### Step 4 -- Write Preview Text

The preview text shows after the subject line in inbox view. Write 1 sentence (under 90 characters) that complements the subject line without repeating it.

### Step 5 -- Write the Opening

The first paragraph determines whether they read or archive. Write 2-3 sentences that:

- Connect to the reader's world (not yours)
- Set up the topic with a specific observation or question
- Create momentum to keep reading

Do not start with "Hey everyone" or "Happy [day of week]." Start with the insight.

### Step 6 -- Write Body Sections

Based on the chosen format, write 2-4 sections.

For each section:
- **Bold header** (under 8 words)
- **Your commentary** (50-150 words per section)
- **The takeaway** (one sentence the reader can act on)
- **Link** (if referencing external content)

Rules:
- Every section needs your analysis, not just a summary
- Short paragraphs (2-3 sentences)
- One idea per section
- Use "you" more than "I"

### Step 7 -- Write CTA and Sign-Off

**CTA options (pick one):**
- Reply to this email with [specific question]
- Check out [resource] if you want to go deeper
- Forward this to a colleague who [specific situation]

**Sign-off:** Brief, personal, consistent with your voice. Under 20 words.

### Step 8 -- Quality Gate

- [ ] Total word count is 500-800 words
- [ ] Subject lines are under 50 characters each
- [ ] Preview text complements (not repeats) the subject line
- [ ] Opening paragraph does not start with a greeting
- [ ] Every shared resource includes your own analysis (not just a link)
- [ ] CTA asks for one specific action
- [ ] The newsletter sounds like a person, not a brand
- [ ] No em dashes

If any check fails, fix it before proceeding.

## Output Format

Save to `docs/content/newsletter-{date}.md`:

```markdown
# Newsletter: [Edition Title]
Format: [Curated / Deep-Dive / Roundup]
Date: [Date]
Word count: [Number]

## Subject Lines
1. [Subject line 1] (recommended)
2. [Subject line 2]
3. [Subject line 3]

**Preview text:** [Preview text]

---

## Email Body

[Opening paragraph]

### [Section 1 Header]
[Commentary and analysis]

### [Section 2 Header]
[Commentary and analysis]

### [Section 3 Header]
[Commentary and analysis]

[CTA]

[Sign-off]

---

## Send Notes
- **Best send time:** [Day/time recommendation]
- **Segment:** [All subscribers / specific segment]
- **Follow-up:** [What to repurpose from this edition]
```

## Key Principles

1. **A newsletter is not a link dump.** Add your own analysis to every piece you share. The reader subscribes for your perspective, not your bookmarks.
2. **Respect the inbox.** Every edition must justify the space it takes. If you don't have something worth saying, skip the edition.
3. **The opening earns the rest.** If the first sentence doesn't hook them, nothing else matters.
4. **Consistency beats frequency.** A great monthly newsletter beats a mediocre weekly one.

## Anti-Patterns

- **The "happy Monday" opener:** Starting with a greeting instead of an insight. The reader already knows what day it is.
- **Link-and-run:** Sharing 10 links with one-sentence descriptions. That's a bookmark folder, not a newsletter. Your commentary is the product.
- **The sales pitch disguised as content:** Every newsletter ending with "book a call." Earn the right to sell by delivering value first. CTA should feel natural, not forced.

## What to Do Next

- Repurpose the best section into a **LinkedIn post**: `/skill write-linkedin-post`
- Plan the next month of editions with a **content calendar**: `/skill content-calendar`
- Turn a deep-dive edition into a **blog post**: `/skill blog-post-writer`

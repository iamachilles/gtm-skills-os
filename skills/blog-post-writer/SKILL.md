---
description: Write an SEO-optimized blog post with keyword research, competitive analysis, and meta tags. Use when someone says "write a blog post", "blog article", "SEO content", "write for the blog", or "long-form content"
tools: Read, Write, WebSearch
---

# Blog Post Writer

Write an SEO-optimized blog post that ranks and reads well. SEO content is not keyword-stuffed filler. It's the best answer to a specific question, structured so search engines can find it and humans want to read it.

This skill produces a complete blog post with H2/H3 structure, meta tags, and internal link suggestions, grounded in competitive research.

## Inputs

- **Topic** (required) -- what the post is about
- **Target keyword** (required) -- the primary keyword to rank for
- **Audience** (required) -- who this is for
- **Content angle** (optional) -- unique perspective or thesis
- **Internal links** (optional) -- existing content to link to

If topic, keyword, or audience are missing, ask: "I need a topic, target keyword, and audience to write this post. What are you trying to rank for, and who should find it?"

## Steps

### Step 0 -- Check for Existing Output

Read `docs/content/blog-{slug}.md` where slug is derived from the keyword. If found, ask: "A blog post targeting [keyword] already exists. Do you want me to (a) update it with new research, (b) rewrite specific sections, or (c) start fresh?"

### Step 1 -- Load Context

Read all available context:

1. `docs/content-strategy.md` -- content positioning
2. `docs/gtm-triangle.md` -- market positioning
3. `docs/personas/*.md` -- audience profiles
4. `CLAUDE.md` -- project-level instructions

### Step 2 -- Research the Keyword

Search for competitive intelligence:

- Search: `{keyword} best practices`
- Search: `{keyword} guide`
- Search: `{keyword} common mistakes`

From search results, identify:
- What the top 3 results cover
- What angle or subtopic they miss
- Average content depth (surface-level vs. detailed)
- Common H2 structure patterns

### Step 3 -- Identify Content Gaps

Based on competitive research, find what's missing:
- Topics competitors mention but don't explain
- Questions in "People Also Ask" that no result answers well
- Unique data, frameworks, or perspectives you can add
- Outdated information in current top results

The content gap is your competitive advantage. Your post must cover everything the top results cover, plus fill the gaps.

### Step 4 -- Write the Outline

Create H2/H3 structure:

- **H1:** Blog title (include keyword, under 60 characters)
- **H2s:** 4-7 main sections
- **H3s:** 2-3 subsections under each H2 where needed

Each H2 should be a question the reader has or a step in a process. Avoid generic H2s like "Introduction" or "Conclusion."

### Step 5 -- Write the Post

**Intro (100-150 words):**
- Hook: start with a specific problem, stat, or scenario
- Thesis: state what the reader will learn
- Credibility: why this perspective matters (briefly)

**Body (1200-2000 words):**
- One clear point per section
- Specific examples in every section (not hypothetical)
- Data points where available
- Short paragraphs (3-4 sentences max)
- Transition sentences between sections
- Include the target keyword naturally 3-5 times total
- Include secondary keywords where they fit naturally

**Conclusion (100-150 words):**
- Summarize the key takeaway (one sentence)
- Actionable next step
- CTA (related content, resource, or contact)

Hard cap: 1500-2500 words total. Under 1500 is too thin to rank. Over 2500 loses readers.

### Step 6 -- Write Meta Tags

- **Meta title:** Under 60 characters, includes keyword, compelling to click
- **Meta description:** Under 155 characters, includes keyword, summarizes the value
- **URL slug:** Short, keyword-included, no stop words

### Step 7 -- Suggest Internal Links

Recommend 3-5 places to link to existing content:
- Anchor text suggestion
- Target URL or content piece
- Why this link adds value for the reader

### Step 8 -- Quality Gate

- [ ] Post is 1500-2500 words
- [ ] Target keyword appears naturally 3-5 times (not stuffed)
- [ ] Every section has a specific example, not just theory
- [ ] H2 structure covers the topic more completely than top 3 competitors
- [ ] Meta title is under 60 characters and includes the keyword
- [ ] Meta description is under 155 characters
- [ ] No section is pure filler. Each advances the reader's understanding.
- [ ] The intro hooks the reader in the first sentence
- [ ] Conclusion has a clear CTA

If any check fails, fix it before proceeding.

## Output Format

Save to `docs/content/blog-{slug}.md`:

```markdown
# [Blog Title]
Target keyword: [Keyword]
Secondary keywords: [2-3 keywords]
Word count: [Number]
Date: [Date]

## Meta
- **Title tag:** [Under 60 chars]
- **Meta description:** [Under 155 chars]
- **URL slug:** /blog/[slug]

## Competitive Notes
- **Gap exploited:** [What this post covers that competitors don't]
- **Top competitor weakness:** [What the #1 result gets wrong or misses]

---

[Full blog post with H2/H3 headers]

---

## Internal Links
| Anchor Text | Target | Placement |
|---|---|---|
| [text] | [URL/content] | [Which section] |

## Distribution
- Share on LinkedIn: [angle for social]
- Email to list: [subject line suggestion]
- Repurpose into: [carousel / thread / newsletter section]
```

## Key Principles

1. **Answer the question better than anyone else.** The post should be the best result for this keyword. If it's not, it won't rank and it shouldn't.
2. **Specificity beats comprehensiveness.** A post with 5 detailed, example-rich sections outperforms one with 15 shallow sections.
3. **Write for humans, structure for search engines.** The H2/H3 structure helps Google understand the content. The writing quality keeps humans reading.
4. **Every section must earn its place.** If a section doesn't teach something specific or answer a question, cut it.

## Anti-Patterns

- **Keyword stuffing:** Forcing the keyword into every paragraph. Use it 3-5 times naturally. Google is smarter than that.
- **The wall of theory:** Sections that explain concepts without showing examples. Every claim needs evidence or illustration.
- **Generic introductions:** "In today's fast-paced business environment..." Delete the first paragraph and start with the second one. That's usually where the actual content begins.

## What to Do Next

- Create a **LinkedIn post** to promote the blog: `/skill write-linkedin-post`
- Build a **content calendar** around related keywords: `/skill content-calendar`
- Write an **SEO brief** for the next article in the cluster: `/skill seo-content-brief`

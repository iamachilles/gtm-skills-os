---
description: Create an SEO content brief with keyword research, competitive analysis, and detailed outline. Use when someone says "SEO brief", "content brief", "keyword brief", "write a brief for", "SEO outline", or "what should this article cover"
tools: Read, Write, WebSearch
---

# SEO Content Brief

Create an SEO content brief that gives a writer everything needed to produce a ranking article. A brief is not a topic suggestion. It's a detailed specification: the keyword, the intent, the structure, the topics to cover, and what the competition misses.

The brief should be so thorough that any competent writer can produce a top-ranking article from it without additional research.

## Inputs

- **Target keyword** (required) -- the primary keyword to rank for
- **Secondary keywords** (optional) -- related terms to include
- **Existing content** (optional) -- internal content to reference or link to

If target keyword is missing, ask: "What keyword do you want to rank for? Give me the primary search term your audience types."

## Steps

### Step 0 -- Check for Existing Output

Read `docs/content/seo-brief-{keyword-slug}.md`. If found, ask: "An SEO brief for [keyword] already exists. Do you want me to (a) update with fresh competitive data, (b) expand the outline, or (c) rebuild?"

### Step 1 -- Load Context

Read available context:

1. `docs/content-strategy.md` -- content positioning
2. `docs/personas/*.md` -- who searches for this term
3. `CLAUDE.md` -- project-level instructions

### Step 2 -- Research the Keyword

Run these searches:

- Search: `{keyword}`
- Search: `{keyword} guide`
- Search: `{keyword} best practices`
- Search: `people also ask {keyword}`

From search results, capture:
- **Search intent:** Is the searcher looking to learn, compare, buy, or solve?
- **Related queries:** What other questions come up?
- **People Also Ask:** List the top 5-8 PAA questions
- **Content type ranking:** Are blog posts, tools, videos, or listicles ranking?

### Step 3 -- Analyze Top 5 Results

For each of the top 5 ranking pages, note:
- URL and title
- Estimated word count (from content depth)
- H2 structure (main sections)
- Topics covered
- Unique angles or data
- Weaknesses (what's missing, outdated, or shallow)

Summarize in a competitive matrix.

### Step 4 -- Identify Content Gaps

Find what the top results miss:
- PAA questions that no result answers well
- Subtopics mentioned but not explained
- Outdated statistics or advice
- Missing practical examples or templates
- Perspectives not represented (practitioner vs. consultant vs. vendor)

These gaps are the brief's strategic advantage.

### Step 5 -- Write the Brief

**Target keyword:** [Keyword]
**Secondary keywords:** [3-5 related terms]
**Search intent:** [Learn / Compare / Solve / Buy]
**Recommended word count:** [Based on competitive analysis]
**Target audience:** [Who searches this and why]

**H2/H3 outline:**
For each section:
- H2 title (include keyword variant where natural)
- What to cover (3-5 bullet points)
- Required elements (example, data point, template, etc.)
- PAA question this section answers (if applicable)

**Topics competitors cover (must include):**
- [List of topics that every top result covers -- table stakes]

**Topics competitors miss (differentiation opportunity):**
- [List of gaps with brief on why they matter]

**Internal link opportunities:**
- [Existing content to link to, with suggested anchor text]

**External sources to reference:**
- [Authoritative sources the writer should cite]

### Step 6 -- Quality Gate

- [ ] Search intent is clearly identified
- [ ] Top 5 competitors are analyzed with specific weaknesses noted
- [ ] H2/H3 outline has at least 5 main sections
- [ ] Each section specifies what to cover (not just a topic label)
- [ ] At least 3 content gaps are identified
- [ ] PAA questions are mapped to outline sections
- [ ] Word count recommendation is based on competitive data
- [ ] Internal link opportunities are included

If any check fails, fix it before proceeding.

## Output Format

Save to `docs/content/seo-brief-{keyword-slug}.md`:

```markdown
# SEO Content Brief: [Keyword]
Date: [Date]
Search intent: [Intent type]
Recommended word count: [Range]
Target audience: [Who]

## Keyword Data
- **Primary:** [Keyword]
- **Secondary:** [3-5 keywords]
- **Related queries:** [5-8 queries]

## Competitive Analysis
| Rank | Title | Word Count | Strengths | Weaknesses |
|---|---|---|---|---|
| 1 | [Title] | [Count] | [Strengths] | [Weaknesses] |
| 2 | [Title] | [Count] | [Strengths] | [Weaknesses] |
[Continue for top 5]

## People Also Ask
1. [Question] -- covered in [Section X]
2. [Question] -- covered in [Section Y]
[Continue for 5-8 questions]

## Content Gaps (Our Advantage)
1. **[Gap]** -- [Why it matters and what to include]
2. **[Gap]** -- [Why it matters]
3. **[Gap]** -- [Why it matters]

## Article Outline

### H2: [Section Title]
- Cover: [bullet points]
- Required: [example/data/template]
- PAA answered: [question if applicable]

### H2: [Section Title]
[Continue for all sections]

## Internal Links
| Anchor Text | Target | Placement |
|---|---|---|
[Link suggestions]

## External Sources
- [Source 1 with URL]
- [Source 2 with URL]

## Writer Notes
- [Key guidance on tone, angle, or approach]
- [What to avoid based on competitive weaknesses]
```

## Key Principles

1. **The brief does the research so the writer does the writing.** A writer receiving this brief should not need to Google anything. All the competitive intelligence is included.
2. **Gaps are the strategy.** Covering what competitors cover is table stakes. Covering what they miss is how you win.
3. **Intent drives structure.** A "how to" keyword needs a tutorial structure. A "best" keyword needs a comparison. Match the format to the intent.
4. **Be specific about what each section needs.** "Write about X" is not a brief. "Cover X with a specific example, cite [source], and address [PAA question]" is a brief.

## Anti-Patterns

- **The keyword-only brief:** "Write a blog post about [keyword]." That's a topic, not a brief. Without competitive analysis and structure, the writer is guessing.
- **Ignoring search intent:** Writing a tutorial when the top results are all comparison pages. If Google ranks comparisons, the searcher wants a comparison.
- **Over-engineering the outline:** 25 H2s with 3 H3s each. That's a 10,000-word article nobody will write or read. Keep it focused.

## What to Do Next

- Write the **blog post** from this brief: `/skill blog-post-writer`
- Generate **hooks** for the LinkedIn post promoting the article: `/skill hook-generator`
- Plan related articles with a **content calendar**: `/skill content-calendar`

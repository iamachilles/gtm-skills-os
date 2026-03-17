---
description: Generate 10 hook variants across 5 frameworks with top 3 recommendations. Use when someone says "write hooks", "hook variants", "opening lines", "post openers", "first line options", or "hook ideas"
tools: Read, Write
---

# Hook Generator

Generate 10 hook variants for a LinkedIn post topic across 5 proven frameworks. The hook is the single most important element of any LinkedIn post. It determines whether the reader clicks "see more" or keeps scrolling. Two lines. That's all you get.

This skill produces 10 hooks (2 per framework) and recommends the top 3.

## Inputs

- **Post topic** (required) -- what the post is about
- **Key insight** (optional) -- the core point the post will make
- **Proof points** (optional) -- specific numbers, results, or examples available
- **Author context** (optional) -- who is writing and their credibility on this topic

If topic is missing, ask: "What's the post about? Give me the topic and, if you have it, the key insight or result."

## Steps

### Step 0 -- Check for Existing Output

Read `docs/content/hooks-{topic-slug}.md`. If found, ask: "Hooks for [topic] already exist. Do you want me to (a) add more variants, (b) rewrite with a different angle, or (c) start fresh?"

### Step 1 -- Load Context

Read available context:

1. `docs/content-strategy.md` -- content themes and voice
2. `docs/personas/*.md` -- who reads this content
3. `CLAUDE.md` -- project-level instructions

Identify:
- What the audience already believes about this topic
- What would surprise them or challenge their assumptions
- What specific data or results are available
- What emotional trigger fits (curiosity, fear of missing out, recognition)

### Step 2 -- Generate Hooks Across 5 Frameworks

Write 2 hooks per framework. Each hook is the first 2 lines of the post (what shows before "see more").

**Framework 1: Contrarian**
Challenge a common belief. The reader thinks "wait, what?" and needs to know more.
- Pattern: "Everyone says X. They're wrong." / "Stop doing X. Here's why."
- Works best when you have data or experience that contradicts conventional wisdom.

**Framework 2: Credibility Gap**
Lead with experience, then tease the insight.
- Pattern: "I [did X]. Here's what nobody tells you." / "After [experience], I changed my mind about [topic]."
- Works best when the author has direct, relevant experience.

**Framework 3: Curiosity**
Create an information gap the reader can only close by reading.
- Pattern: "I discovered something about X that changes everything." / "There's a reason X doesn't work. And it's not what you think."
- Works best for counterintuitive insights.

**Framework 4: Specificity**
Use precise numbers to signal real data, not opinions.
- Pattern: "I analyzed 147 cold emails. 3 patterns drove 80% of replies." / "We ran 12 campaigns. One variable changed everything."
- Works best when you have actual data or measurable results.

**Framework 5: Dialogue**
Open with a quote or conversation that pulls the reader in.
- Pattern: "'You can't do X at scale.' That's what my client told me." / "My CEO asked me one question. I couldn't answer it."
- Works best for storytelling and lesson-learned posts.

### Step 3 -- Apply Hook Rules

Check every hook against these rules:

- Under 25 words total (both lines combined)
- First line under 15 words (this is what shows in feed)
- No clickbait. The post must be able to deliver on the hook's promise.
- Specific beats vague. "147 cold emails" beats "hundreds of emails."
- No em dashes
- No questions in the hook (save those for CTAs)
- No filler words ("In this post I'll share..." is wasted space)

### Step 4 -- Recommend Top 3

Rank the 10 hooks and select the top 3 with reasoning:

For each recommendation, explain:
- Why this hook works for this specific topic
- Which audience segment it appeals to most
- What type of post body it sets up best

### Step 5 -- Quality Gate

- [ ] 10 hooks total, 2 per framework
- [ ] Every hook is under 25 words
- [ ] No hook uses clickbait that the post can't deliver on
- [ ] At least 2 hooks use specific numbers (if data is available)
- [ ] No em dashes in any hook
- [ ] Top 3 recommendations include reasoning
- [ ] Each hook creates a genuine information gap

If any check fails, fix it before proceeding.

## Output Format

Save to `docs/content/hooks-{topic-slug}.md`:

```markdown
# Hook Variants: [Topic]
Date: [Date]
Total variants: 10

## Top 3 Recommendations

### #1 (Recommended)
> [Hook text -- both lines]

**Framework:** [Which framework]
**Why it works:** [One sentence]
**Best for:** [Post type it sets up]

### #2
> [Hook text]

**Framework:** [Framework]
**Why it works:** [One sentence]

### #3
> [Hook text]

**Framework:** [Framework]
**Why it works:** [One sentence]

---

## All Variants

### Contrarian
1. [Hook text]
2. [Hook text]

### Credibility Gap
3. [Hook text]
4. [Hook text]

### Curiosity
5. [Hook text]
6. [Hook text]

### Specificity
7. [Hook text]
8. [Hook text]

### Dialogue
9. [Hook text]
10. [Hook text]

## Notes
- **Strongest framework for this topic:** [Framework and why]
- **Data needed to strengthen hooks:** [What additional proof would help]
```

## Key Principles

1. **No clickbait.** The post must deliver on the hook's promise. A hook that overpromises and underdelivers destroys trust faster than a bad post.
2. **Specific beats clever.** A hook with a real number outperforms a hook with a witty phrase. "I analyzed 147 cold emails" is more compelling than "I unlocked the secret to cold email."
3. **The hook earns the click, the body earns the read.** Two separate jobs. The hook's only goal is to make someone tap "see more."
4. **Test by reading aloud.** If the hook sounds like marketing copy, rewrite it. It should sound like something you'd say to a colleague.

## Anti-Patterns

- **The vague tease:** "I learned something incredible about outbound." What? This creates frustration, not curiosity. Be specific enough to intrigue.
- **The humble brag opener:** "I just hit 10K followers and here's what I learned." Unless the post is genuinely about the insight, this reads as self-congratulation.

## What to Do Next

- Write the **full post** using the best hook: `/skill write-linkedin-post`
- Build a **carousel** if the topic suits visual format: `/skill carousel-outliner`
- Plan more posts with a **content calendar**: `/skill content-calendar`

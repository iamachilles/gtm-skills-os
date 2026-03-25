---
name: case-study-to-content
description: Repurpose a case study into 5-7 LinkedIn post drafts covering different angles. Use when someone says "repurpose case study", "turn case study into posts", "case study content", "extract posts from engagement", or "content from client work"
allowed-tools: Read, Write
metadata:
  author: Achille Morin-Lemoine
  version: "1.0.0"
---

# Case Study to Content

Extract 5-7 LinkedIn post drafts from a single case study, each covering a different angle. One client engagement contains multiple content assets. The result post tells a different story than the methodology post, which tells a different story than the contrarian take.

This skill turns one piece of deep work into a week or more of content, each post standing on its own while reinforcing the same underlying expertise.

## Inputs

- **Case study document** (required) -- the source case study with context, approach, and results
- **Author context** (optional) -- who is writing (role, perspective, relationship to the work)
- **Content strategy** (optional) -- themes or angles to prioritize

If case study is missing, ask: "I need a case study to repurpose. Do you have a doc in docs/case-studies/, or can you share the client context, what you did, and what happened?"

## Steps

### Step 0 -- Check for Existing Output

Read case studies. If found, present summary and ask: "A content series for [client] already exists with [N] drafts. Do you want me to (a) add new angles, (b) rewrite specific posts, or (c) rebuild the full series?"

### Step 1 -- Load Context

Search the project for any available context. Look in the project root, `docs/`, or any organized directory. Read what you find:

1. The case study document (provided or from case studies)
2. **Content strategy** -- content themes and angles
3. **Persona profiles** -- who the content is for
4. **GTM Triangle** -- positioning context
5. `CLAUDE.md` -- project-level instructions

From the case study, extract:
- The client's starting situation (before)
- What was done (methodology, steps, decisions)
- The results (numbers, outcomes, changes)
- What surprised you or challenged assumptions
- Any frameworks or processes used
- Benchmarks or data points generated

### Step 2 -- Map Angles

Generate one post per angle. Not every angle will apply to every case study. Skip any that don't have enough material. Minimum 5, maximum 7.

**Angle 1: Result Post (Before/After)**
The transformation story. Lead with the outcome, then reveal what changed. Structure: result headline, starting point, what shifted, the specific numbers.

**Angle 2: Methodology Post (How We Did It)**
The process story. Walk through the approach step by step. Structure: the problem, the approach, the 3-4 key steps, why this sequence matters.

**Angle 3: Lesson Learned (What Surprised Us)**
The discovery story. Something unexpected happened. Structure: what you expected, what actually happened, why it matters, what you'd do differently.

**Angle 4: Contrarian Take (What Everyone Gets Wrong)**
The challenge story. A common belief was wrong. Structure: the common belief, what the data showed, why the belief persists, the better approach.

**Angle 5: Tutorial Post (Step-by-Step)**
The how-to story. One specific technique from the engagement that readers can apply. Structure: the problem, the step-by-step method, an example, expected results.

**Angle 6: Framework Applied (Client x Methodology)**
The theory-meets-practice story. A framework was used and here's how it played out. Structure: the framework, how it was applied, what it revealed, the outcome.

**Angle 7: Data Sharing (Benchmarks)**
The research story. Share aggregated data or benchmarks from the engagement. Structure: the data set, the key findings (3-5 insights), what readers should do with this information.

### Step 3 -- Write Post Drafts

For each angle, write a complete LinkedIn post:

- **Hook** (first 2 lines, under 20 words for line 1)
- **Body** (150-250 words, one idea per paragraph, short sentences)
- **CTA** (one call to action matching the post type)

Follow these rules for every post:
- First person voice
- Specific numbers over vague claims
- No em dashes
- No consulting jargon
- No filler sentences
- Maximum 3 hashtags

### Step 4 -- Sequence the Series

Recommend a publishing order:
- Lead with the highest-engagement angle (usually Result or Contrarian)
- Space related angles apart (don't publish Methodology and Tutorial back-to-back)
- End with the broadest-appeal post (usually Data Sharing or Lesson Learned)
- Suggest timing (e.g., 2-3 posts per week over 2 weeks)

### Step 5 -- Quality Gate

- [ ] Each post stands alone. A reader who sees only one post gets full value.
- [ ] No two posts tell the same story from the same angle
- [ ] Client is anonymized unless explicit permission to name them
- [ ] Every post has specific numbers or concrete examples (no vague "improved results")
- [ ] Hooks create genuine curiosity. Read just the first 2 lines of each.
- [ ] No em dashes in any post
- [ ] Each post is 150-250 words
- [ ] At least 5 complete post drafts are included

If any check fails, fix it before proceeding.

## Output Format

Save the output to your project. Suggested filename: `case-study-series-{client-slug}.md`

```markdown
# Case Study Content Series: [Client/Project Name]
Source: [Case study reference]
Posts: [Number of drafts]
Date: [Date]

## Series Overview
**Client context:** [One sentence]
**Key result:** [The headline number]
**Publishing sequence:** [Recommended order]

---

## Post 1: [Angle] -- [Working Title]
**Publish:** [Suggested day in sequence]

[Complete post text, ready to copy-paste]

**CTA:** [Call to action]
**Visual:** [Recommended format -- image/carousel/text only]

---

## Post 2: [Angle] -- [Working Title]
[Continue for all 5-7 posts]

---

## Series Notes
- **Strongest hooks:** Posts [X] and [Y]
- **Best for engagement:** Post [X] (contrarian/question angle)
- **Best for leads:** Post [X] (resource/methodology angle)
- **Content gaps:** [Any angles that need more data to write well]
```

## Key Principles

1. **Each post must stand alone.** A reader encountering any single post should get full value without needing to read the others.
2. **Same data, different stories.** The angles extract different narratives from the same underlying work. The result post is not the methodology post with a different hook.
3. **Anonymize by default.** Never name the client unless you have explicit permission. Use "a Series B SaaS company" or "a 50-person sales team" instead.
4. **Specificity is the proof.** Vague posts ("we improved their outbound") get scrolled past. Specific posts ("reply rates went from 1.2% to 4.8% in 6 weeks") get saved and shared.

## Anti-Patterns

- **The humble brag series:** Every post is "look how great we are." Mix in lessons learned and surprises to stay credible.
- **Copy-paste with different hooks:** If you swap the hooks between two posts and they still work, the posts are too similar. Each angle must have unique body content.
- **Over-extraction:** Forcing 7 posts from a case study that only has material for 4. If an angle doesn't have substance, skip it.

## What to Do Next

- Write **hook variants** for the strongest posts: `/skill hook-generator`
- Build a **content calendar** incorporating this series: `/skill content-calendar`
- Create a **carousel** from the methodology or tutorial post: `/skill carousel-outliner`

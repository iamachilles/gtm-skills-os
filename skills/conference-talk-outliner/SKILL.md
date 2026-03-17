---
description: Outline a conference talk with narrative arc and speaker notes. Use when someone says "conference talk", "talk outline", "speaking outline", "presentation outline", "keynote outline", "session outline", or "talk structure"
tools: Read, Write
---

# Conference Talk Outliner

Outline a conference talk with a clear thesis, narrative arc, speaker notes per section, and slide concepts. A good talk changes one belief for the audience. Everything in the outline serves that single thesis.

## Inputs

- **Topic** (required) -- what the talk is about
- **Audience** (required) -- who will be in the room (role, experience level, what they care about)
- **Time slot** (required) -- how long the talk is (typical: 20, 30, or 45 minutes)
- **Event context** (optional) -- which conference, track, or theme
- **Key message** (optional) -- the one thing you want the audience to remember

If topic, audience, or time slot is missing, ask: "I need the topic, who the audience is, and how long the time slot is. What are we working with?"

## Steps

### Step 0 -- Check for Existing Output

Read `docs/content/talk-{topic-slug}.md` if it exists. If found, present a summary and ask: "A talk outline on this topic already exists. Do you want me to (a) refine it, (b) restructure for a different audience, or (c) rebuild?"

### Step 1 -- Load Context

Read all available context:

1. `docs/gtm-triangle.md` -- positioning (ensures talk reinforces your narrative)
2. `docs/case-studies/*.md` -- proof points and stories to include
3. `docs/content/*.md` -- existing content on this topic
4. `CLAUDE.md` -- project-level instructions

### Step 2 -- Define the Thesis

Write one sentence that captures the core argument of the talk. This is not the topic. The topic is what you're talking about. The thesis is what you're arguing.

- **Topic:** "Account-based marketing for startups"
- **Thesis:** "Startups don't need more leads. They need to win their first 20 accounts by treating each one like a market of one."

The thesis must be:
- Specific enough to disagree with
- Bold enough to be interesting
- True enough to be defensible

### Step 3 -- Design Narrative Arc

Allocate time based on the total slot length. Scale proportionally:

**For a 30-minute talk:**

| Section | Time | Purpose |
|---------|------|---------|
| Opening hook | 2 min | Story or stat that earns attention |
| Problem framing | 5 min | Why this matters now, what's broken |
| Framework/methodology | 10 min | Your unique approach (the meat of the talk) |
| Case study or proof | 5 min | Real example that proves the framework works |
| Practical takeaways | 5 min | What to do Monday morning |
| Q&A setup | 3 min | Recap thesis, invite questions |

For 20-minute talks, cut case study to 3 minutes and compress framing.
For 45-minute talks, add a second case study and expand the framework section.

### Step 4 -- Write Each Section

**Opening Hook (2 min):**
- Choose: surprising stat, counterintuitive claim, or short story
- Must connect directly to the thesis
- Write the opening 2-3 sentences verbatim (these matter most)

**Problem Framing (5 min):**
- What the audience currently believes (the conventional wisdom)
- Why that belief is wrong or incomplete
- The cost of continuing with the current approach
- Speaker notes: {key points, transitions, audience check-in moment}

**Framework/Methodology (10 min):**
- Present your framework in 3-4 clear steps
- Each step needs: name, definition, example
- Visual concept for each step
- Speaker notes: {detailed talking points, examples, anticipated questions}

**Case Study or Proof (5 min):**
- Real example applying the framework
- Before state, what was done, results
- Specific numbers that prove the framework works
- Speaker notes: {story arc, emotional beats, key data points}

**Practical Takeaways (5 min):**
- 3 specific actions the audience can take Monday morning
- Each action should be concrete and achievable without buying anything
- Speaker notes: {action statements, quick examples}

**Q&A Setup (3 min):**
- Restate the thesis in one sentence
- Recap the 3 takeaways
- Invite questions with a suggested starter ("A question I often get is...")

### Step 5 -- Suggest Slide Concepts

For 3 key moments in the talk, suggest slide concepts:

1. **The hook slide:** What visual or data point opens the talk
2. **The framework slide:** How to visualize the methodology (diagram, matrix, flow)
3. **The proof slide:** The before/after data or case study visual

Each slide concept should be describable in one sentence. If you need a paragraph to explain the slide, it's too complex.

### Step 6 -- Quality Gate

- [ ] Thesis is one sentence, specific, and arguable
- [ ] Time allocation adds up to the slot length
- [ ] Opening hook is written verbatim (first 2-3 sentences)
- [ ] Framework has 3-4 clear, named steps
- [ ] Takeaways are specific actions, not vague advice
- [ ] At least one case study or proof point with real numbers
- [ ] Slide concepts are described for 3 key moments
- [ ] No em dashes in any copy

## Output Format

Save to `docs/content/talk-{topic-slug}.md`:

```markdown
# Talk: {Title}

Date: {Date}
Event: {Conference/Event name}
Audience: {Who}
Duration: {Time slot}

## Thesis
{One sentence}

## Narrative Arc

### Opening Hook (X min)
{Verbatim opening + speaker notes}

### Problem Framing (X min)
{Key points + speaker notes}

### Framework (X min)
{Step-by-step framework + speaker notes per step}

### Proof (X min)
{Case study with numbers + speaker notes}

### Takeaways (X min)
1. {Action 1}
2. {Action 2}
3. {Action 3}

### Close + Q&A (X min)
{Thesis restatement + Q&A prompt}

## Slide Concepts
1. **Hook slide:** {description}
2. **Framework slide:** {description}
3. **Proof slide:** {description}

## Preparation Notes
- Key stories to practice: {list}
- Anticipated questions: {3-5 questions with brief answers}
- Technical requirements: {mic, slides, demo, etc.}
```

## Key Principles

1. **One thesis, not five topics.** A talk that tries to cover everything covers nothing. Pick one argument and make it undeniable.
2. **The opening earns the next 28 minutes.** If you lose them in the first 2 minutes, the rest doesn't matter. Write the opening verbatim and practice it.
3. **Frameworks are memorable, bullet points are not.** Give your methodology a name and a structure. "The 3-step ABM framework" sticks. "Some tips for ABM" doesn't.
4. **Takeaways must be actionable Monday morning.** "Think differently about X" is not a takeaway. "Email your top 10 accounts with this template" is.
5. **Proof converts skeptics.** The audience wants to believe you, but they need evidence. One specific case study with real numbers is worth more than ten theoretical examples.

## Anti-Patterns

- **The info dump.** Cramming 45 minutes of content into a 20-minute slot. Cut ruthlessly. Better to cover 3 points deeply than 10 points superficially.
- **The product pitch disguised as a talk.** The audience came to learn, not to be sold. If your framework only works with your product, it's a demo, not a talk.
- **Skipping the opening hook.** "Hi, I'm [name] and today I'll be talking about..." is how you lose half the room in 10 seconds.

## What to Do Next

- Build the **full presentation** from this outline: use your slide tool of choice
- Design a **workshop** version of the talk: `/skill workshop-designer`
- Write a **blog post** based on the talk content: `/skill blog-post-writer`

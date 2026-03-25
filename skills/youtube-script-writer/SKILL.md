---
name: youtube-script-writer
description: Write a YouTube video script with hook, sections, b-roll suggestions, and thumbnail options. Use when someone says "YouTube script", "video script", "write a video", "YouTube content", "video outline", or "record a video about"
allowed-tools: Read, Write
metadata:
  author: Achille Morin-Lemoine
  version: "1.0.0"
---

# YouTube Script Writer

Write a YouTube video script optimized for retention. YouTube rewards watch time, not clicks. The script must hook in the first 30 seconds, deliver consistent value, and keep viewers through the CTA.

This skill produces a timestamped script with b-roll suggestions and thumbnail title options.

## Inputs

- **Topic** (required) -- what the video covers
- **Target audience** (required) -- who watches this
- **Video length** (required) -- target duration in minutes
- **Key points** (optional) -- 3-5 main ideas to cover
- **Speaker context** (optional) -- who is on camera, their style

If topic, audience, or length are missing, ask: "I need the video topic, target audience, and target length. What are you teaching, who's watching, and how long should it be?"

## Steps

### Step 0 -- Check for Existing Output

Read content documents. If found, ask: "A video script on [topic] already exists. Do you want me to (a) revise specific sections, (b) adjust for a different length, or (c) rewrite?"

### Step 1 -- Load Context

Read available context:

1. **Content strategy** -- content positioning
2. **Persona profiles** -- viewer profiles
3. **GTM Triangle** -- market context
4. `CLAUDE.md` -- project-level instructions

### Step 2 -- Calculate Word Budget

Target: approximately 150 words per minute of video.

| Video Length | Word Budget |
|---|---|
| 5 min | 750 words |
| 8 min | 1200 words |
| 10 min | 1500 words |
| 15 min | 2250 words |
| 20 min | 3000 words |

Allocate the word budget across sections:
- Hook: 5% (first 30 seconds)
- Intro: 5% (who you are, 15 seconds)
- Body: 75% (core content)
- Recap: 10% (summary)
- CTA: 5% (subscribe + next action)

### Step 3 -- Write the Hook (First 30 Seconds)

The hook determines whether the viewer stays or bounces. YouTube analytics show the biggest drop-off happens in the first 30 seconds.

Structure:
1. **The promise** (first sentence): State exactly what the viewer will learn or gain
2. **The stakes** (second sentence): Why this matters or what they're getting wrong
3. **The tease** (third sentence): Preview the most surprising or valuable point

Rules:
- No lengthy introductions. Start with the value, not "Hey guys, welcome back."
- State the promise in the first 5 seconds
- Create a reason to watch until the end ("And at the end, I'll show you...")

### Step 4 -- Write the Intro (15 Seconds)

Brief credibility establishment:
- Who you are (one sentence)
- Why you're qualified to talk about this (one sentence)
- Transition to content ("Let's get into it" or similar)

Keep this tight. Viewers want the content, not your biography.

### Step 5 -- Write the Body (3-5 Sections)

For each section:

**Section header** (what the viewer learns)

**Script text:**
- Written in natural speaking voice (contractions, short sentences, conversational)
- One main point per section
- Include a specific example or story in each section
- Write transition sentences between sections ("Now that you know X, the next piece is...")

**B-roll suggestion:**
- What to show on screen while talking
- Screenshot, diagram, example, text overlay, or demo
- Timestamp for when to cut to b-roll

**Retention hook:**
- At the start of each section, tease why this part matters
- "This next one is the one most people miss..."
- Prevents mid-video drop-off

### Step 6 -- Write the Recap

Summarize the key points in 3-5 bullet statements. Fast-paced, no new information. The recap serves two purposes:
1. Reinforces the learning for viewers who watched everything
2. Provides a quick reference for viewers who jumped ahead

### Step 7 -- Write the CTA

Two elements:
1. **Subscribe CTA:** Tie it to future value ("If you want more [topic] breakdowns, subscribe")
2. **Specific next action:** What the viewer should do right now (implement step 1, download resource, watch next video)

Keep under 30 seconds. Viewers who've stayed this long are already engaged.

### Step 8 -- Write Thumbnail Titles

Write 2-3 thumbnail title options:
- Under 6 words (must be readable on mobile)
- Creates curiosity or states a bold claim
- Complements the video title (not a repeat)

### Step 9 -- Quality Gate

- [ ] Word count matches target length (150 words/minute, +/- 10%)
- [ ] Hook states the promise in the first 5 seconds
- [ ] Hook includes a reason to watch until the end
- [ ] Each body section has a specific example
- [ ] B-roll suggestions are included for each section
- [ ] Transitions between sections are written
- [ ] Recap summarizes without adding new points
- [ ] CTA has both subscribe and specific next action
- [ ] 2-3 thumbnail titles provided, each under 6 words
- [ ] Script reads naturally when spoken aloud

If any check fails, fix it before proceeding.

## Output Format

Save the output to your project. Suggested filename: `video-script-{topic-slug}.md`

```markdown
# Video Script: [Title]
Topic: [Topic] | Length: [X] min ([Y] words) | Audience: [Who] | Date: [Date]

## Thumbnail Titles
1. [Option 1] | 2. [Option 2] | 3. [Option 3]

## Video Title
[Under 60 chars, includes keyword]

---

## [0:00-0:30] Hook
[Script text] | **B-roll:** [Suggestion]

## [0:30-0:45] Intro
[Script text]

## [Timestamp] Section 1: [Header]
[Script text] | **B-roll:** [Suggestion] | **Retention hook:** [Tease]

[Continue for all sections, each with script + b-roll + retention hook]

## [Timestamp] Recap
[Key points summary]

## [Timestamp] CTA
[Subscribe + next action]

## Production Notes
[Key visuals, props, music/mood, estimated recording time]
```

## Key Principles

1. **The first 30 seconds determine everything.** YouTube's algorithm weighs early retention heavily. If viewers leave in the first 30 seconds, the video is dead regardless of how good the rest is.
2. **Write for the ear, not the eye.** Read the script aloud. If it sounds stiff or unnatural, rewrite it. Video scripts are spoken word, not written word.
3. **Every section needs a retention hook.** Give viewers a reason to stay for the next section. Preview the value before delivering it.
4. **150 words per minute is the pace.** Faster feels rushed. Slower feels boring. Hit the target and the video will feel natural.

## Anti-Patterns

- **The lecture format:** 15 minutes of unbroken monologue with no visual variety. Include b-roll cuts, examples, and on-screen text to maintain visual interest.
- **The buried lead:** Saving the best insight for the end. Put a strong point in Section 1 to earn the viewer's trust early. Save the second-best point for last.
- **Over-scripting delivery:** Writing every "um" and pause. Write the content naturally and leave room for the speaker's personality. A script is a guide, not a teleprompter.

## What to Do Next

- Write a **LinkedIn post** to promote the video: `/skill write-linkedin-post`
- **Repurpose** the video content across channels: `/skill content-repurposer`
- Build a **carousel** from the key points: `/skill carousel-outliner`

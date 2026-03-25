---
name: video-prospecting-script
description: Write a 45-second Loom or Vidyard prospecting video script. Use when someone says "video script", "loom script", "vidyard script", "video prospecting", "personalized video", or "video outreach"
allowed-tools: Read, Write
metadata:
  author: Achille Morin-Lemoine
  version: "1.0.0"
---

# Video Prospecting Script

Write a 45-second video prospecting script for Loom or Vidyard. The video is structured in four beats: hook, bridge, value, and CTA. Every second counts. The hook earns the first 5 seconds. If those 5 seconds fail, nothing else matters.

## Inputs

- **Prospect data** (required) -- name, company, role, and at least one specific observation (their website, a post, a company signal)
- **Value proposition** (required) -- what you offer and why it matters to them
- **Proof point** (optional) -- one specific result to reference
- **Video platform** (optional) -- Loom, Vidyard, or other (default: Loom)

If prospect data is missing, ask: "I need the prospect's name, company, role, and at least one specific detail about them or their company to write the script. What do you have?"

## Steps

### Step 0 -- Check for Existing Output

Search the project for any existing output from a previous run of this skill (check common locations like `docs/`, the project root, or any organized output directory). If a previous version is found, present a summary and ask: "A video script for this prospect already exists. Do you want me to (a) update with new data, (b) try a different angle, or (c) rebuild from scratch?" 

### Step 1 -- Load Context

Search the project for any available context. Look in the project root, `docs/`, or any organized directory. Read what you find:

1. **Persona profiles** -- persona profile if available
2. **Persona profiles** -- personalization snippets if available
3. **Messaging matrix** -- relevant messaging
4. `CLAUDE.md` -- project-level instructions

Identify the single strongest personalization angle. The video lives or dies on specificity.

### Step 2 -- Write the Hook (First 5 Seconds, ~12 Words)

The hook must include:
- Their name (say it immediately)
- Something specific about them or their company

Examples of good hooks:
- "Hey {name}, I was looking at {company}'s {specific page/product/announcement} and noticed..."
- "Hey {name}, I saw your post about {topic} and it got me thinking..."
- "Hey {name}, congrats on {specific event}. That's a big deal for {company}."

The hook must be specific enough that they know this video was made for them, not batch-sent.

### Step 3 -- Write the Bridge (10 Seconds, ~25 Words)

Connect what you noticed to a problem you solve:
- Transition from the observation to a relevant challenge
- Use their language, not your product language
- This should feel like a natural insight, not a sales pivot

### Step 4 -- Write the Value (15 Seconds, ~38 Words)

State what you help with and include one proof point:
- Lead with the outcome, not the product
- Include one specific number or result
- Make it relevant to their industry or company size if possible

### Step 5 -- Write the CTA (10 Seconds, ~25 Words)

Make one specific ask:
- Suggest a specific time or action ("I left a link below to grab 15 minutes this week")
- Make it low-friction
- End with energy, not trailing off

### Step 6 -- Write Thumbnail Text

Suggest text to overlay on the video thumbnail:
- 3-5 words max
- Should include their name or company
- Creates curiosity or relevance
- Examples: "{Name}, quick question", "For {Company}'s team", "{Name} -- saw this"

### Step 7 -- Quality Gate

Run these checks before saving:

- [ ] Total script is under 110 words (~45 seconds)
- [ ] Hook is under 12 words and includes prospect's name
- [ ] Hook references something specific to this prospect
- [ ] Bridge connects observation to problem naturally
- [ ] Value includes one specific proof point with a number
- [ ] CTA is one clear, low-friction ask
- [ ] Thumbnail text is 3-5 words
- [ ] Script reads naturally when spoken aloud (no written-language constructions)
- [ ] No em dashes in any copy

If any check fails, fix it before proceeding.

## Output Format

Save the output to your project. Suggested filename: `video-script-{prospect-slug}.md`

```markdown
# Video Script: {Prospect Name} at {Company}
Date: {Date}
Platform: {Loom/Vidyard}
Total time: ~45 seconds
Total words: {count}/110

## Script

### Hook (0:00-0:05)
{Script text}

### Bridge (0:05-0:15)
{Script text}

### Value (0:15-0:30)
{Script text}

### CTA (0:30-0:45)
{Script text}

## Thumbnail
Text: "{thumbnail text}"
Suggestion: {brief note on what to show in the thumbnail}

## Recording Tips
- Record their website/LinkedIn/relevant page on your screen during the hook
- Switch to your face for the bridge and value sections
- Show the calendar link or meeting page during the CTA
- Smile. Energy matters more than perfection.

## Personalization Source
- Observation used: {what you referenced and where you found it}
- Backup angles if this one feels stale: {1-2 alternatives}
```

## Key Principles

1. **The first 5 seconds determine everything.** If the prospect doesn't hear their name and something specific in the first 5 seconds, they close the video.
2. **Specificity is the entire point.** The reason video works better than email is because it proves you did research. Generic videos perform worse than emails.
3. **Speak, don't read.** The script is a guide for what to say, not a teleprompter. Natural delivery beats polished production.
4. **45 seconds is a hard ceiling.** Prospecting videos that go over a minute see dramatic drop-off. Say less, say it better.

## Anti-Patterns

- **Generic hooks.** "Hey {name}, I help companies like yours..." is not personalized. It's a mail merge with a face.
- **Overproduced videos.** Perfect lighting and editing signal "this is a marketing video," not "a real person recorded this for me." Keep it authentic.

## What to Do Next

- Write **cold email** to send alongside the video link: `/skill cold-email-writer`
- Add **personalization snippets** for more angles: `/skill outreach-personalizer`
- Build **full multichannel sequence** including video touchpoints: `/skill write-outbound-sequence`

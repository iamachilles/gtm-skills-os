---
description: Write a podcast guest pitch with show research, topic angles, and bio. Use when someone says "podcast pitch", "pitch a podcast", "guest on a podcast", "podcast outreach", "get on a show", or "podcast guest"
tools: Read, Write, WebSearch
---

# Podcast Guest Pitch

Write a podcast guest pitch that gets accepted. Podcast hosts receive dozens of pitches. Most are generic "I'd love to be a guest" messages that get deleted. A winning pitch shows you know the show, offers specific value to their audience, and makes it easy to say yes.

Hard cap: the pitch itself must be under 200 words. Hosts don't read essays.

## Inputs

- **Show name** (required) -- the podcast to pitch
- **Your topic angle** (required) -- what you'd talk about
- **Your bio** (optional) -- background and credentials
- **Recent work** (optional) -- articles, posts, or talks to reference

If show name or topic angle are missing, ask: "Which podcast are you pitching, and what topic angle do you want to bring? I need the show name and your proposed topic."

## Steps

### Step 0 -- Check for Existing Output

Read `docs/content/podcast-pitch-{show-slug}.md`. If found, ask: "A pitch for [show name] already exists. Do you want me to (a) update with a new angle, (b) refresh the research, or (c) rewrite?"

### Step 1 -- Load Context

Read available context:

1. `docs/gtm-triangle.md` -- your positioning
2. `docs/personas/*.md` -- your expertise areas
3. `docs/content-strategy.md` -- content themes
4. `CLAUDE.md` -- project-level instructions

### Step 2 -- Research the Show

Run these searches:

- Search: `{show name} podcast host`
- Search: `{show name} recent episodes`
- Search: `{show name} topics`

Capture:
- **Host name** and their background
- **Audience profile** (who listens)
- **Format** (interview, panel, solo + guest, length)
- **Recent episodes** (last 5-10 titles to understand themes)
- **Content gaps** (topics they haven't covered but should)
- **Guest profile** (what kind of guests they feature)

If research yields insufficient results, note the gaps and work with what's available.

### Step 3 -- Develop Topic Angles

Create 3 topic angles, each with a suggested episode title:

For each angle:
- **Episode title** (under 10 words, benefit-focused for their audience)
- **What you'd cover** (3 bullet points of specific talking points)
- **Why it fits this show** (one sentence connecting to their existing content)

Rules:
- Each angle must serve the show's audience, not just promote you
- Reference a specific recent episode to show you actually listen
- Offer something they haven't covered yet

### Step 4 -- Write the Pitch

Structure (under 200 words total):

**Subject line:** "[Show name] episode idea: [hook]"

**Paragraph 1: Who you are (1 sentence)**
Your name, what you do, and one credibility marker.

**Paragraph 2: Why their audience (2 sentences)**
Connect your topic to their audience's interests. Reference a specific episode.

**Paragraph 3: Topic angles (3 bullet points)**
The 3 episode title suggestions with one-line descriptions.

**Paragraph 4: Your bio (under 50 words)**
Credentials, relevant experience, and one proof point.

**Paragraph 5: Close (1 sentence)**
Availability and easy next step.

### Step 5 -- Write the Bio

Craft a 50-word bio tailored to this show's audience:
- Lead with the credential most relevant to their listeners
- Include one specific result or proof point
- End with something human (not just titles and companies)

### Step 6 -- Quality Gate

- [ ] Pitch is under 200 words (count them)
- [ ] Subject line includes the show name
- [ ] Pitch references a specific recent episode
- [ ] 3 topic angles provided, each with an episode title
- [ ] Each angle serves the show's audience, not just self-promotion
- [ ] Bio is under 50 words
- [ ] The pitch makes it easy to say yes (specific, low-friction)
- [ ] Host is addressed by name
- [ ] No generic "I'd love to be a guest" language

If any check fails, fix it before proceeding.

## Output Format

Save to `docs/content/podcast-pitch-{show-slug}.md`:

```markdown
# Podcast Pitch: [Show Name]
Host: [Name]
Audience: [Who listens]
Format: [Interview/Panel/etc.]
Date: [Date]

## Show Research
- **Recent episodes:** [5 recent titles]
- **Themes:** [Main topics they cover]
- **Content gap:** [What they haven't covered]
- **Guest profile:** [Who they typically feature]

## Topic Angles

### Angle 1: [Episode Title]
- [Talking point 1]
- [Talking point 2]
- [Talking point 3]
**Fit:** [Why this works for their audience]

### Angle 2: [Episode Title]
[Same structure]

### Angle 3: [Episode Title]
[Same structure]

## The Pitch (Under 200 Words)

**Subject:** [Subject line]

[Full pitch email text]

## Bio (Under 50 Words)
[Tailored bio]

## Follow-Up Plan
- **If no response in 7 days:** [Brief follow-up message]
- **If they respond with interest:** [Next steps to suggest]
- **Prep notes:** [What to prepare if accepted]
```

## Key Principles

1. **The pitch is about their audience, not about you.** Hosts accept guests who serve their listeners. Lead with what their audience gets, not your credentials.
2. **Specificity signals effort.** Referencing a specific episode proves you listen to the show. Generic pitches prove you have a mailing list.
3. **Under 200 words. No exceptions.** Hosts are busy. A long pitch signals someone who will be hard to work with. Be concise.
4. **Episode titles are the hook.** A compelling episode title does half the selling. "3 Outbound Plays That Book Meetings Without Cold Calling" is better than "I can talk about outbound."

## Anti-Patterns

- **The spray-and-pray pitch:** Sending the same generic email to 50 shows. Hosts can tell. Research the show or don't pitch it.
- **The credentials dump:** Three paragraphs about your awards and experience before mentioning what you'd talk about. Lead with value, not vanity.
- **The vague topic:** "I can talk about marketing." That's not a pitch. That's a category. Offer specific, episode-ready topics with titles.

## What to Do Next

- Prepare **talking points** for the interview: `/skill customer-interview-guide`
- Write a **LinkedIn post** about the appearance: `/skill write-linkedin-post`
- **Repurpose** the episode into content: `/skill content-repurposer`

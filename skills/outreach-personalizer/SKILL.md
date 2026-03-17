---
description: Generate personalization snippets from prospect research across 5 angles. Use when someone says "personalize outreach", "research prospect", "personalization snippets", "prospect research", "custom opener", or "personalized first line"
tools: Read, Write, WebSearch
---

# Outreach Personalizer

Generate personalization snippets from prospect data across 5 research angles. Each snippet is a 1-sentence opener ready to drop into a cold email, LinkedIn message, or video script. Ranked by relevance so the strongest angle goes first.

## Inputs

- **Enriched prospect data** (required) -- company name, contact name, title, and any known context
- **Company URL** (optional) -- for website and news research
- **LinkedIn URL** (optional) -- for activity and post research
- **Campaign context** (optional) -- what you're reaching out about (to rank relevance)

If prospect data is missing, ask: "I need at least the prospect's name, company, and title to generate personalization. What do you have?"

## Steps

### Step 0 -- Check for Existing Output

Read `docs/sequences/personalization-{prospect-slug}.md` if it exists. If found, present a summary and ask: "Personalization snippets for this prospect already exist. Do you want me to (a) refresh with new research, (b) add more angles, or (c) rebuild from scratch?"

### Step 1 -- Load Context

Read all available context:

1. `docs/personas/{persona-slug}.md` -- persona profile for this role type
2. `docs/messaging-matrix.md` -- messaging angles
3. `CLAUDE.md` -- project-level instructions

### Step 2 -- Research 5 Personalization Angles

Research each angle and write a 1-sentence opener for each:

**Angle 1: Recent Company News**
Search: "{company} news", "{company} announcement", "{company} funding OR acquisition OR launch"
Look for: funding rounds, product launches, expansions, leadership changes, partnerships.
Write an opener that references the news and connects it to a relevant challenge or opportunity.

**Angle 2: Prospect's LinkedIn Activity**
Search: "{person name} {company} linkedin", "{person name} {title}"
Look for: recent posts, articles, comments, job changes, shared content.
Write an opener that references something specific they said or shared.

**Angle 3: Shared Connections or Experiences**
Look for: mutual connections, shared alma mater, same previous employer, same conferences, shared group memberships.
Write an opener that references the shared ground.

**Angle 4: Company-Specific Pain Point**
Search: "{company} challenges", "{company} {industry} problems", "{company} reviews"
Look for: public pain points (job postings revealing gaps, G2 reviews mentioning issues, industry reports).
Write an opener that names the pain without assuming too much.

**Angle 5: Trigger Event**
Search: "{company} hiring {role}", "{company} expansion", "{company} {relevant keyword}"
Look for: job postings (signal priorities), office openings, new market entry, regulatory changes.
Write an opener that connects the trigger to why your outreach is timely.

### Step 3 -- Rank by Relevance

Rank all 5 openers from strongest to weakest based on:
1. How specific is it? (specific beats generic)
2. How recent is it? (this week beats last year)
3. How relevant is it to the campaign context?
4. How verifiable is it? (public information beats assumptions)

### Step 4 -- Anti-Fabrication Check

For each snippet, verify:
- Is this based on something you actually found, or are you inferring?
- Can the prospect confirm this is true about them?
- Would they be impressed by the research, or creeped out?

If no strong personalization angle is found for a category, write: "No strong angle found. Recommend using a role-based opener instead: {fallback opener}."

Do not fabricate personal details, recent events, or LinkedIn activity. A generic but honest email beats a fabricated personal reference every time.

### Step 5 -- Quality Gate

Run these checks before saving:

- [ ] All 5 angles are researched (or explicitly marked as "no angle found")
- [ ] Each snippet is exactly 1 sentence
- [ ] No snippet contains fabricated or unverifiable claims
- [ ] Snippets are ranked by relevance with rationale
- [ ] Sources are cited for each snippet
- [ ] No snippet would make the prospect uncomfortable (too personal, too stalker-ish)
- [ ] No em dashes in any copy
- [ ] Fallback openers are provided for any missing angles

If any check fails, fix it before proceeding.

## Output Format

Save to `docs/sequences/personalization-{prospect-slug}.md`:

```markdown
# Personalization: {Prospect Name} at {Company}
Date: {Date}
Research date: {Date}

## Ranked Snippets

### 1. {Angle Name} (Rank: strongest)
**Opener:** {1-sentence opener}
**Source:** {where you found this}
**Relevance:** {why this is the strongest angle}

### 2. {Angle Name}
**Opener:** {1-sentence opener}
**Source:** {where you found this}
**Relevance:** {why this ranks here}

### 3. {Angle Name}
**Opener:** {1-sentence opener}
**Source:** {where you found this}
**Relevance:** {why this ranks here}

### 4. {Angle Name}
**Opener:** {1-sentence opener}
**Source:** {where you found this}
**Relevance:** {why this ranks here}

### 5. {Angle Name}
**Opener:** {1-sentence opener}
**Source:** {where you found this}
**Relevance:** {why this ranks here}

## Recommended Usage
- **Cold email first line:** Use snippet #{N}
- **LinkedIn connection request:** Use snippet #{N}
- **Video script hook:** Use snippet #{N}

## Research Notes
- Last researched: {date}
- Refresh recommended: {date + 2 weeks}
- Key signals to monitor: {what to watch for}
```

## Key Principles

1. **Personalization is proof of effort.** The prospect should think "they actually looked into us" not "they mail-merged my name into a template."
2. **Specificity scales; flattery doesn't.** "I saw your post about reducing churn through onboarding changes" is specific. "I'm impressed by your company's growth" is flattery.
3. **Recency matters.** Something from this week beats something from last quarter. If you can't find anything recent, use a role-based angle.
4. **Honest gaps beat fabricated fills.** If you can't find a good angle, say so. A generic opener is infinitely better than referencing a LinkedIn post they never wrote.
5. **Research has a shelf life.** Personalization snippets go stale. Mark the research date and recommend a refresh window.

## Anti-Patterns

- **Fabricating personalization.** Referencing a post they didn't write or a news event that didn't happen destroys credibility instantly. If you can't verify it, don't use it.
- **Over-researching into creepy territory.** Mentioning their kids' school or their weekend Instagram post is not personalization. It's surveillance.
- **Using the same angle for everyone at the company.** If you're multi-threading, each contact needs their own personalization. Don't recycle the same company news for all of them.

## What to Do Next

- Write **cold email** using the top snippet: `/skill cold-email-writer`
- Write **video script** with personalized hook: `/skill video-prospecting-script`
- Build **multi-thread sequence** with per-contact personalization: `/skill multi-thread-sequence`

---
description: "Build a prospect list from event attendees, speakers, and sponsors. Trigger: 'prospect from event', 'find leads from conference', 'event attendees list', 'who is speaking at', 'conference prospects'"
tools: Read, Write, WebFetch, WebSearch
---

# Event Prospector

Extract prospects from an event by researching speakers, sponsors, exhibitors, and attendees. Each prospect gets a personalized outreach angle based on their event involvement (spoke on X topic, sponsored Y track, exhibited in Z category).

Events are time-bound. Outreach is most effective before or immediately after the event. The output flags timing recommendations.

## Inputs

- **Event name or URL** (required) — the conference, summit, or event to prospect from
- **ICP criteria** (optional) — for scoring; if not provided, check docs/icp.md
- **Prospect type filter** (optional) — "speakers", "sponsors", "exhibitors", "attendees", or "all". Default: all
- **Outreach timing** (optional) — "pre-event", "during-event", "post-event". Affects angle recommendations.

If the event name is missing, ask: "Which event should I prospect from? Provide the event name or URL."

## Steps

### Step 0 — Idempotency Check

Check if `docs/prospects/event-{event-slug}.md` already exists. If it does, ask: "An event prospect list for this event already exists. Should I overwrite or update it?"

### Step 1 — Load Context

Read available context:
- `docs/icp.md` — ICP criteria for scoring
- `docs/gtm-triangle.md` — value proposition for outreach angles
- `CLAUDE.md` — project instructions

### Step 2 — Research the Event

Gather event details using WebSearch and WebFetch:

**Event basics:**
- Event name, dates, location
- Event website URL
- Event theme and tracks
- Estimated attendance size
- Target audience description

**Search queries:**
- `"{event name}" speakers {year}`
- `"{event name}" sponsors {year}`
- `"{event name}" exhibitors list {year}`
- `"{event name}" attendees {year}`
- `"{event name}" agenda {year}`
- `site:{event domain} speakers`
- `site:{event domain} sponsors`

**Use WebFetch on:**
- Event speaker page
- Event sponsor page
- Event exhibitor directory
- Event agenda (to understand topics and tracks)

### Step 3 — Extract Prospects by Category

**Speakers:**
- Name, title, company
- Talk title and topic
- Speaker bio (if available)
- LinkedIn URL (search: "site:linkedin.com/in {speaker name} {company}")

**Sponsors:**
- Company name, sponsorship tier (platinum, gold, etc.)
- Company website
- Relevant contacts at the company (search: "{company} {relevant title}")

**Exhibitors:**
- Company name and booth/category
- Company website
- What they're showcasing

**Attendees (if list is available):**
- Names and companies from published attendee lists
- Registered attendees from social media (#eventhashtag posts)

### Step 4 — Enrich and Score

For each prospect company:
- Industry and size
- ICP fit score (1-5)
- Relevance of their event involvement to your solution

For each prospect contact:
- Title and role
- LinkedIn URL
- Buying committee role (if applicable)

### Step 5 — Define Outreach Angles

Write a per-contact outreach angle that references their specific event involvement:

**Speaker angles:**
- "Your talk on {topic} at {event} aligns with what we're building for {use case}."
- Reference a specific point from their talk description.

**Sponsor angles:**
- "Noticed {company} is sponsoring {event}. Companies investing in {event theme} visibility are usually also investing in {related area}."

**Exhibitor angles:**
- "Saw {company} is exhibiting at {event}. Your {product/category} suggests you're dealing with {relevant challenge}."

**Attendee angles:**
- "Saw you're attending {event}. The {track/topic} focus connects to {relevant challenge}."

### Step 6 — Quality Gate

Before saving, verify:
- [ ] Event details (name, date, location) are accurate
- [ ] Each prospect has a source category (speaker, sponsor, exhibitor, attendee)
- [ ] Outreach angles reference specific event involvement
- [ ] ICP scores are justified
- [ ] No fabricated contact information
- [ ] Timing recommendation is included (pre/during/post event)

If any check fails, fix before proceeding.

## Output Format

Save to `docs/prospects/event-{event-slug}.md`:

```
# Event Prospects: {Event Name}
Date generated: {date}
Event dates: {start} to {end}
Event location: {city, venue}
Outreach window: {recommended timing}
Total prospects: {count}

## Event Overview
- Theme: {event theme}
- Estimated attendance: {size}
- Key tracks: {relevant tracks}
- Event URL: {url}

## Prospects by Category

### Speakers ({count})

| # | Name | Company | Talk Topic | Title | ICP Score | Outreach Angle |
|---|------|---------|------------|-------|-----------|----------------|
| 1 | {name} | {company} | {topic} | {title} | {X}/5 | {angle} |

### Sponsors ({count})

| # | Company | Tier | Contact | Title | ICP Score | Outreach Angle |
|---|---------|------|---------|-------|-----------|----------------|
| 1 | {company} | {tier} | {name} | {title} | {X}/5 | {angle} |

### Exhibitors ({count})

| # | Company | Category | Contact | Title | ICP Score | Outreach Angle |
|---|---------|----------|---------|-------|-----------|----------------|
| 1 | {company} | {cat} | {name} | {title} | {X}/5 | {angle} |

## Priority Actions
- **Before the event:** {who to contact and how}
- **During the event:** {who to meet and where}
- **After the event:** {follow-up sequence recommendations}

## Notes
- {Observations about the event audience}
- {Recommendations for future events in this space}
```

## Key Principles

1. **Event context is the angle.** Generic outreach to event attendees is spam. The angle must reference their specific involvement (talk topic, sponsorship level, exhibit category).
2. **Timing matters more than usual.** Pre-event outreach to speakers gets meetings. Post-event follow-up within 48 hours works. Two months later, the event context is stale.
3. **Speakers are the highest-value targets.** They've publicly committed to a topic, making them easy to personalize for and likely engaged in the space.
4. **Sponsors signal budget.** A company spending $20K+ on a booth has budget allocated to the problem space. That's a buying signal.

## Anti-Patterns

- **The Mass Lister:** Pulling 200 names from an attendee list without scoring, filtering, or personalizing. Volume without targeting is spam.
- **The Generic Networker:** Writing outreach angles like "Great event! Would love to connect." The angle must reference something specific about their event involvement.
- **The Late Prospector:** Building the event prospect list 2 months after the event. Event context expires. Start research before or during the event.

## Next Skills

- Event prospects identified? Run **write-outbound-sequence** with event-specific messaging.
- Need to validate contacts? Run **email-validator** before sending.
- Multiple events in your pipeline? Run **trigger-campaign-designer** for an event-based micro-campaign.

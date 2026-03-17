---
description: Generate a 4-week content calendar with 12 posts balanced across angles and formats. Use when someone says "content calendar", "content plan", "plan my posts", "monthly content", "what should I post", or "content schedule"
tools: Read, Write
---

# Content Calendar

Generate a 4-week content calendar with 12 posts (3 per week), balanced across angles, formats, and topics. A content calendar is not a list of random ideas. It's a strategic sequence where each post builds on the last and the mix is deliberately balanced.

## Inputs

- **Strategy document** (required) -- content strategy, themes, and positioning
- **Recent performance** (optional) -- what worked, what didn't, engagement data
- **Upcoming events** (optional) -- launches, conferences, deadlines, seasonal moments
- **Content backlog** (optional) -- existing ideas or drafts to incorporate

If strategy document is missing, ask: "I need your content strategy or at least your key themes and audience to build a calendar. Do you have docs/content-strategy.md, or can you share your 3-4 main content pillars?"

## Steps

### Step 0 -- Check for Existing Output

Read `docs/content/calendar-{month}.md`. If found, present summary and ask: "A content calendar for [month] already exists. Do you want me to (a) adjust specific weeks, (b) swap topics, or (c) rebuild from scratch?"

### Step 1 -- Load Context

Read all available context:

1. `docs/content-strategy.md` -- themes, angles, and positioning
2. `docs/content/posts/*.md` -- recent post drafts
3. `docs/personas/*.md` -- who the content is for
4. `docs/gtm-triangle.md` -- market positioning
5. `CLAUDE.md` -- project-level instructions

### Step 2 -- Analyze Recent Performance

If performance data is available, identify:
- Top 3 performing posts (by engagement, reach, or leads)
- Common traits of top performers (angle, format, topic, time posted)
- Underperforming topics or formats to reduce
- Gaps in the content mix (angles or topics not covered recently)

If no performance data, note this and balance based on strategy alone.

### Step 3 -- Plan the Mix

Distribute 12 posts across 4 weeks following this balance:

**Angle distribution (target):**
- Storytelling: 20% (2-3 posts)
- Documentation: 20% (2-3 posts)
- Resource: 30% (3-4 posts)
- Education: 30% (3-4 posts)

**Format distribution:**
- Text only: 4-5 posts
- Carousel: 2-3 posts
- Image/screenshot: 2-3 posts
- Video or document: 1-2 posts

**Rules:**
- No two consecutive posts with the same angle
- No more than 2 resource posts in one week
- At least one storytelling post per 2 weeks
- Incorporate upcoming events where they naturally fit
- Each week has variety in both angle and format

### Step 4 -- Write Briefs

For each of the 12 posts, write a brief:

- **Topic:** What the post is about (one sentence)
- **Hook direction:** The type of hook to use (contrarian, credibility, curiosity, specificity, dialogue)
- **Angle:** Storytelling, Documentation, Resource, or Education
- **Format:** Text, Carousel, Image, Video, Document
- **CTA type:** Engagement (question/comment), Lead gen (DM/resource), or Awareness (share/tag)
- **Key message:** The one takeaway (one sentence)
- **Source material:** What to draw from (case study, data, experience, framework)

### Step 5 -- Flag Content Gaps

Identify what's missing from the calendar:
- Topics the strategy calls for but the calendar doesn't cover
- Audiences not addressed
- Formats not represented
- Themes that are overweighted
- Recommend 2-3 additional topics to develop for the following month

### Step 6 -- Quality Gate

- [ ] 12 posts planned across 4 weeks (3 per week)
- [ ] Angle distribution is within 10% of target ratios
- [ ] No two consecutive posts share the same angle
- [ ] Each week has at least 2 different formats
- [ ] Every brief has a clear hook direction and key message
- [ ] Upcoming events are incorporated where relevant
- [ ] Content gaps are identified with recommendations

If any check fails, fix it before proceeding.

## Output Format

Save to `docs/content/calendar-{month}.md`:

```markdown
# Content Calendar: [Month Year]
Posts planned: 12
Date created: [Date]

## Performance Insights (from last period)
- **Top performer:** [Post topic] -- [why it worked]
- **Underperformer:** [Post topic] -- [what to avoid]
- **Key learning:** [One sentence]

## Mix Summary
| Angle | Target | Planned | Notes |
|---|---|---|---|
| Storytelling | 20% | [X] posts | |
| Documentation | 20% | [X] posts | |
| Resource | 30% | [X] posts | |
| Education | 30% | [X] posts | |

---

## Week 1: [Date Range]

### Monday
- **Topic:** [Topic]
- **Angle:** [Angle]
- **Format:** [Format]
- **Hook direction:** [Hook type]
- **CTA type:** [CTA type]
- **Key message:** [One sentence]
- **Source:** [What to draw from]

### Wednesday
[Same structure]

### Friday
[Same structure]

---

## Week 2: [Date Range]
[Same structure for 3 posts]

## Week 3: [Date Range]
[Same structure for 3 posts]

## Week 4: [Date Range]
[Same structure for 3 posts]

---

## Content Gaps
- [Gap 1 with recommendation]
- [Gap 2 with recommendation]
- [Gap 3 with recommendation]

## Next Month Preview
- [2-3 topics to develop]
```

## Key Principles

1. **Balance is intentional.** The mix of angles and formats isn't random. It's designed so the audience gets variety while the strategy stays focused.
2. **Every post has a job.** Some posts drive engagement, some generate leads, some build authority. Know which is which before writing.
3. **Consistency compounds.** Three good posts per week for 3 months beats 10 posts in week one and silence after.
4. **Plan the calendar, not the content.** Briefs give direction without over-prescribing. Leave room for the writer to find the best angle.

## Anti-Patterns

- **The content dump:** Planning 20 posts in a burst, then not posting for 3 weeks. Sustainable cadence beats heroic sprints.
- **All education, no personality:** Twelve how-to posts in a row. The audience needs to see the person behind the expertise. Mix in storytelling and opinions.
- **Ignoring the data:** Repeating formats and angles that underperform because "that's the strategy." Adjust based on what the audience actually responds to.

## What to Do Next

- Write the first week's posts: `/skill write-linkedin-post`
- Generate **hook variants** for the most important posts: `/skill hook-generator`
- Plan a **lead magnet** to support the calendar's resource posts: `/skill lead-magnet-creator`

---
description: Analyze content performance and recommend next pieces. Use when someone says "content performance", "content analysis", "content metrics", "what content works", "content ROI", "content audit", or "top performing content"
tools: Read, Write
---

# Content Performance Analyzer

Analyze content performance across impressions, engagement, and pipeline influence. Identifies patterns in what works, calculates content ROI, finds gaps, and recommends the next 5 pieces to create.

## Inputs

- **Content metrics** (required) -- performance data per piece (impressions, engagement rate, clicks, pipeline influenced)
- **Content inventory** (required) -- list of content published with format, topic, and date
- **Time period** (optional) -- date range for analysis
- **Time invested** (optional) -- hours spent creating each piece (for ROI calculation)

If content metrics are missing, ask: "I need performance data for your content (impressions, engagement, clicks, or pipeline influence per piece). What data do you have?"

## Steps

### Step 0 -- Check for Existing Output

Read `docs/analytics/content-performance.md` if it exists. If found, present a summary and ask: "A content performance analysis already exists. Do you want me to (a) update with new data, (b) analyze a different period, or (c) keep it?"

### Step 1 -- Load Context

Read all available context:

1. `docs/analytics/*.md` -- existing analytics
2. `docs/content/*.md` -- content strategy and existing content
3. `docs/gtm-triangle.md` -- ICP context (who the content should reach)
4. `CLAUDE.md` -- project-level instructions

### Step 2 -- Rank by Impressions

| Rank | Content | Format | Topic | Impressions | Date |
|------|---------|--------|-------|------------|------|
| 1 | {title} | {type} | {topic} | {N} | {date} |
| {rows} |

Top 5 and bottom 5. Identify what the top performers have in common (format, topic, hook style, publish day).

### Step 3 -- Rank by Engagement Rate

| Rank | Content | Format | Engagement Rate | Engagements | Impressions |
|------|---------|--------|----------------|-------------|------------|
| {rows} |

Engagement rate = (likes + comments + shares + saves) / impressions

Separate high-impression/low-engagement from low-impression/high-engagement. The former means distribution is working but content doesn't resonate. The latter means the content resonates but needs better distribution.

### Step 4 -- Rank by Pipeline Influence

| Rank | Content | Pipeline Influenced | Opportunities | Revenue |
|------|---------|-------------------|---------------|---------|
| {rows} |

If pipeline data isn't available, use proxy metrics: link clicks, demo requests, or inbound inquiries attributed to content.

### Step 5 -- Identify Patterns

Analyze across the three rankings:

**By topic:**
| Topic | Avg. Impressions | Avg. Engagement Rate | Pipeline Influence |
|-------|-----------------|---------------------|-------------------|
| {rows} |

**By format:**
| Format | Avg. Impressions | Avg. Engagement Rate | Pipeline Influence |
|--------|-----------------|---------------------|-------------------|
| {rows} |

**By angle/hook type:**
| Angle | Avg. Impressions | Avg. Engagement Rate |
|-------|-----------------|---------------------|
| {rows} |

Identify:
- Which topic consistently performs? (Your audience's core interest)
- Which format gets most engagement? (Your audience's preferred consumption style)
- Which angle gets most impressions? (What earns distribution)

### Step 6 -- Calculate Content ROI

If time data is available:

| Content | Time Invested (hrs) | Pipeline Influenced | ROI (Pipeline/Hour) |
|---------|--------------------|--------------------|-------------------|
| {rows} |

Identify the highest and lowest ROI content. The goal is to invest more time in high-ROI formats and less in low-ROI ones.

### Step 7 -- Identify Content Gaps

Compare topics your audience engages with vs. topics you've covered:

**Covered well:** {topics with multiple high-performing pieces}
**Covered poorly:** {topics with pieces published but low performance}
**Not covered:** {topics your audience cares about that you haven't addressed}

Sources for gap identification:
- Comments and questions on existing content
- Topics competitors cover that you don't
- Customer questions that come up repeatedly
- Industry trends relevant to your ICP

### Step 8 -- Recommend Next 5 Pieces

Based on pattern analysis and gap identification:

| # | Topic | Format | Angle | Why |
|---|-------|--------|-------|-----|
| 1 | {topic} | {format} | {angle} | {Based on top-performing pattern + gap} |
| 2 | {topic} | {format} | {angle} | {reasoning} |
| 3 | {topic} | {format} | {angle} | {reasoning} |
| 4 | {topic} | {format} | {angle} | {reasoning} |
| 5 | {topic} | {format} | {angle} | {reasoning} |

Rule: each recommendation must reference a specific data point. "Write about ABM" is not a recommendation. "Write a carousel about ABM targeting because carousels get 2x engagement and ABM is your highest-pipeline topic" is.

### Step 9 -- Quality Gate

- [ ] Content is ranked by impressions, engagement, AND pipeline influence
- [ ] Patterns are identified by topic, format, and angle
- [ ] Content ROI is calculated (if time data available)
- [ ] Content gaps are identified with sources
- [ ] 5 specific recommendations with data-backed reasoning
- [ ] Top and bottom performers are identified with commonalities
- [ ] No em dashes in any copy

## Output Format

Save to `docs/analytics/content-performance.md`:

```markdown
# Content Performance Analysis

Date: {Date}
Period: {Date range}
Pieces analyzed: {N}

## Summary
{2-3 sentences: what's working, what's not, primary recommendation}

## Top Performers
### By Impressions
| Content | Impressions | Format | Topic |
|---------|------------|--------|-------|
| {top 5} |

### By Engagement
| Content | Engagement Rate | Format | Topic |
|---------|----------------|--------|-------|
| {top 5} |

### By Pipeline Influence
| Content | Pipeline | Format | Topic |
|---------|---------|--------|-------|
| {top 5} |

## Patterns
### By Topic
{Table + insight}
### By Format
{Table + insight}
### By Angle
{Table + insight}

## Content ROI
{ROI table if time data available}

## Content Gaps
- **Not covered:** {topics to address}
- **Underperforming:** {topics to revisit with different approach}

## Recommended Next 5 Pieces
| # | Topic | Format | Angle | Reasoning |
|---|-------|--------|-------|-----------|
| {rows} |
```

## Key Principles

1. **Three rankings tell three stories.** Impressions show reach. Engagement shows resonance. Pipeline shows revenue impact. A piece can rank high on one and low on another, and that's valuable information.
2. **Patterns matter more than outliers.** One viral post is luck. A topic that consistently gets 2x engagement is a pattern worth doubling down on.
3. **Content ROI is time-adjusted.** A post that took 30 minutes and generated 2 meetings has better ROI than a whitepaper that took 40 hours and generated 3. Invest accordingly.
4. **Gaps are opportunities.** Topics your audience asks about but you haven't covered are the highest-probability wins for your next content.
5. **Data-backed recommendations beat gut feel.** "I think we should write about X" is a guess. "X is our highest-engagement topic and we haven't covered the Y angle yet" is a strategy.

## Anti-Patterns

- **Optimizing for vanity metrics.** Chasing impressions when engagement or pipeline is the real goal. High impressions with zero pipeline influence means you're reaching the wrong people.
- **Ignoring low-performers.** Not analyzing why something flopped. The bottom 5 teach you as much as the top 5. Was it the topic, the format, or the timing?
- **Content planning without data.** Creating a content calendar based on what you want to write about instead of what your audience engages with.

## What to Do Next

- Write the **recommended content pieces**: `/skill blog-post-writer` or `/skill write-linkedin-post`
- Analyze **campaign performance** that distributes content: `/skill campaign-analyzer`
- Track **attribution** of content to pipeline: `/skill attribution-modeler`

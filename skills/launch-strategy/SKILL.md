---
description: Plan a product or feature launch with tiered strategy and channel activation timeline. Use when someone says "launch plan", "launch strategy", "product launch", "feature launch", "go-to-market launch", "plan a release", or "launch checklist"
tools: Read, Write
---

# Launch Strategy

Plan a structured product or feature launch with a tiered approach, channel activation timeline, content needs, sales enablement plan, and success metrics. A launch is not an announcement. It's a coordinated sequence of activities that puts the right message in front of the right people at the right time through the right channels.

This skill produces a single-document launch plan. Hard cap: one document, no 50-page plans. If it doesn't fit in one document, the launch is either too complex (break it into phases) or the plan has too much filler (cut it).

## Inputs

- **What's launching** (required) -- product, feature, service, or update. Include a description of what it does and who it's for.
- **Target segments and personas** (required) -- who should know about this and who should buy
- **Launch date** (optional) -- if fixed, the plan works backward from it
- **Messaging matrix** (optional) -- existing messaging to pull from
- **Available channels** (optional) -- what channels are active and producing results
- **Budget and resources** (optional) -- what's available for the launch

If "what's launching" or target segments are missing, ask: "I need to know what you're launching and who the target audience is. What's the product/feature and which personas should we reach?"

## Steps

### Step 0 -- Check for Existing Output

Read `docs/launches/{launch-slug}.md` where `{launch-slug}` is the launch name slugified. If found, present a summary and ask: "A launch plan already exists for '[launch name]'. Do you want me to (a) update the timeline, (b) add channels or content, or (c) rebuild from scratch?"

### Step 1 -- Load Context

Read all available context:

1. `docs/messaging-matrix.md` -- messaging per persona per value pillar
2. `docs/personas/*.md` -- persona profiles for targeting
3. `docs/gtm-triangle.md` -- positioning and channel strategy
4. `docs/value-prop-matrix.md` -- value props for launch messaging
5. `CLAUDE.md` -- project-level instructions

### Step 2 -- Define Launch Tier

Classify the launch to determine scope and effort:

**Tier 1: Major Product Launch**
- New product, new market entry, major pivot, or rebrand
- Duration: 6-8 weeks (2 weeks pre-launch, launch week, 4 weeks post-launch)
- All channels activated
- Executive involvement required
- Press/analyst outreach included
- Sales enablement full suite

**Tier 2: Significant Feature Launch**
- Major feature that changes the value proposition or opens a new use case
- Duration: 3-4 weeks (1 week pre-launch, launch day, 2-3 weeks post-launch)
- Select channels activated
- Sales enablement focused update
- No press outreach unless newsworthy

**Tier 3: Minor Update or Enhancement**
- Bug fix, UI improvement, incremental feature
- Duration: 1 week (launch day + 1 week follow-up)
- In-app announcement + email + changelog
- No sales enablement needed (maybe a Slack message to the team)

Justify the tier selection in 2-3 sentences.

### Step 3 -- Write Launch Positioning

Write the launch-specific positioning. This is not your company positioning. It's the story for this specific launch.

**Launch headline** (max 10 words): The single most important thing to communicate

**Launch narrative** (3-5 sentences): What problem this solves, for whom, and why it matters now

**Key messages** (3 bullets, max 20 words each):
1. The "what changed" message -- what's new
2. The "why it matters" message -- what impact it has
3. The "what to do" message -- the action to take

### Step 4 -- Define Target Segments and Personas

For this specific launch, identify:

**Primary audience** (must reach, launch success depends on them):
- Segment + persona
- Why this launch matters to them specifically
- Expected action after hearing about it

**Secondary audience** (good to reach, amplifies impact):
- Segment + persona
- Why they should care
- Expected action

**Internal audience** (must be informed before external launch):
- Sales team: what they need to know and say
- Customer success: how to handle questions
- Support: what tickets to expect

### Step 5 -- Build Channel Activation Timeline

Create a phased timeline with specific activities per channel:

**Pre-Launch (1-2 weeks before):**
- Internal enablement (sales, CS, support briefing)
- Teaser content (if Tier 1)
- Influencer/analyst seeding (if Tier 1)
- Email list segmentation and prep
- Landing page or feature page live
- Sales collateral ready

**Launch Day:**
- Email announcement to segmented lists
- Social media posts (platform-specific)
- Blog post or changelog update
- In-app notification or banner
- Sales team outreach to target accounts
- Press release (Tier 1 only)

**Post-Launch Week 1:**
- Follow-up email to non-openers
- Social proof collection (early user reactions)
- Sales outreach to warm prospects
- Content: how-to guide or walkthrough
- Webinar or demo session (Tier 1-2)

**Post-Launch Weeks 2-4 (Tier 1-2 only):**
- Case study from early adopter
- Retargeting campaigns
- Follow-up content (deep-dive, comparison)
- Sales enablement refinement based on early conversations
- Performance review and optimization

For each activity, specify:
- Owner (role, not name)
- Channel
- Asset needed
- Status (to create / exists / needs update)

### Step 6 -- Define Content Needs

List every content asset needed for the launch:

| Asset | Channel | Persona | Status | Owner | Due Date |
|-------|---------|---------|--------|-------|----------|
| Blog post | Website | All | To create | Content | [Date] |
| Email sequence (3 emails) | Email | [Persona] | To create | Marketing | [Date] |
| LinkedIn posts (3) | LinkedIn | [Persona] | To create | Content | [Date] |
| Sales one-pager | Sales | [Persona] | To create | Sales Enablement | [Date] |
| Demo script update | Sales | [Persona] | To update | Sales | [Date] |
| Landing page | Website | All | To create | Marketing | [Date] |
| In-app notification | Product | Users | To create | Product | [Date] |

Hard cap: 15 assets maximum for Tier 1, 8 for Tier 2, 3 for Tier 3. More than that and nothing gets done well.

### Step 7 -- Plan Sales Enablement

Define what the sales team needs:

**Knowledge** (what to know):
- What launched and why
- Which personas to target with this news
- Key objections and responses
- What competitors will say

**Assets** (what to use):
- Updated pitch deck slide(s)
- One-pager or leave-behind
- Email templates for outreach
- Demo script updates

**Actions** (what to do):
- Target account list for launch outreach
- Talk track for bringing it up in existing conversations
- Follow-up sequence for interested prospects

**Enablement delivery:**
- When: [Date, before external launch]
- Format: [Slack message, team meeting, recorded video]
- Duration: [5 min read, 15 min session, 30 min training]

### Step 8 -- Set Success Metrics

Define 3-5 metrics with specific targets:

| Metric | Target | Measurement Method | Review Date |
|--------|--------|-------------------|-------------|
| [Metric 1: e.g., Feature adoption rate] | [Target: e.g., 25% of active users in 30 days] | [How measured] | [Date] |
| [Metric 2: e.g., Launch email open rate] | [Target: e.g., >35%] | [How measured] | [Date] |
| [Metric 3: e.g., Pipeline influenced] | [Target: e.g., $X in new pipeline attributed to launch] | [How measured] | [Date] |
| [Metric 4: e.g., Sales conversations mentioning feature] | [Target] | [How measured] | [Date] |

Define what "launch success" looks like in one sentence. Define what would trigger a post-launch pivot (e.g., if adoption is below X% after 2 weeks, we do Y).

### Step 9 -- Quality Gate

Run these checks before saving:

- [ ] Launch tier is justified and appropriate for what's launching
- [ ] Launch positioning is specific to this launch, not recycled company positioning
- [ ] Channel activation timeline has specific activities with owners, not just channel names
- [ ] Content needs list includes all assets with status and due dates
- [ ] Sales enablement plan covers knowledge, assets, and actions
- [ ] Success metrics have specific targets (not "increase awareness")
- [ ] The entire plan fits in one document
- [ ] Timeline is realistic given available resources
- [ ] Internal enablement happens before external launch

If any check fails, fix it before proceeding.

## Output Format

Save to `docs/launches/{launch-slug}.md`:

```markdown
# Launch Plan: [Launch Name]
Launch Tier: [1 / 2 / 3]
Launch Date: [Date]
Date Created: [Date]

## Launch Summary
**What:** [One sentence on what's launching]
**Who:** [Primary audience]
**Why now:** [One sentence on timing]
**Headline:** [Max 10 words]

## Launch Positioning
### Key Messages
1. [What changed]
2. [Why it matters]
3. [What to do]

### Launch Narrative
[3-5 sentences]

## Target Audiences
### Primary
[Segment + persona + expected action]

### Secondary
[Segment + persona + expected action]

### Internal
[Teams + what they need]

## Channel Activation Timeline

### Pre-Launch: [Date range]
| Activity | Channel | Owner | Asset Needed | Status |
|----------|---------|-------|-------------|--------|
| ... | ... | ... | ... | ... |

### Launch Day: [Date]
| Activity | Channel | Owner | Asset Needed | Status |
|----------|---------|-------|-------------|--------|
| ... | ... | ... | ... | ... |

### Post-Launch Week 1: [Date range]
| Activity | Channel | Owner | Asset Needed | Status |
|----------|---------|-------|-------------|--------|
| ... | ... | ... | ... | ... |

### Post-Launch Weeks 2-4: [Date range]
[If Tier 1-2]

## Content Needs
| Asset | Channel | Persona | Status | Owner | Due |
|-------|---------|---------|--------|-------|----|
| ... | ... | ... | ... | ... | ... |

## Sales Enablement
### What to Know
[Key points]

### Assets
[List with status]

### Actions
[Specific outreach plan]

### Delivery
[When, format, duration]

## Success Metrics
| Metric | Target | Method | Review Date |
|--------|--------|--------|-------------|
| ... | ... | ... | ... |

**Launch success =** [One sentence definition]
**Pivot trigger =** [What would cause a change in approach]

## Risks and Mitigations
| Risk | Likelihood | Impact | Mitigation |
|------|-----------|--------|------------|
| ... | ... | ... | ... |
```

## Key Principles

1. **A launch is a sequence, not an event.** Launch day is the peak, but the pre-launch and post-launch phases do most of the work.
2. **Internal before external.** Sales and CS must know about the launch before customers do. Nothing undermines credibility faster than a customer asking about something the rep hasn't heard of.
3. **Match effort to impact.** A minor feature doesn't need a 6-week campaign. A major product doesn't deserve a single blog post. Tier appropriately.
4. **Fewer assets, done well.** A great blog post and a targeted email sequence outperform ten mediocre pieces of content.
5. **Define success before you launch.** If you don't set targets before launch, you can't tell afterward whether it worked.
6. **One document, one plan.** If the launch plan requires multiple documents to understand, it's too complex.

## Anti-Patterns

- **The announcement-only launch:** Sending one email and a blog post, then wondering why nobody noticed. A launch is sustained effort over weeks.
- **The everything-everywhere launch:** Activating every channel for a Tier 3 update. Overwhelming the audience with minor news makes major launches less impactful.
- **No sales enablement:** Launching externally without briefing sales. The fastest way to waste a launch is having a prospect ask about it and the rep saying "I haven't heard about that."

## What to Do Next

- Build a **content calendar** to plan the launch content production: `/skill content-calendar`
- Write **ad copy** for paid channels in the launch: `/skill ad-copy-writer`
- Create **outbound sequences** to target key accounts during launch: `/skill write-outbound-sequence`

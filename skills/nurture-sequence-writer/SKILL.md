---
description: Write a long-term nurture sequence with 8-12 touches over 3-6 months. Use when someone says "nurture sequence", "drip campaign", "long-term nurture", "stay in touch sequence", "nurture emails", "warm nurture", or "re-engagement campaign"
tools: Read, Write
---

# Nurture Sequence Writer

Write a long-term nurture sequence with 8-12 touches over 3-6 months. Each touch delivers standalone value with minimal ask. The CTAs progress gradually from content engagement to meeting. This is not a slow sales pitch. Every email must be worth reading even if the recipient never buys.

## Inputs

- **Persona** (required) -- who you're nurturing (title, KPIs, interests)
- **Content assets** (required) -- articles, benchmarks, tools, guides, or resources you can share
- **Entry trigger** (optional) -- what put them in the nurture (outbound no-reply, inbound download, event)
- **Re-engagement criteria** (optional) -- signals that should escalate them back to active outreach

If persona or content assets are missing, ask: "I need the target persona and a list of content assets I can share in the sequence. Who are we nurturing and what resources do we have?"

## Steps

### Step 0 -- Check for Existing Output

Read `docs/sequences/nurture-{persona-slug}.md` if it exists. If found, present a summary and ask: "A nurture sequence for this persona already exists with [N] touches. Do you want me to (a) add more touches, (b) update content references, or (c) rebuild from scratch?"

### Step 1 -- Load Context

Read all available context:

1. `docs/personas/{persona-slug}.md` -- persona interests and content preferences
2. `docs/messaging-matrix.md` -- messaging angles for value-adds
3. `docs/sequences/follow-up-{persona-slug}.md` -- the outbound sequence they didn't respond to (to avoid repeating angles)
4. `CLAUDE.md` -- project-level instructions

Identify content topics this persona would find genuinely useful, independent of buying intent.

### Step 2 -- Design the Touch Cadence

Map 8-12 touches over 3-6 months:

| Touch | Week | Type | CTA Level | Purpose |
|-------|------|------|-----------|---------|
| 1 | 1 | Article/Insight | Engage content | Establish value |
| 2 | 3 | Benchmark/Data | Engage content | Build credibility |
| 3 | 5 | Framework/Tool | Engage content | Demonstrate expertise |
| 4 | 7 | Article/Insight | Reply to question | Start conversation |
| 5 | 10 | Case Study | Reply to question | Show results |
| 6 | 13 | Invite (webinar/event) | Register | Create interaction |
| 7 | 16 | Benchmark/Data | Reply to question | Re-engage |
| 8 | 20 | Insight/Trend | Soft meeting CTA | Transition |
| 9 | 24 | Case Study | Meeting CTA | Convert |

Adjust timing based on:
- Monthly cadence is the default (no more than 2 touches per month)
- Shorter intervals early (when brand memory is fresh), longer later
- Never send two touches in the same week

### Step 3 -- Write Each Touch

For each touch, write:

**Subject line:** 2-6 words, lowercase, content-focused (not salesy)

**Body:** Under 100 words per touch. Each email must:
- Lead with the value (the resource, insight, or data point)
- Include 1-2 sentences of context for why it's relevant
- End with the appropriate CTA for that touch's level
- Stand alone. If they skipped the last 3 emails, this one still makes sense.

**Progressive CTA levels:**
- Touches 1-3: "Thought this might be useful." (no ask)
- Touches 4-5: "What's your take on this?" (invite reply)
- Touch 6: "We're hosting X. Worth joining?" (invite to event)
- Touches 7-8: "Happy to share how we're seeing this play out." (soft meeting)
- Touch 9+: "Would a 15-minute conversation be useful?" (direct meeting)

### Step 4 -- Define Re-Engagement Triggers

Set rules for when to escalate from nurture back to active outreach:

- **Trigger 1:** Opens 3+ consecutive emails. Signal: active interest. Action: move to active sequence.
- **Trigger 2:** Clicks a link in any email. Signal: topic interest. Action: send related content + soft CTA.
- **Trigger 3:** Replies to any email. Signal: engaged. Action: respond personally, move to active sequence.
- **Trigger 4:** Visits website or pricing page (if trackable). Signal: evaluating. Action: immediate personal outreach.
- **Trigger 5:** Company shows a buying signal (funding, hiring, etc.). Signal: timing alignment. Action: restart outbound with fresh angle.

### Step 5 -- Quality Gate

Run these checks before saving:

- [ ] Sequence has 8-12 touches spanning 3-6 months
- [ ] No two touches in the same week
- [ ] Each touch is under 100 words
- [ ] Each touch delivers genuine value independent of buying intent
- [ ] CTAs progress gradually (content > reply > event > meeting)
- [ ] Each touch stands alone (no "as I mentioned last month")
- [ ] Re-engagement triggers are defined with specific actions
- [ ] Subject lines are 2-6 words and content-focused
- [ ] No em dashes in any copy
- [ ] No touch is a thinly disguised sales pitch

If any check fails, fix it before proceeding.

## Output Format

Save to `docs/sequences/nurture-{persona-slug}.md`:

```markdown
# Nurture Sequence: {Persona Title}
Date: {Date}
Duration: {X} months
Touches: {N}
Entry trigger: {what put them in nurture}

## Cadence Overview
| Touch | Week | Type | CTA Level |
|-------|------|------|-----------|
[Full cadence table from Step 2]

## Touches

### Touch 1 -- Week 1
**Subject:** {subject line}
**Body:**
{Full email text}
**CTA level:** Engage content
Word count: {count}/100

### Touch 2 -- Week 3
**Subject:** {subject line}
**Body:**
{Full email text}
**CTA level:** Engage content
Word count: {count}/100

[Continue for all touches]

## Re-Engagement Triggers
| Trigger | Signal | Action |
|---------|--------|--------|
| 3+ consecutive opens | Active interest | Move to active sequence |
| Link click | Topic interest | Send related content + soft CTA |
| Reply | Engaged | Respond personally |
| Website/pricing visit | Evaluating | Immediate outreach |
| Company buying signal | Timing alignment | Restart outbound |

## Content Assets Used
| Touch | Asset | Type | Link |
|-------|-------|------|------|
[Map each touch to its content asset]

## Exit Criteria
- **Graduate to active:** When re-engagement trigger fires
- **Remove from nurture:** After full sequence completes with zero engagement
- **Restart nurture:** After 6 months with a fresh content set
```

## Key Principles

1. **Nurture is not a slow sales pitch.** Every email must be worth reading even if they never buy. If you wouldn't send it to someone who can't buy, it's not nurture, it's spam with better spacing.
2. **Progressive CTAs earn the right to ask.** You start by giving, then asking for a thought, then asking for time. Jumping to the meeting CTA in Touch 2 breaks the contract.
3. **Standalone emails respect the reader.** They may have ignored the last 3 emails. This one should still make sense and deliver value.
4. **Re-engagement triggers are the payoff.** The nurture builds a signal engine. When someone engages, you know it's time. Without triggers, you're just sending emails into the void.
5. **Content quality is the bottleneck.** A nurture sequence is only as good as the content it shares. If you don't have 8-12 pieces of genuinely useful content, build the content first.

## Anti-Patterns

- **Disguised sales pitches.** "Here's an article about why companies need our product" is not nurture. It's a pitch wearing content's clothing.
- **No re-engagement triggers.** Sending 12 emails over 6 months with no mechanism to escalate engaged prospects is a waste of pipeline.
- **Same CTA every time.** "Let's get 15 minutes on the calendar" in Touch 1, 3, 5, and 7 teaches them to ignore you.

## What to Do Next

- Write **inbound follow-up** for leads who enter from content downloads: `/skill inbound-follow-up-sequence`
- Design **A/B test** to optimize open and engagement rates: `/skill ab-test-designer`
- Create **content assets** to fuel the nurture: see content strategy workflows

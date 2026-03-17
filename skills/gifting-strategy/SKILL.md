---
description: Design a direct mail and gifting strategy for top accounts by tier. Use when someone says "gifting strategy", "direct mail", "send gifts", "gift campaign", "ABM gifting", "account gifts", or "corporate gifting"
tools: Read, Write
---

# Gifting Strategy

Design a tiered direct mail and gifting program that turns physical touchpoints into pipeline acceleration. This skill defines what to send, when, to whom, how to personalize it, and how to follow up.

Gifting works because it breaks through digital noise. But poorly executed gifting (branded swag to someone you've never spoken to) wastes money and damages your brand. This framework ties every gift to a campaign milestone and a follow-up sequence.

## Inputs

- **Target accounts by tier** (required) -- which accounts get gifts and at what tier
- **Budget** (required) -- total gifting budget or per-account budget
- **Campaign context** (optional) -- what ABM campaign this supports
- **Existing vendor/platform** (optional) -- Sendoso, Postal, Reachdesk, or manual
- **Brand guidelines** (optional) -- any restrictions on gift types or branding

If target accounts are missing, ask: "Which accounts should receive gifts? I need the list segmented by tier, or your account tiering model."

## Steps

### Step 0 -- Check for Existing Output

Read `docs/sales/gifting-strategy.md` if it exists. If found, present a summary and ask: "A gifting strategy already exists. Do you want me to (a) update gift selections, (b) adjust the timeline, or (c) rebuild from scratch?"

### Step 1 -- Load Context

Read all available context:

1. `docs/account-tiering-model.md` -- tier definitions
2. `docs/sales/abm-campaign-*.md` -- active campaigns
3. `docs/sales/account-plays/*.md` -- individual account plays
4. `docs/personas/*.md` -- persona preferences
5. `CLAUDE.md` -- project-level instructions

### Step 2 -- Segment Accounts by Gift Tier

Define gift treatment per account tier:

- **Tier 1 (Personalized):** Custom, high-value gifts tied to research on the individual. $50-150 per gift. Examples: books relevant to their stated interests, custom items referencing a conversation, premium food/drink with a handwritten note.
- **Tier 2 (Semi-personalized):** Quality gifts with persona-level personalization. $25-75 per gift. Examples: curated gift boxes by persona type, premium branded items, donation in their name.
- **Tier 3 (No gifting):** Do not send gifts. Budget doesn't justify it at this tier. Use digital-only touchpoints.

### Step 3 -- Define Timing Triggers

Tie every gift to a campaign milestone, not an arbitrary date:

- **Post-first-meeting:** Thank-you gift to reinforce positive first impression
- **Proposal stage:** Gift that creates urgency or memorability during evaluation
- **Stalled deal:** Re-engagement gift to restart a conversation that went cold
- **Post-close:** Welcome gift to start the relationship strong
- **Champion departure:** Farewell gift that maintains the relationship as they move to a new company

For each trigger, define: what to send, personalization level, and follow-up timing.

### Step 4 -- Write Personalization Notes

For each gift tier, create note templates:

**Tier 1 notes** must reference something specific to the recipient:
- A topic from a recent conversation
- Their company's recent achievement
- A shared interest or connection

**Tier 2 notes** should reference the persona's role:
- A challenge common to their title
- A relevant insight or resource
- Congratulations on a company milestone

Every note must be under 50 words. Handwritten preferred for Tier 1.

### Step 5 -- Design Follow-Up Sequences

For each gift type, define the follow-up:

- **Day of delivery:** Confirmation message (email or LinkedIn): "Just sent something your way. Hope it arrives safely."
- **Day 2-3 post-delivery:** Check-in: "Did the {gift} arrive? I chose it because {personalization reason}."
- **Day 5-7:** Pivot to value: "While I have your attention, I wanted to share {relevant insight}."

The follow-up is where the ROI lives. A gift without follow-up is just an expense.

### Step 6 -- Quality Gate

- [ ] Tier 3 accounts receive no gifts (budget discipline)
- [ ] Every gift is tied to a campaign milestone, not sent randomly
- [ ] Tier 1 gifts have individual personalization, not just persona-level
- [ ] Personalization notes are under 50 words each
- [ ] Follow-up sequences exist for every gift type (3 touches minimum)
- [ ] Budget per account stays within tier guidelines
- [ ] No branded swag as a first touch (earn the right to brand first)

If any check fails, fix it before proceeding.

## Output Format

Save to `docs/sales/gifting-strategy.md`:

```markdown
# Gifting Strategy
Date: {Date}
Total Budget: ${Amount}
Accounts Covered: {N} Tier 1, {N} Tier 2

## Gift Tiers

### Tier 1 -- Personalized ($50-150/gift)
**Accounts:** {List}
**Gift options:**
1. {Gift type} -- {When to send} -- {Personalization approach}
2. {Gift type} -- {When to send} -- {Personalization approach}

### Tier 2 -- Semi-Personalized ($25-75/gift)
**Accounts:** {List or criteria}
**Gift options:**
1. {Gift type} -- {When to send} -- {Personalization approach}
2. {Gift type} -- {When to send} -- {Personalization approach}

### Tier 3 -- No Gifting
Digital-only engagement.

## Timing Triggers
| Trigger | Tier 1 Gift | Tier 2 Gift | Follow-Up |
|---------|------------|------------|-----------|

## Note Templates

### Tier 1 (Personalized)
"{Template with {variables} for personalization}"

### Tier 2 (Semi-Personalized)
"{Template with {variables} for personalization}"

## Follow-Up Sequence
| Day | Channel | Message |
|-----|---------|---------|
| 0 | {Channel} | {Delivery confirmation} |
| 2-3 | {Channel} | {Check-in} |
| 5-7 | {Channel} | {Value pivot} |

## Budget Summary
| Tier | Accounts | Gifts/Account | Cost/Gift | Total |
|------|----------|--------------|-----------|-------|
```

## Key Principles

1. **Gifts are campaign tools, not random acts of generosity.** Every gift should have a strategic purpose tied to a specific moment in the buyer's journey.
2. **Personalization beats price.** A $30 book that references a conversation beats a $100 generic gift box every time.
3. **The follow-up is the ROI.** A gift without follow-up is charity. The follow-up sequence converts attention into pipeline.
4. **Never gift Tier 3.** If you can't justify personalization, you can't justify the spend. Digital channels are more efficient at scale.
5. **Handwritten notes outperform printed ones.** The effort is visible and appreciated. Budget time for writing, not just spending.

## Anti-Patterns

- **Branded swag as first touch:** Sending a company-branded mug to someone who's never heard of you. It goes in the trash. Earn the right to brand.
- **Gift without follow-up:** Spending $100 on a gift and never following up. You just donated to their household.
- **Same gift for everyone:** Sending identical gift boxes to Tier 1 and Tier 2 accounts. The whole point of tiering is differentiation.

## What to Do Next

- Design the **ABM campaign** this gifting supports: `/skill abm-campaign-planner`
- Write **personalized messages** for each account: `/skill account-play-designer`
- Plan an **executive dinner** for top accounts: `/skill dinner-event-planner`

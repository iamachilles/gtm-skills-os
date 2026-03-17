---
description: "Design a micro-campaign around a trigger event with messaging, channels, and timing. Trigger: 'design trigger campaign', 'campaign around event', 'micro-campaign for', 'trigger-based outreach campaign'"
tools: Read, Write
---

# Trigger Campaign Designer

Design a complete micro-campaign built around a specific trigger event. Micro-campaigns are short (2-4 weeks), focused on one trigger, and perishable by design. They have a defined start condition, a messaging angle tied to the trigger, and an expiration date after which the trigger loses relevance.

This is campaign architecture, not content creation. The output is a campaign spec that can be handed to a sales team or loaded into a sequencing tool.

## Inputs

- **Trigger event type** (required) — the event that qualifies a company for this campaign (funding round, executive hire, product launch, expansion, acquisition, conference attendance, regulatory change, competitor loss)
- **ICP criteria** (required) — who qualifies beyond just having the trigger
- **Value proposition** (optional) — how your solution connects to the trigger; if not provided, check docs/gtm-triangle.md
- **Available channels** (optional) — email, LinkedIn, phone, ads. Default: email + LinkedIn
- **Campaign duration** (optional) — default: 3 weeks. Max: 4 weeks.

If trigger type is missing, ask: "What trigger event should this campaign be built around? (e.g., funding round, new VP hire, product launch, expansion)"

## Steps

### Step 0 — Idempotency Check

Check if `docs/sequences/{trigger-slug}-campaign.md` already exists. If it does, ask: "A campaign for this trigger already exists. Should I update it or create a new version?"

### Step 1 — Load Context

Read available context:
- `docs/gtm-triangle.md` — value proposition and positioning
- `docs/icp.md` — ICP criteria for qualification
- `CLAUDE.md` — project instructions

### Step 2 — Define the Trigger Precisely

Specify the trigger with enough precision that a list can be built from it:

- **Trigger event:** {exact event} (e.g., "Raised Series B round of $10M+ in the last 30 days")
- **Trigger source:** Where to find this signal (e.g., Crunchbase, TechCrunch, LinkedIn job postings)
- **Trigger freshness window:** How recent the trigger must be to qualify (e.g., "within 30 days")
- **Trigger disqualifiers:** When the trigger doesn't count (e.g., "Bridge rounds under $5M excluded")

### Step 3 — Define List Criteria

Beyond the trigger, who qualifies?

- Industry/vertical match
- Company size range
- Geography
- Existing customer exclusions
- Any additional qualifying criteria

**Qualification formula:** Trigger + ICP fit = qualified for this campaign. The trigger alone is not enough.

### Step 4 — Build the Messaging Angle

Connect the trigger to your value proposition using this structure:

1. **The trigger** — what happened (the event)
2. **The implication** — what this means for them (the consequence)
3. **The gap** — what they probably don't have yet (the problem)
4. **Your bridge** — how you solve that specific gap (the solution)

**Example:**
- Trigger: Raised Series B
- Implication: Board expects 3x growth in 18 months
- Gap: Current outbound infrastructure won't scale to that target
- Bridge: We build the outbound engine that Series B companies need to hit their growth targets

Write the angle as a 2-3 sentence narrative that can be used as the campaign's core message.

### Step 5 — Write Message Variants

Write 3-5 message variants for the primary channel:

- **Variant 1:** Direct approach (lead with the trigger, state the implication, offer the bridge)
- **Variant 2:** Question approach (ask about the implication, position the bridge as the answer)
- **Variant 3:** Proof approach (lead with a similar company that had the same trigger and what happened)
- **Variant 4 (optional):** Contrarian approach (challenge the conventional response to the trigger)
- **Variant 5 (optional):** Peer approach (reference what others in their position are doing post-trigger)

Each variant: 50-100 words, one CTA, no em dashes.

### Step 6 — Define Channel and Timing

**Channel strategy:**
- Primary channel and why
- Supporting channel(s) and their role
- Touch count per channel
- Total touches across the campaign

**Timing:**
- Day-by-day cadence (which channel, which variant, what purpose)
- Response window (how quickly to follow up on replies)
- Escalation points (when to add phone or a different channel)

**Campaign lifecycle:**
- Start condition: trigger detected + ICP qualified
- Duration: {X} weeks from trigger detection
- Expiration: {date or condition when campaign stops being relevant}
- Exit conditions: reply received, meeting booked, or campaign duration elapsed

### Step 7 — Quality Gate

Before saving, verify:
- [ ] Trigger is precisely defined with freshness window
- [ ] List criteria combine trigger + ICP fit (not trigger alone)
- [ ] Messaging angle connects trigger to value proposition in 4 steps
- [ ] At least 3 message variants are written
- [ ] No variant exceeds 100 words
- [ ] Campaign duration is 4 weeks or less
- [ ] Expiration date or condition is defined
- [ ] No em dashes in any message copy

If any check fails, fix before proceeding.

## Output Format

Save to `docs/sequences/{trigger-slug}-campaign.md`:

```
# Micro-Campaign: {Trigger Name}
Date: {date}
Trigger: {precise trigger definition}
Duration: {X weeks}
Expiration: {date or condition}
Status: Active / Draft

## Trigger Definition
- **Event:** {what happened}
- **Source:** {where to find this signal}
- **Freshness:** {how recent it must be}
- **Disqualifiers:** {when the trigger doesn't count}

## Qualification Criteria
- Trigger: {trigger event} + ICP fit
- Industry: {allowed industries}
- Size: {range}
- Geography: {regions}
- Exclusions: {who to skip}

## Messaging Angle
{2-3 sentence narrative connecting trigger to value}

### The Logic
1. **Trigger:** {what happened}
2. **Implication:** {what this means for them}
3. **Gap:** {what they probably lack}
4. **Bridge:** {how you solve it}

## Message Variants

### Variant 1: Direct
{full message text}

### Variant 2: Question
{full message text}

### Variant 3: Proof
{full message text}

## Cadence

| Day | Channel | Action | Variant | Purpose |
|-----|---------|--------|---------|---------|
| 1 | {channel} | {action} | {variant} | {purpose} |

## Exit Conditions
- **Positive reply:** {next steps}
- **Objection:** {handling approach}
- **No response:** {nurture plan}
- **Campaign expired:** {what to do}

## Metrics to Track
- {key metrics for this campaign type}
```

## Key Principles

1. **Micro-campaigns are perishable.** If the trigger was 30+ days ago, the campaign is stale. Every campaign has an expiration date.
2. **Trigger plus ICP, not trigger alone.** A company that raised funding but is in the wrong industry is not a prospect. Both conditions must be met.
3. **Four-step angle.** Trigger leads to implication, implication reveals gap, gap is bridged by your solution. Skip any step and the message falls apart.
4. **Short and sharp.** These campaigns run 2-4 weeks maximum. If it needs longer, it's not a micro-campaign.
5. **Multiple variants, one angle.** The messaging angle stays consistent. The variants are different ways to express the same angle.

## Anti-Patterns

- **The Congratulations Campaign:** Building an entire campaign around "Congrats on [trigger]!" without connecting to a business implication. Congratulations is a subject line, not a strategy.
- **The Evergreen Trigger:** Treating a time-sensitive trigger as a permanent campaign. If there's no expiration date, it's not a trigger campaign.
- **The Kitchen Sink:** Cramming 3 different value propositions into a 3-week campaign. One trigger, one angle, one campaign.

## Next Skills

- Campaign designed? Run **signal-list-generator** to build the qualified list for this campaign.
- Need the actual sequence written? Run **write-outbound-sequence** using this campaign spec as input.
- Ready to find contacts? Run **contact-finder** for the companies on the trigger list.

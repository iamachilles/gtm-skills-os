---
description: "Identify and re-engage dormant CRM leads worth reactivating. Trigger: 'reactivate old leads', 'dormant leads', 're-engage cold leads', 'revive dead pipeline', 'CRM reactivation'"
tools: Read, Write
---

# Warm Lead Reactivator

Segment dormant CRM leads, score them for reactivation potential, and build a re-engagement plan. Not every dead lead is worth reviving. This skill identifies the top 20% worth contacting and writes a 3-touch re-engagement sequence that references the original context plus a new reason to reconnect.

## Inputs

- **CRM lead list** (required) — pasted list, CSV, or description of dormant leads (names, companies, original source, last engagement date, original interest)
- **Original context** (optional) — what were these leads interested in? What stage did they reach?
- **New reason to reconnect** (optional) — product update, new case study, market change, or trigger event
- **ICP criteria** (optional) — for re-scoring; if not provided, check docs/icp.md

If lead list is missing, ask: "Please provide the list of dormant leads to evaluate. Include: company name, contact name, original source, and last engagement date (even approximate)."

## Steps

### Step 0 — Idempotency Check

Check if `docs/sequences/reactivation-plan.md` already exists. If it does, ask: "A reactivation plan already exists. Should I replace it or create a new version?"

### Step 1 — Load Context

Read available context:
- `docs/icp.md` — current ICP criteria (may have changed since leads went dormant)
- `docs/gtm-triangle.md` — current value proposition
- `CLAUDE.md` — project instructions

### Step 2 — Segment Dormant Leads

Group leads by:

**By original source:**
- Inbound (content download, demo request, webinar)
- Outbound (cold outreach that got a response)
- Referral
- Event
- Partnership

**By stage reached:**
- Awareness only (opened emails, visited website)
- Engaged (replied, attended demo, had a call)
- Opportunity (had proposal, went to evaluation)
- Lost deal (chose competitor, went with status quo, budget cut)

**By dormancy period:**
- 30-90 days dormant (warm dormant)
- 91-180 days dormant (cool dormant)
- 181-365 days dormant (cold dormant)
- 365+ days dormant (frozen, likely not worth reactivating)

### Step 3 — Score for Reactivation Potential

Score each lead on a 1-5 scale using these factors:

| Factor | Weight | What to look for |
|--------|--------|-----------------|
| Recency of last engagement | High | More recent = higher score |
| Original intent strength | High | Demo request > content download |
| Current ICP fit | High | May have changed since they went dormant |
| Stage reached | Medium | Deeper engagement = easier to restart |
| New signals detected | Medium | Job change, company growth, new funding |
| Reason for going dormant | Medium | "Bad timing" > "Not interested" |

**Scoring guide:**
- 5: Engaged deeply, went dormant for timing reasons, ICP fit still strong, new signal present
- 4: Engaged meaningfully, ICP fit intact, no new signal but original interest was strong
- 3: Some engagement, ICP fit moderate, worth one attempt
- 2: Minimal engagement or ICP fit has degraded since original contact
- 1: Very old, minimal original engagement, ICP no longer fits

### Step 4 — Prioritize Top 20%

Rank all leads by reactivation score. Select the top 20% for active reactivation. For the remaining 80%, recommend:
- Score 3: Add to nurture sequence (monthly touches)
- Score 1-2: Archive unless a new signal appears

### Step 5 — Write Re-Engagement Sequence

Write a 3-touch re-engagement sequence for the priority tier:

**Touch 1 — The Reconnection (Day 1)**
- Acknowledge the gap ("It's been a while since we connected")
- Reference the original context (what they were interested in, what stage they reached)
- Introduce the new reason to reconnect (what's changed)
- Light CTA (reply, not a meeting)
- 60-80 words max

**Touch 2 — The Value Add (Day 5)**
- Don't repeat touch 1
- Share something genuinely useful (new data, case study, industry insight)
- Connect it to their original interest
- Slightly stronger CTA
- 50-70 words max

**Touch 3 — The Close or Archive (Day 10)**
- Acknowledge this is the last attempt
- Offer a clear binary choice (interested in reconnecting, or should I close the loop?)
- No guilt or pressure
- 40-60 words max

Customize the sequence based on segment (an inbound lead that had a demo gets different messaging than a cold outbound that only replied once).

### Step 6 — Quality Gate

Before saving, verify:
- [ ] Leads are segmented by source, stage, and dormancy period
- [ ] Reactivation scores have clear justification
- [ ] Top 20% is identified and separated from the rest
- [ ] Re-engagement sequence has exactly 3 touches
- [ ] Each touch references original context (not generic "checking in")
- [ ] No touch exceeds 80 words
- [ ] Leads dormant 365+ days are flagged as low-priority
- [ ] No em dashes in any message copy

If any check fails, fix before proceeding.

## Output Format

Save to `docs/sequences/reactivation-plan.md`:

```
# Lead Reactivation Plan
Date: {date}
Total dormant leads evaluated: {count}
Priority leads (top 20%): {count}
Nurture tier: {count}
Archive tier: {count}

## Segmentation Summary

### By Source
| Source | Count | Avg Score |
|--------|-------|-----------|
| Inbound | {n} | {X.X} |
| Outbound | {n} | {X.X} |

### By Dormancy Period
| Period | Count | Avg Score |
|--------|-------|-----------|
| 30-90 days | {n} | {X.X} |
| 91-180 days | {n} | {X.X} |
| 181-365 days | {n} | {X.X} |
| 365+ days | {n} | {X.X} |

## Priority Leads (Top 20%)

| # | Contact | Company | Original Source | Last Engaged | Stage Reached | Score | Reactivation Reason |
|---|---------|---------|----------------|-------------|---------------|-------|-------------------|
| 1 | {name} | {company} | {source} | {date} | {stage} | {X}/5 | {why now} |

## Re-Engagement Sequence

### Touch 1 — Reconnection (Day 1)
**Subject:** {subject}
**Body:**
{message text}

### Touch 2 — Value Add (Day 5)
**Subject:** {subject}
**Body:**
{message text}

### Touch 3 — Close or Archive (Day 10)
**Subject:** {subject}
**Body:**
{message text}

## Nurture Tier Recommendation
- {How to handle score-3 leads}
- {Recommended nurture cadence}

## Archive Tier
- {Which leads to archive and why}
```

## Key Principles

1. **Reference the original context.** "Just checking in" is the fastest way to get ignored. Every touch must reference what they were originally interested in and what's changed.
2. **New reason required.** Reactivation without a new reason to reconnect is just pestering. Identify the "what's different now" before writing.
3. **Respect the dormancy.** Leads that explicitly said "not interested" or chose a competitor are different from leads that went quiet. Segment accordingly.
4. **Three touches, then stop.** If 3 well-crafted re-engagement attempts don't get a response, move to nurture or archive. Don't keep pounding.
5. **ICP may have shifted.** A lead that was a great fit 12 months ago may no longer qualify. Re-score against current ICP criteria before reactivating.

## Anti-Patterns

- **The Check-In Artist:** Writing "Just checking in!" or "Circling back!" with no new value or reason. If there's nothing new to say, don't say anything.
- **The Mass Resurrector:** Sending the same reactivation email to all 500 dormant leads without segmentation. Different segments need different messages.
- **The Guilt Tripper:** Using language like "I've tried reaching you several times" or "I noticed you haven't responded." Pressure does not generate interest.

## Next Skills

- Priority leads identified? Run **lead-enricher** to update their firmographic data before outreach.
- Reactivation sequence written? Load into your sequencing tool and track reply rates.
- New signals found during scoring? Run **signal-list-generator** to build a fresh list.

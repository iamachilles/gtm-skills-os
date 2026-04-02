---
description: Runs competitive ad intelligence across LinkedIn, Google, and Meta for a set of competitors. Pulls real ad creatives, classifies messaging themes, maps positioning gaps, and outputs an actionable competitive positioning brief. Use when the user wants to analyze competitor ads, run ad intelligence, build a competitive messaging map, or understand what competitors are saying in paid channels.
tools: Read, Write, WebFetch, WebSearch, mcp__adyntel-ads__search_linkedin_ads, mcp__adyntel-ads__search_google_ads, mcp__adyntel-ads__search_facebook_ads
---

# Competitive Ad Intelligence

You are building a competitive ad intelligence report. The output reveals what competitors are actually saying in paid channels, where messaging is crowded, and where positioning gaps exist that the client can exploit.

This is NOT a full competitor analysis (funding, team size, G2 reviews). This skill focuses exclusively on what competitors communicate through paid advertising and what that reveals about positioning opportunities.

## Inputs

- **Company name** (required) — the company you're analyzing the competitive landscape for
- **Company domain** (required) — used for context on the client's own positioning
- **Competitors** (optional) — list of competitor domains. If not provided, you will research and identify 5-8 competitors.
- **Channels** (optional, default: all three) — which ad channels to pull: LinkedIn, Google, Meta
- **Country filter** (optional) — two-letter country code to filter ads by geography (e.g., "FR", "US")
- **Save location** (optional) — custom path. Default: `docs/competitors/ad-intelligence.md`

If required inputs are missing, ask the user before proceeding. Do not guess.

## Execution Steps

### Step 1 — Load Context

Check if the project has existing competitive intelligence:
- Read `docs/competitors/landscape.md` if it exists — extract known competitors
- Read `docs/icp.md` if it exists — extract target personas and positioning context
- Read `docs/gtm-triangle.md` if it exists — extract current messaging and positioning

If upstream files provide competitors, use those. If the user also provided competitors, merge both lists (deduplicate).

---

### Step 2 — Identify Competitors (if not provided)

If no competitors were provided and none found in upstream files:

- WebSearch: "[company name] alternatives", "[company name] vs", "[company name] competitors"
- WebSearch: "best [product category] tools 2026", "[product category] G2 category"
- WebFetch the client's own website homepage — check for comparison pages, "vs" pages, or competitor mentions

Select **5-8 direct competitors**. Prioritize:
1. Companies targeting the same buyer persona
2. Companies actively running ads (you'll confirm in Step 3)
3. Companies the client's prospects are most likely evaluating

For each competitor, record: name, domain, one-line description, and **competitor type**:
- **Direct** — same core product/service, same ICP
- **Adjacent** — overlaps on one dimension (e.g., same channel but different service, or same service but different ICP)

Flag adjacent competitors clearly in the output. They provide messaging context but shouldn't drive positioning decisions the same way direct competitors do.

Present the competitor list to the user before proceeding. Ask: "These are the competitors I'll analyze. Add or remove any?"

---

### Step 3 — Pull Ad Data

For **each competitor**, run all requested channels. Always run all three unless the user restricted channels.

#### 3a. LinkedIn Ads
- Call `mcp__adyntel-ads__search_linkedin_ads` with `company_domain: "{competitor domain}"`
- **Always paginate:** if the response includes a `continuation_token`, call again with that token to get the next page. Continue until `continuation_token` is null or you've fetched 3 pages (whichever comes first).
- Extract from each ad: headline, body copy, CTA, media type, any visible offer (demo, trial, report, webinar)

#### 3b. Google Ads
- Call `mcp__adyntel-ads__search_google_ads` with `company_domain: "{competitor domain}"` and `extract_text: true`
- If country filter was provided, include `country_code`
- **Always paginate:** same rule as LinkedIn — follow `continuation_token` up to 3 pages.
- Extract: headlines, descriptions, display URLs, ad extensions if visible

#### 3c. Meta Ads
- Call `mcp__adyntel-ads__search_facebook_ads` with `company_domain: "{competitor domain}"`
- If country filter was provided, include `country_code`
- Paginate if `continuation_token` is present (up to 3 pages).
- Extract: primary text, headline, description, CTA button type, media type

**If no ads are found for a competitor on a channel:** Record "No active ads found" — this is a signal (not advertising on this channel = either early stage, relying on organic/inbound, or deprioritizing that channel).

#### 3d. Client's own ads
Also pull the client's own ads across all three channels. This establishes the baseline for gap analysis.

---

### Step 4 — Classify Messaging Themes

For each competitor's ad corpus, classify every ad into messaging themes. Use these categories as a starting framework, but add categories if the data demands it:

| Theme | Definition |
|-------|-----------|
| Pain-point agitation | Highlights a problem the buyer faces |
| Feature announcement | Leads with a specific product capability |
| Social proof / authority | Customer logos, case studies, stats, awards |
| Educational / thought leadership | Offers content (guide, report, webinar) without hard sell |
| Direct response / offer | Free trial, demo, discount, limited-time offer |
| Competitive displacement | "Switch from X", "unlike X", comparison claims |
| Category creation | Defines a new way of thinking about the problem |
| Hiring / employer brand | Recruiting ads (signals growth but not a messaging play) |

For each competitor, produce:
- **Theme distribution:** which themes they use most (by ad count)
- **Top 3 actual ad copies:** quote the strongest/most representative ads verbatim
- **Primary CTA pattern:** what action they're driving (demo, trial, content download, contact sales)
- **Offer types:** what they give away (guides, ROI calculators, free tools, webinars)
- **Creative format mix:** text vs image vs video, and any patterns in visual style

---

### Step 5 — Build the Positioning Map

Analyze all competitor messaging collectively.

#### 5a. Market Ad Density Assessment

First, count how many competitors have active ads on at least one channel.

**If fewer than 3 competitors advertise:** This is a **low-density ad market**. The analysis shifts from "avoid crowded angles" to "first-mover advantage." Add this note at the top of the Positioning Gap Analysis:

> **Low-density market detected.** Only {N} of {total} competitors actively advertise. In this environment, the primary opportunity is establishing any paid presence before competitors do. The "crowded territory" section below reflects emerging patterns rather than saturated messaging.

Rename "Crowded Territory" to "Emerging Patterns" and "Saturated Claims" to "Early Patterns" in the output.

**If 3+ competitors advertise:** Proceed with standard crowded/saturated framing.

#### 5b. Messaging Heat Map
Create a matrix: competitors (rows) x messaging themes (columns). Mark frequency: Heavy / Light / None.

#### 5c. Claim Analysis
Extract the **specific claims** each competitor makes:
- Performance claims ("3x faster", "reduce churn by 40%")
- Audience claims ("built for enterprise", "for teams of 1-50")
- Differentiation claims ("the only platform that...", "unlike other tools...")
- Category claims ("the [category] platform", "the future of [X]")

Group identical or near-identical claims. If 3+ competitors make the same claim, flag it as **saturated** (or **emerging pattern** in low-density markets).

#### 5d. Channel Strategy Comparison
| Competitor | Type | LinkedIn (volume) | Google (volume) | Meta (volume) | Primary channel | Ad intensity |
|------------|------|-------------------|-----------------|---------------|-----------------|-------------|

Ad intensity scoring:
- 5: 50+ active ads, multi-channel, high creative variety — aggressive paid growth mode
- 3: 10-30 ads, 1-2 channels — moderate investment
- 1: 0-5 ads, single channel or none — minimal paid presence

---

### Step 6 — Identify Positioning Gaps

This is the most valuable section. Synthesize everything into actionable intelligence.

#### 6a. Crowded Territory / Emerging Patterns (Avoid or Reframe)
List messaging angles that multiple competitors use. In low-density markets, frame these as patterns forming rather than saturated territory.

#### 6b. White Space (Opportunity)
List meaningful angles that NO competitor currently owns in their ads. Cross-reference with:
- What the client actually does well (from ICP/GTM Triangle if available)
- Gaps in competitor G2 reviews (if competitor-analysis was run upstream)
- Themes that buyers care about but no one is advertising around

#### 6c. Underexploited Channels
Identify channels where competitors are absent but the client's buyers are present.

#### 6d. Creative Format Gaps
If all competitors use static text ads, there's an opportunity in video. If all use feature screenshots, there's an opportunity in customer story formats.

#### 6e. Counter-Positioning Opportunities
For each pattern or saturated claim, suggest a counter-position. Produce **3-5 specific positioning recommendations** with supporting evidence from the ad data.

**Important:** When building counter-positions, weight direct competitors more heavily than adjacent ones. An adjacent competitor's messaging is context, not the primary target for counter-positioning.

---

### Step 7 — Quality Gate

Run these checks before saving. Self-correct any failures.

- **Check 1 — Data completeness:** Every competitor has at least one channel pulled with pagination followed. If a competitor returned zero ads on all channels, note it explicitly and explain the signal.
- **Check 2 — Real quotes:** The report contains at least 10 verbatim ad copy quotes across all competitors. If fewer than 10 exist in the raw data (because few competitors advertise), note the actual count and do not pad with fabricated quotes.
- **Check 3 — Actionable gaps:** The positioning gap section contains at least 3 specific, non-obvious recommendations. "Differentiate on quality" is not specific. "Own the 'implementation speed' angle that zero competitors mention despite it being a top-3 buyer concern" is specific.
- **Check 4 — No fabrication:** Every ad quote, volume claim, and channel assessment is based on actual Adyntel data. If a channel returned no data, say "No data" — do not invent examples.
- **Check 5 — Client baseline included:** The client's own ads were pulled and compared against competitors. If the client has no ads, note this as a finding.
- **Check 6 — Competitor type accuracy:** Every competitor is tagged as Direct or Adjacent. Adjacent competitors are flagged in the output and not given equal weight in positioning recommendations.
- **Check 7 — Pagination completed:** For any competitor with a continuation_token, verify that at least one follow-up page was fetched. If you skipped pagination, go back and fetch more data before finalizing.

---

### Step 8 — Save Output

Write the report using the template below to:

**Default path:** `docs/competitors/ad-intelligence.md`

**If the user specified a custom save location:** write there instead. Do NOT also save to the default path.

Create directory if it doesn't exist.

---

### Step 9 — Chain to Next Skill

After saving, present the summary and suggest next steps:

```
--- NEXT OPTIONS ---

Option A — Write ad copy that exploits the gaps found:
/ad-copy-writer
Positioning gaps: {top 3 gaps from this analysis}
Target persona: {from ICP if available}

Option B — Build a full competitor analysis (funding, team, reviews, hiring signals):
/competitor-analysis
Competitors: {competitor list from this analysis}

Option C — Design an outbound sequence using the counter-positioning angles:
/write-outbound-sequence
Messaging angles: {counter-positioning recommendations}
```

---

## Output Template

```markdown
# Competitive Ad Intelligence — {Company Name}

**Date:** {Date}
**Competitors analyzed:** {list with (Direct) or (Adjacent) tags}
**Channels:** LinkedIn, Google, Meta
**Country filter:** {if applied, otherwise "Global"}

---

## Executive Summary

{3-5 sentences: what the competitive ad landscape looks like, the single biggest finding, and the #1 positioning opportunity. If low-density market, lead with that fact.}

---

## Competitor Ad Profiles

### {Competitor 1 Name} ({domain}) — {Direct / Adjacent}

**Ad intensity:** {1-5 score} | **Primary channel:** {channel}

**LinkedIn Ads**
- Volume: {count} active ads
- Themes: {dominant themes}
- Top ad copy:
  > "{verbatim quote}"
  > "{verbatim quote}"
- CTA pattern: {demo / trial / content / contact}
- Offer: {what they give away}

**Google Ads**
- Volume: {count} active ads
- Themes: {dominant themes}
- Top ad copy:
  > "{verbatim headline + description}"
- CTA pattern: {pattern}

**Meta Ads**
- Volume: {count} active ads / No active ads found
- Themes: {if applicable}
- Top ad copy:
  > "{verbatim quote}"

**Key observation:** {one sentence on what this competitor's ad strategy reveals about their positioning}

---

{Repeat for each competitor}

---

### {Client Name} — Current Ad Baseline

{Same structure as above, applied to the client's own ads. If no ads: "No active ads detected across any channel. This is the starting point."}

---

## Messaging Heat Map

| Theme | {Comp1} | {Comp2} | {Comp3} | {Comp4} | {Comp5} | {Client} |
|-------|---------|---------|---------|---------|---------|----------|
| Pain-point agitation | | | | | | |
| Feature announcement | | | | | | |
| Social proof / authority | | | | | | |
| Educational / thought leadership | | | | | | |
| Direct response / offer | | | | | | |
| Competitive displacement | | | | | | |
| Category creation | | | | | | |

*Values: Heavy / Light / None*

---

## Channel Strategy Comparison

| Competitor | Type | LinkedIn | Google | Meta | Primary Channel | Ad Intensity (1-5) |
|------------|------|----------|--------|------|-----------------|---------------------|
| | | | | | | |

---

## Claim Analysis

### Saturated Claims / Early Patterns (3+ competitors or emerging)
{claims that multiple competitors make}

### Unique Claims (only 1 competitor)
{claims that only one competitor makes — either they own it or it's unvalidated}

---

## Positioning Gap Analysis

{If low-density market, add the note here: "Low-density market detected..."}

### Crowded Territory / Emerging Patterns — Avoid or Reframe
1. {angle} — used by {which competitors}. Why it's hard to win: {reason}
2. ...

### White Space — Available to Own
1. {angle} — no competitor addresses this despite {evidence it matters}
2. ...

### Underexploited Channels
{channels where competitors are absent but the client's audience is present}

### Creative Format Gaps
{format opportunities — e.g., video when everyone does text, customer stories when everyone does feature screenshots}

### Counter-Positioning Recommendations

| # | Current Message / Pattern | Counter-Position | Evidence | Based on (Direct/Adjacent) |
|---|---------------------------|------------------|----------|---------------------------|
| 1 | | | | |
| 2 | | | | |
| 3 | | | | |

---

## Recommended Positioning Moves

1. **{Move name}:** {specific recommendation with evidence}
2. **{Move name}:** {specific recommendation with evidence}
3. **{Move name}:** {specific recommendation with evidence}

---

## Raw Data Appendix

{Optional: if the user wants it, include the full raw ad data per competitor per channel. Otherwise omit.}
```

---

## Key Principles

- **Ads reveal budget allocation, not just messaging.** A company running 50 LinkedIn ads is making a strategic bet on that channel. A company with zero ads is either early-stage or betting on organic/inbound. Both are signals.
- **Quote ads verbatim.** Paraphrasing loses the exact language competitors use. The client needs to see the actual words to spot patterns and write counter-messaging.
- **Saturated does not mean wrong.** If every competitor says "AI-powered", it may be table stakes. The insight is whether to match it (because buyers expect it) or counter-position against it (because it's noise).
- **No data is data.** A competitor with no ads on any channel tells you something. Don't skip them — document the absence and interpret it.
- **Low-density markets are different.** When fewer than 3 competitors advertise, the game isn't "find uncrowded angles" — it's "establish presence first." Frame the analysis accordingly.
- **Direct vs. Adjacent matters.** An adjacent competitor's messaging provides context but shouldn't drive positioning decisions with the same weight as a direct competitor. Always tag and distinguish.
- **Always paginate.** A first page of results is a sample, not the full picture. Follow continuation tokens to get the real volume and messaging diversity.
- **Positioning gaps must be credible.** Don't recommend an angle the client can't actually deliver on. Cross-reference with their actual capabilities.
- **Never fabricate ad data.** If Adyntel returns nothing, write "No ads found." Do not invent example ads to fill the template.

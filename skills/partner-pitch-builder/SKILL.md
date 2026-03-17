---
description: Write a pitch to recruit a specific partner. Use when someone says "partner pitch", "recruit a partner", "partnership proposal", "pitch a partner", "partner outreach", or "partnership email"
tools: Read, Write, WebSearch
---

# Partner Pitch Builder

Write a concise pitch to recruit a specific partner. Researches the potential partner, identifies mutual value, and produces a pitch that answers the only question that matters: "What's in it for them?"

Hard cap: pitch under 500 words. Partners are busy. If you can't make the case concisely, the case isn't clear enough.

## Inputs

- **Partner company** (required) -- who you want to partner with
- **Your company context** (required) -- what you sell, who you sell to, your traction
- **Partnership type** (optional) -- referral, reseller, technology, agency. If not specified, recommend based on research.
- **Specific opportunity** (optional) -- a particular project or integration you have in mind

If partner company or your context is missing, ask: "I need to know which company you want to pitch and what your company does. Who are we targeting?"

## Steps

### Step 0 -- Check for Existing Output

Read `docs/sales/partner-pitch-{partner-slug}.md` if it exists. If found, present a summary and ask: "A partner pitch for [partner] already exists. Do you want me to (a) update it, (b) try a different angle, or (c) keep it?"

### Step 1 -- Load Context

Read all available context:

1. `docs/gtm-triangle.md` -- your positioning
2. `docs/ops/partner-program.md` -- partner program details
3. `docs/case-studies/*.md` -- proof points to include
4. `CLAUDE.md` -- project-level instructions

### Step 2 -- Research the Partner

Search for:
- "{partner company} partnerships" -- who they already partner with
- "{partner company} integrations" -- what tech they connect with
- "{partner company} partner program" -- their partner program structure

Extract:
- What they sell and to whom
- Their existing partnerships (complementary or competitive to you)
- Their partner program structure (if they have one)
- Recent news or initiatives relevant to a partnership

### Step 3 -- Identify Mutual Value

Map the value exchange:

**What you bring to them:**
- Audience overlap (your customers who could use their product)
- Product complementarity (how your products work better together)
- Revenue opportunity (leads, referrals, or revenue you can drive to them)
- Credibility or market access they lack

**What they bring to you:**
- Audience access (their customers who could use your product)
- Distribution (their channel, marketplace, or sales team)
- Brand credibility (association with their brand)
- Technical capability (integrations that make your product more valuable)

### Step 4 -- Write the Pitch

Structure the pitch in four sections:

1. **Why partner with us** (benefit to them, not about you): Lead with what they get. Revenue, leads, product enhancement, market expansion.

2. **Market opportunity** (shared TAM): Quantify the overlap. How many of your customers use their product? How many of their customers need yours?

3. **Proposed collaboration** (specific first project): Don't pitch "a partnership." Pitch one concrete project: a co-marketed webinar, an integration, a mutual referral pilot. Make it low-commitment and high-visibility.

4. **Proof points** (why this will work): Customer overlap data, existing results, relevant case studies, mutual customers already using both products.

Rules:
- Lead with their benefit, not yours
- Be specific. "We could drive leads" is weak. "12 of our customers already use your product" is strong.
- Propose one concrete next step, not an open-ended "let's explore"

### Step 5 -- Quality Gate

- [ ] Pitch is under 500 words
- [ ] Opens with benefit to the partner (not about you)
- [ ] Includes at least one specific number or proof point
- [ ] Proposes a concrete first project (not "let's explore")
- [ ] Research findings are incorporated (not generic pitch)
- [ ] No em dashes in any copy

## Output Format

Save to `docs/sales/partner-pitch-{partner-slug}.md`:

```markdown
# Partner Pitch: {Partner Company}

Date: {Date}
Partnership type: {Referral / Reseller / Technology / Agency}
Status: Draft / Sent / In Discussion

## Research Summary
- **What they sell:** {summary}
- **Their audience:** {profile}
- **Existing partnerships:** {notable partners}
- **Opportunity:** {why now}

## Mutual Value
| What we bring | What they bring |
|--------------|----------------|
| {value} | {value} |

## The Pitch

{Under 500 words, structured as: benefit to them, market opportunity, proposed collaboration, proof points}

## Proposed First Project
{Specific, low-commitment, high-visibility project}

## Next Step
{Exact ask: meeting, intro call, email response}
```

## Key Principles

1. **Lead with their benefit.** The partner doesn't care about your roadmap. They care about revenue, customers, and competitive advantage. Start there.
2. **Be specific or be ignored.** "We have synergies" gets deleted. "12 of our customers already use your product and 3 have asked about an integration" gets a meeting.
3. **Propose one thing, not everything.** A partnership that starts with a 500-word proposal for a full program is overwhelming. Propose one project. Prove value. Then expand.
4. **Research is the differentiator.** A generic partnership pitch signals "I sent this to 50 companies." Specific research signals "I thought about why this matters for you."

## Anti-Patterns

- **The "let's explore" pitch.** No specific proposal means no urgency. Always propose a concrete first step.
- **The self-centered pitch.** Three paragraphs about your company before mentioning the partner. Flip the ratio: 70% about them, 30% about you.
- **The kitchen sink.** Pitching referral + reseller + integration + co-marketing in one email. Pick one. Start small.

## What to Do Next

- Design the **partner program** they'll join: `/skill partner-program-designer`
- Plan the **first co-marketing campaign**: `/skill co-marketing-planner`
- Create an **integration brief** for tech partnerships: `/skill integration-partner-brief`

---
description: Design a custom play for ONE strategic account with stakeholder map and orchestrated outreach. Use when someone says "account play", "strategic account", "account plan", "target account strategy", "key account play", or "named account plan"
tools: Read, Write, WebSearch
---

# Account Play Designer

Design a fully orchestrated play for a single strategic account. This includes deep research, a stakeholder map with real names, personalized messaging per contact, an entry strategy, and a sequenced timeline of who gets what and when.

This is Tier 1 ABM execution. One account, full attention, maximum personalization. If you're doing this for more than 15 accounts, you need the ABM campaign planner instead.

## Inputs

- **Company name** (required) -- the target account
- **Why this account** (required) -- strategic rationale for pursuing them
- **Your value proposition** (required) -- what you offer and why it matters to this company specifically
- **Existing relationship context** (optional) -- any prior interactions, mutual connections, or warm paths
- **ICP/persona definitions** (optional) -- buying committee roles you typically engage

If company name is missing, ask: "Which company are we designing this play for, and why are they a priority account?"

## Steps

### Step 0 -- Check for Existing Output

Read `docs/sales/account-plays/{company-slug}.md` if it exists. If found, present a summary and ask: "An account play for {company} already exists. Do you want me to (a) update the stakeholder map, (b) refresh the research, or (c) rebuild from scratch?"

### Step 1 -- Load Context

Read all available context:

1. `docs/icp.md` or `docs/gtm-triangle.md` -- ICP criteria to confirm fit
2. `docs/personas/*.md` -- buying committee roles
3. `docs/messaging-matrix.md` -- messaging by persona
4. `docs/account-tiering-model.md` -- verify this is a Tier 1 account
5. `CLAUDE.md` -- project-level instructions

### Step 2 -- Research the Account

Search for current intelligence on the company:

- Search: `"{company name}" strategy {current_year}`
- Search: `"{company name}" challenges OR priorities`
- Search: `"{company name}" news OR announcement`
- Search: `"{company name}" {industry} market position`

Extract: company size, revenue, growth trajectory, recent news, strategic priorities, technology stack, competitive landscape, and any pain points visible from the outside.

### Step 3 -- Build Stakeholder Map

Identify up to 5 key stakeholders to engage. For each:

- **Name and title** -- real names from LinkedIn or company website
- **Role in buying decision** -- Champion, Decision Maker, Influencer, Blocker, or User
- **Likely priorities** -- based on their role and company context
- **Estimated receptivity** -- High, Medium, or Low based on available signals
- **Connection path** -- mutual connections, shared background, warm intro available

Hard cap: maximum 5 stakeholders per play. Focus beats coverage.

### Step 4 -- Design Entry Strategy

Determine who to contact first and why:

- **Primary entry point:** The person most likely to respond and champion internally
- **Why them:** Role alignment, signal strength, connection path, or timing
- **Approach:** Channel (LinkedIn, email, warm intro, event), tone, and angle
- **Backup entry:** If primary doesn't respond, who is next and how

The entry point is rarely the decision maker. Find the champion first.

### Step 5 -- Write Personalized Messages

For each stakeholder, write a tailored first-touch message:

- Reference something specific to them (their work, a recent company event, a shared connection)
- Connect to a pain point relevant to their role
- Include one proof point that matches their industry or situation
- End with a low-friction CTA

Each message must be under 100 words for LinkedIn, under 150 words for email.

### Step 6 -- Define Orchestration Timeline

Build a 4-6 week sequence of touches across stakeholders:

- **Week 1:** Primary entry point, first touch
- **Week 2:** Follow-up on primary, first touch on secondary stakeholder
- **Week 3:** Multi-thread (engage 2-3 stakeholders), share relevant content
- **Week 4:** Request meeting, escalate if needed
- **Weeks 5-6:** Executive engagement if earlier plays generated interest

Each touch should specify: who, channel, message type, and purpose.

### Step 7 -- Add Engagement Tracking Criteria

Define what signals indicate the play is working:

- **Green signals:** Reply, profile view, content engagement, meeting accepted
- **Yellow signals:** Open but no reply, viewed LinkedIn message, forwarded internally
- **Red signals:** No engagement after 3 touches, opt-out, wrong contact

Define decision points: when to escalate, when to pause, when to pivot approach.

### Step 8 -- Quality Gate

- [ ] Stakeholder map has 3-5 real, named contacts with defined roles
- [ ] Entry strategy explains why this person first, not just who
- [ ] Each message is personalized to the individual, not just their title
- [ ] Timeline covers 4-6 weeks with specific weekly actions
- [ ] Every message is under word count limits (100 for LinkedIn, 150 for email)
- [ ] Engagement tracking defines Green, Yellow, and Red signals
- [ ] The play is realistic for one person to execute (not 50 touches per week)

If any check fails, fix it before proceeding.

## Output Format

Save to `docs/sales/account-plays/{company-slug}.md`:

```markdown
# Account Play: {Company Name}
Date: {Date}
Tier: 1
Strategic Rationale: {Why this account}

## Company Intelligence
- **Industry:** {Industry}
- **Size:** {Employees / Revenue}
- **Key priorities:** {Top 2-3 strategic priorities}
- **Recent news:** {Relevant developments}
- **Pain points:** {Identified challenges relevant to your offer}

## Stakeholder Map

| # | Name | Title | Role | Priorities | Receptivity | Connection Path |
|---|------|-------|------|-----------|-------------|-----------------|
| 1 | {Name} | {Title} | Champion | {Priorities} | {H/M/L} | {Path} |
| 2 | {Name} | {Title} | Decision Maker | {Priorities} | {H/M/L} | {Path} |

## Entry Strategy
**Primary:** {Name} -- {Rationale}
**Approach:** {Channel and angle}
**Backup:** {Name} -- {When to pivot}

## Personalized Messages

### {Stakeholder 1 Name} -- {Channel}
{Message text}

### {Stakeholder 2 Name} -- {Channel}
{Message text}

## Orchestration Timeline

### Week 1
- [ ] {Action} -- {Stakeholder} via {Channel}

### Week 2
- [ ] {Action} -- {Stakeholder} via {Channel}

[Continue for 4-6 weeks]

## Engagement Tracking
- **Green:** {Signals}
- **Yellow:** {Signals}
- **Red:** {Signals}
- **Escalate when:** {Criteria}
- **Pause when:** {Criteria}
```

## Key Principles

1. **Research depth is the differentiator.** A generic pitch sent to a real name is still a generic pitch. The research must change the message.
2. **Enter through the champion, not the decision maker.** Decision makers ignore cold outreach. Champions who feel the pain will bring you in.
3. **Orchestrate across stakeholders.** Engaging multiple people at the same company in a coordinated sequence creates the impression of market presence.
4. **Under 5 stakeholders.** Trying to engage 10 people at one company dilutes focus and creates confusion. Pick the 3-5 who matter.

## Anti-Patterns

- **Research theater:** Spending hours on research but writing the same generic pitch anyway. If your message would work for any company in their industry, the research was wasted.
- **Decision-maker fixation:** Going straight to the CEO because they "make the decision." They also delete 200 cold emails a day.
- **Simultaneous blast:** Emailing all 5 stakeholders on the same day. Orchestrate over weeks so it feels organic, not coordinated.

## What to Do Next

- Write an **executive briefing** for the decision maker: `/skill executive-briefing`
- Plan **gifting** for this account: `/skill gifting-strategy`
- Design a **full ABM campaign** including this account: `/skill abm-campaign-planner`

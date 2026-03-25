# GTM Skills OS

**151 Claude Code skills for B2B Go-To-Market teams.** 11 packs, organized by role.

Built from 18 months running GTM for 10+ B2B clients. Every skill encodes a repeatable framework, not a prompt hack.

## What's Inside

| Pack | Skills | What it covers |
|------|--------|---------------|
| GTM Foundations | 16 | ICP, positioning, personas, messaging, pricing, competitive intel |
| Outbound Engine | 15 | Cold email, LinkedIn, calls, sequences, nurture, list building |
| Content Machine | 15 | LinkedIn, blogs, SEO, ads, video, lead magnets, newsletters |
| Signal Campaigns | 12 | Signal-based lists, trigger campaigns, prospecting tools |
| ABM Playbook | 12 | Account mapping, executive outreach, multi-threading, LinkedIn ads |
| Sales Enablement | 16 | Battlecards, proposals, discovery, QBRs, coaching, demos |
| RevOps & Infra | 16 | Email infra, CRM, enrichment, comp, capacity, automation |
| Customer Growth | 14 | Health scoring, churn, upsell, partner programs, referrals |
| Events & Field | 11 | Event strategy, conferences, booth, webinars, ROI tracking |
| Analytics & Ops | 17 | Campaign analysis, attribution, dashboards, experiments |
| Freelancer & Agency | 10 | Scoping, onboarding, reporting, case studies, positioning |

**All 151 skills are production-ready.** 28,500+ lines of structured GTM methodology.

## Browse the Full Directory

Explore all 151 skills with filters, search, and detailed metadata:

**[Open the GTM Skills OS on Notion](https://www.notion.so/3264221fbab181c8bdcfeeb2c93db34b)**

## Prerequisites

- **Claude Code** (CLI) or **Claude.ai** with skills support
- For research-oriented skills (competitor analysis, market sizing, etc.): **WebSearch** and **WebFetch** tools are required. These are available on Claude Max/Pro plans or via MCP servers with web access.
- Skills that only need Read + Write (cold email writer, LinkedIn post writer, etc.) work on any Claude plan.

## Install

### Recommended: Install by pack

Don't install all 151 skills at once. Claude loads every skill description into context at startup. More than 50 skills causes triggering collisions and slower responses.

Instead, pick 1-2 packs that match your role:

```bash
git clone https://github.com/iamachilles/gtm-skills-os.git
cd gtm-skills-os
./install.sh outbound-engine
```

### Available Packs

| Pack | Skills | Best for |
|------|--------|----------|
| `gtm-foundations` | 16 | Anyone starting GTM from scratch. ICP, positioning, personas, messaging, pricing. |
| `outbound-engine` | 15 | SDRs, AEs, outbound teams. Cold email, LinkedIn, calls, sequences, nurture. |
| `content-machine` | 15 | Content marketers, founders. LinkedIn, blogs, SEO, ads, video, lead magnets. |
| `signal-campaigns` | 12 | Growth teams. Signal-based lists, trigger campaigns, prospecting tools. |
| `abm-playbook` | 12 | ABM teams, enterprise sellers. Account mapping, executive outreach, LinkedIn ads. |
| `sales-enablement` | 16 | Sales teams, managers. Battlecards, proposals, discovery, QBRs, coaching. |
| `revops-infra` | 16 | RevOps, ops teams. Email infra, CRM, enrichment, comp, capacity, automation. |
| `customer-growth` | 14 | CS teams, partnerships. Health scoring, churn, upsell, partner programs. |
| `events-field` | 11 | Event marketers. Event strategy, conference talks, booth, webinars, ROI. |
| `analytics-ops` | 17 | Marketing ops, analysts. Campaign analysis, attribution, dashboards, experiments. |
| `freelancer-agency` | 10 | Freelancers, consultants. Scoping, onboarding, reporting, positioning. |

Install multiple packs at once:

```bash
./install.sh gtm-foundations outbound-engine
```

List all packs:

```bash
./install.sh list
```

### Install a single skill

```bash
cp -r skills/gtm-diagnostic ~/.claude/skills/gtm-diagnostic
```

### Install all skills (not recommended)

```bash
./install.sh all
```

This will warn you about context budget impact and ask for confirmation.

### Uninstall

```bash
./install.sh uninstall
```

After installing, restart Claude Code and type `/skills` to see your new skills.

## How Skills Chain Together

Skills are most powerful when composed. Each phase's output feeds the next.

```
New market entry (7 skills):
market-sizing -> industry-briefing -> icp-model-creator -> gtm-triangle-builder
-> buying-committee-mapper -> sales-narrative-generator -> write-outbound-sequence

Signal-based micro-campaign (5 skills):
intent-signals -> signal-monitor-setup -> signal-list-generator
-> outreach-personalizer -> trigger-campaign-designer

ABM play for a strategic account (6 skills):
account-mapper -> account-play-designer -> executive-briefing
-> custom-demo-script -> multi-thread-sequence -> event-follow-up

Content engine (5 skills):
content-calendar -> hook-generator -> write-linkedin-post
-> content-repurposer -> content-performance-analyzer

Full client engagement (6 skills):
client-engagement-scoper -> onboard-client -> gtm-diagnostic
-> gtm-triangle-builder -> build-prospect-list -> write-outbound-sequence
```

## Skill File Format

Each skill follows the [Agent Skills open standard](https://agentskills.io/specification.md):

```yaml
---
name: skill-name
description: What it does. Use when user asks to [specific trigger phrases].
allowed-tools: Read, Write, WebSearch
metadata:
  author: Achille Morin-Lemoine
  version: "1.0.0"
---

# Skill Name

Instructions for Claude to execute the skill.

## Inputs
- What the user provides

## Steps
1. What to do
2. In what order
3. With what tools

## Output Format
- What the user gets back
```

## Customize for Your Business

The skills are generic by default. To make them specific to your business:

1. Create a `CLAUDE.md` in your project root with your ICP, positioning, and voice guidelines
2. Skills will automatically pick up that context when running in your project
3. Or fork this repo and edit the skill files directly

## Full Skill Index

<details>
<summary><strong>GTM Foundations (16 skills)</strong></summary>

| Skill | What it does |
|-------|-------------|
| `buying-committee-mapper` | Map 6 decision-maker roles with objections, entry strategies, and cold openers per role |
| `category-designer` | Define or redefine your competitive category |
| `channel-fit-scorer` | Evaluate which GTM channels fit your ICP, ACV, and sales cycle |
| `competitor-analysis` | Deep competitive intelligence with positioning comparison and differentiation matrix |
| `gtm-diagnostic` | Score a company's GTM maturity across 7 dimensions and produce a prioritized fix plan |
| `gtm-triangle-builder` | Build a complete GTM Triangle with positioning, ICPs, personas, value mapping, and channels |
| `icp-challenger` | Stress-test ICP assumptions against data and research |
| `icp-model-creator` | Create a comprehensive ICP document with 10 sections from source material and research |
| `industry-briefing` | Produce a market brief for a new vertical or industry |
| `intent-signals` | Map buying signals for a market with capture methods and messaging angles per signal |
| `market-sizing` | Estimate TAM/SAM/SOM from ICP criteria |
| `messaging-matrix` | Generate a full messaging matrix crossing value pillars with personas |
| `persona-deep-dive` | Create a rich, research-backed buyer persona profile |
| `pricing-strategy` | Design pricing and packaging strategy with model selection, tier structure, and competitive anchoring |
| `sales-narrative-generator` | Generate per-persona sales narratives using the 6-part storyline framework |
| `value-prop-mapper` | Map features to benefits to value outcomes for each persona |

</details>

<details>
<summary><strong>Outbound Engine (15 skills)</strong></summary>

| Skill | What it does |
|-------|-------------|
| `ab-test-designer` | Design A/B tests for outbound campaigns with variables, sample sizes, and analysis frameworks |
| `build-prospect-list` | Build a qualified prospect list with ICP scoring and outreach angles per row |
| `cold-call-script` | Generate a cold call script with opener, qualifying questions, objection handles, and voicemail |
| `cold-email-writer` | Write a high-converting cold email using PAS or AIDA framework |
| `contact-finder` | Find the right contacts at target accounts with buying committee mapping |
| `follow-up-sequence` | Write a follow-up sequence for prospects who opened but didn't reply |
| `inbound-follow-up-sequence` | Write follow-up sequences for inbound leads by source type |
| `lead-enricher` | Enrich companies and contacts with firmographic, technographic, and intent data |
| `linkedin-message-writer` | Write LinkedIn connection requests and follow-up message sequences |
| `nurture-sequence-writer` | Write a long-term nurture sequence with 8-12 touches over 3-6 months |
| `outreach-personalizer` | Generate personalization snippets from prospect research across 5 angles |
| `referral-email` | Write an internal referral request with a forwardable message |
| `reply-handler` | Generate response templates for 8 common reply types in outbound sequences |
| `subject-line-generator` | Generate 10 subject line variants across 5 categories with A/B test pairings |
| `write-outbound-sequence` | Create a multichannel outbound sequence with 8-12 touchpoints across email, LinkedIn, and phone |

</details>

<details>
<summary><strong>Content Machine (15 skills)</strong></summary>

| Skill | What it does |
|-------|-------------|
| `ad-copy-writer` | Write platform-specific ad copy for LinkedIn, Google, and Meta with variants and A/B test pairs |
| `blog-post-writer` | Write an SEO-optimized blog post with keyword research, competitive analysis, and meta tags |
| `carousel-outliner` | Outline a LinkedIn carousel with 12-15 slides including headers, body text, and visual direction |
| `case-study-to-content` | Repurpose a case study into 5-7 LinkedIn post drafts covering different angles |
| `content-calendar` | Generate a 4-week content calendar with 12 posts balanced across angles and formats |
| `content-performance-analyzer` | Analyze content performance and recommend next pieces |
| `content-repurposer` | Turn one piece of content into 5+ derivatives across channels |
| `hook-generator` | Generate 10 hook variants across 5 frameworks with top 3 recommendations |
| `landing-page-copy` | Write conversion-optimized landing page copy with all sections from hero to FAQ |
| `lead-magnet-creator` | Design a lead magnet with content outline, visual spec, promotion post, and DM template |
| `newsletter-writer` | Write a newsletter edition with subject lines, body sections, and CTA |
| `seo-content-brief` | Create an SEO content brief with keyword research, competitive analysis, and detailed outline |
| `video-prospecting-script` | Write a 45-second Loom or Vidyard prospecting video script |
| `write-linkedin-post` | Draft a LinkedIn post with hook variants, CTA options, and visual recommendations |
| `youtube-script-writer` | Write a YouTube video script with hook, sections, b-roll suggestions, and thumbnail options |

</details>

<details>
<summary><strong>Signal Campaigns (12 skills)</strong></summary>

| Skill | What it does |
|-------|-------------|
| `email-validator` | Validate and clean an email list with format checks, risk scoring, and deliverability flags |
| `event-prospector` | Build a prospect list from event attendees, speakers, and sponsors |
| `inbound-qualifier` | Qualify inbound leads with a scoring system and response templates |
| `job-posting-analyzer` | Analyze job postings to infer company priorities and generate outreach angles |
| `linkedin-search-builder` | Convert ICP criteria into Sales Navigator search configurations and boolean strings |
| `lookalike-finder` | Find companies that look like your best customers |
| `signal-list-generator` | Generate a prospect list from a specific buying signal |
| `signal-monitor-setup` | Generate Clay/n8n/Zapier configurations for monitoring buying signals |
| `tam-builder` | Build a Total Addressable Market list with ICP scoring and tiering |
| `tech-stack-analyzer` | Research a prospect's tech stack for sales intelligence and outreach personalization |
| `trigger-campaign-designer` | Design a micro-campaign around a trigger event with messaging, channels, and timing |
| `warm-lead-reactivator` | Identify and re-engage dormant CRM leads worth reactivating |

</details>

<details>
<summary><strong>ABM Playbook (12 skills)</strong></summary>

| Skill | What it does |
|-------|-------------|
| `abm-campaign-planner` | Design a full ABM campaign for a target account list with tier-specific plays |
| `abm-content-mapper` | Map existing content to buying stages and personas for ABM campaigns |
| `account-expansion-planner` | Plan expansion within existing accounts by identifying new departments, use cases, and contacts |
| `account-mapper` | Map an organization's structure, departments, and buying committee |
| `account-play-designer` | Design a custom play for ONE strategic account with stakeholder map and orchestrated outreach |
| `account-tiering-model` | Design a Tier 1/2/3 account prioritization model with scoring rubrics and resource allocation |
| `customer-interview-guide` | Generate a structured discovery interview script with synthesis template |
| `executive-briefing` | Create a personalized C-level briefing with research, business case, and CTA |
| `gifting-strategy` | Design a direct mail and gifting strategy for top accounts by tier |
| `linkedin-ads-abm-setup` | Design a LinkedIn Ads ABM campaign spec with targeting, creative, and measurement |
| `multi-thread-sequence` | Design multi-persona outreach at the same account with coordinated timing |
| `social-proof-collector` | Generate templates for collecting testimonials, case study interviews, and approval workflows |

</details>

<details>
<summary><strong>Sales Enablement (16 skills)</strong></summary>

| Skill | What it does |
|-------|-------------|
| `battlecard-generator` | Create a competitive battlecard for sales conversations |
| `case-study-builder` | Structure a client result into a compelling case study |
| `champion-enablement-kit` | Create materials your champion can use to sell internally |
| `custom-demo-script` | Write a demo script tailored to a specific account — their use case, pain points, competitive context, and success metrics |
| `deal-strategy-advisor` | Analyze a deal and recommend next steps to advance or disqualify |
| `discovery-question-set` | Generate discovery questions using MEDDIC, BANT, or SPICED frameworks |
| `meeting-recap-writer` | Turn raw call notes into a structured meeting recap with action items |
| `mutual-action-plan` | Generate a mutual action plan (MAP) to drive a deal to close |
| `objection-library` | Build a structured objection-handling library organized by persona and objection type |
| `pitch-deck-outliner` | Generate a persona-tailored pitch deck outline with slide-by-slide content and speaker notes |
| `pre-call-brief` | Generate a one-page pre-call brief for a prospect meeting |
| `proposal-writer` | Draft a client proposal with executive summary, methodology, timeline, and pricing |
| `qbr-deck-builder` | Outline a Quarterly Business Review deck with slide-by-slide content and talking points |
| `roi-calculator` | Build an ROI model with payback period, 3-year projections, and sensitivity analysis |
| `sales-coaching-analyzer` | Analyze a sales call transcript for coaching insights with scoring and improvement recommendations |
| `sales-playbook-writer` | Write a comprehensive sales playbook for a market segment with talk tracks, demo flow, objection handling, and close process |

</details>

<details>
<summary><strong>RevOps & Infra (16 skills)</strong></summary>

| Skill | What it does |
|-------|-------------|
| `capacity-planner` | Model SDR/AE headcount needs by working backwards from pipeline and revenue targets |
| `clay-table-designer` | Architect a Clay table blueprint for a specific workflow |
| `compensation-modeler` | Design a sales compensation plan with base/variable split, accelerators, and payout modeling |
| `crm-field-mapper` | Design CRM field structure with custom fields, picklists, and automation triggers |
| `crm-hygiene-audit` | Audit CRM data quality and produce a cleanup action plan |
| `deliverability-checker` | Diagnose email deliverability issues for sending domains |
| `domain-setup-guide` | Generate email infrastructure plan for cold outbound |
| `enrichment-waterfall` | Design a multi-provider data enrichment waterfall with fallback logic |
| `forecast-model` | Build a pipeline forecast with stage-weighted projections and risk flags |
| `handoff-designer` | Design the marketing-to-sales handoff with MQL criteria, SLA, and routing rules |
| `lead-scoring-model` | Build a lead scoring model with fit and intent dimensions |
| `n8n-workflow-builder` | Generate a human-readable n8n workflow specification from a natural language description |
| `revops-audit` | Audit revenue operations across 6 dimensions with scoring and prioritized fixes |
| `sales-process-designer` | Design a sales process with stages, entry/exit criteria, and automation triggers |
| `territory-planner` | Design sales territories with account distribution, capacity modeling, and quota setting |
| `utm-taxonomy` | Design a UTM parameter taxonomy for tracking marketing campaigns |

</details>

<details>
<summary><strong>Customer Growth (14 skills)</strong></summary>

| Skill | What it does |
|-------|-------------|
| `advocacy-program` | Build a customer advocacy program with tiers, engagement cadence, and recruitment |
| `channel-enablement-kit` | Build enablement materials for channel partners |
| `churn-prevention-playbook` | Create a churn prevention strategy with early warnings, intervention tiers, and win-back sequences |
| `co-marketing-planner` | Plan a co-marketing campaign with a partner |
| `customer-health-scorer` | Design a customer health scoring model with weighted dimensions and alert thresholds |
| `customer-onboarding-planner` | Design a post-sale customer onboarding plan with milestones and time-to-value targets |
| `integration-partner-brief` | Create a technology partnership brief for an integration |
| `marketplace-listing-writer` | Write a marketplace listing for a platform |
| `nps-survey-designer` | Design an NPS/CSAT survey program with follow-up actions by score segment |
| `partner-pitch-builder` | Write a pitch to recruit a specific partner |
| `partner-program-designer` | Design a partner program with tiers, benefits, and requirements |
| `referral-program-designer` | Design a customer referral program with incentives, tracking, and launch plan |
| `success-plan-template` | Create a customer success plan with goals, KPIs, milestones, and QBR format |
| `upsell-trigger-mapper` | Map upsell and cross-sell triggers with detection criteria and outreach templates |

</details>

<details>
<summary><strong>Events & Field (11 skills)</strong></summary>

| Skill | What it does |
|-------|-------------|
| `booth-strategy` | Plan a trade show booth strategy |
| `conference-talk-outliner` | Outline a conference talk with narrative arc and speaker notes |
| `deal-desk-playbook` | Design deal desk processes with discount authority, approval workflows, and pricing exceptions |
| `dinner-event-planner` | Plan an executive dinner event with guest selection, invitation sequence, and follow-up |
| `event-follow-up` | Write post-event follow-up sequences for speakers, attendees, and booth visitors |
| `event-gtm-playbook` | Create a full event GTM strategy with pre-event, during-event, and post-event plans |
| `event-invitation-writer` | Write event invitation email sequences |
| `field-event-roi-tracker` | Create an event ROI tracking framework |
| `podcast-guest-pitch` | Write a podcast guest pitch with show research, topic angles, and bio |
| `webinar-planner` | Plan a webinar end-to-end with agenda, promotion plan, follow-up sequence, and repurposing strategy |
| `workshop-designer` | Design a hands-on workshop with exercises and takeaway materials |

</details>

<details>
<summary><strong>Analytics & Ops (17 skills)</strong></summary>

| Skill | What it does |
|-------|-------------|
| `ab-test-analyzer` | Analyze A/B test results with statistical rigor |
| `attribution-modeler` | Design a marketing attribution model |
| `campaign-analyzer` | Analyze campaign performance with segmented metrics and recommendations |
| `cohort-analyzer` | Analyze customer cohorts for retention, LTV, and patterns |
| `content-performance-analyzer` | Analyze content performance and recommend next pieces |
| `conversion-funnel-auditor` | Audit a conversion funnel to find and fix drop-off points |
| `experiment-designer` | Design a GTM experiment with hypothesis, parameters, and analysis framework |
| `g2-review-miner` | Extract themes from G2/Capterra reviews for competitive intelligence and messaging angles |
| `onboarding-ramp-plan` | Design a 90-day new rep onboarding and ramp plan with milestones and knowledge checks |
| `outbound-dashboard-spec` | Design a reporting dashboard for outbound and GTM metrics |
| `pipeline-health-check` | Audit pipeline health with stage distribution, velocity, and coverage analysis |
| `pricing-analyzer` | Analyze competitor pricing models and produce a positioning-ready landscape |
| `tech-stack-auditor` | Audit the GTM tech stack for overlap, gaps, and cost efficiency |
| `voice-of-customer-extractor` | Synthesize customer language from transcripts, tickets, and reviews into a vocabulary map |
| `weekly-gtm-report` | Generate a weekly GTM report with metrics, pipeline, and priorities |
| `weekly-ritual-designer` | Design a GTM operating rhythm with weekly, monthly, and quarterly meetings |
| `win-loss-analyzer` | Analyze closed deals to extract win/loss patterns and improve sales strategy |

</details>

<details>
<summary><strong>Freelancer & Agency (10 skills)</strong></summary>

| Skill | What it does |
|-------|-------------|
| `case-study-from-engagement` | Extract a publishable case study from a client engagement |
| `client-engagement-scoper` | Scope a client engagement with deliverables, timeline, and pricing |
| `client-report-writer` | Write a client progress report with results and next steps |
| `freelancer-positioning` | Define personal positioning for a freelancer or consultant |
| `gtm-diagnostic` | Score a company's GTM maturity across 7 dimensions and produce a prioritized fix plan |
| `inbound-qualifier` | Qualify inbound leads with a scoring system and response templates |
| `launch-strategy` | Plan a product or feature launch with tiered strategy and channel activation timeline |
| `onboard-client` | Set up a new client engagement with context file, discovery questions, infra checklist, and timeline |
| `service-productizer` | Turn a service into a productized offering with fixed scope and pricing |
| `sow-generator` | Generate a Statement of Work from engagement details |

</details>

## Contributing

Found a bug? Want to add a skill? PRs welcome.

1. Fork the repo
2. Add your skill in `skills/your-skill-name/SKILL.md`
3. Follow the format in [SKILL-WRITING-GUIDE.md](SKILL-WRITING-GUIDE.md)
4. Submit a PR with a description of what the skill does and which phase it belongs to

## Who Built This

**Achille Morin-Lemoine** -- GTM Engineering as a Service

I build outbound systems for B2B growth teams: ICP, signals, infrastructure, sequences, CRM ops, and automation. Everything a GTM Engineer would own, without the full-time hire.

[LinkedIn](https://linkedin.com/in/achille-morin-lemoine/)

## License

MIT -- use it, fork it, build on it.

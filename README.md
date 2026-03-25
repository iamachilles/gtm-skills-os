# GTM Skills OS

**151 Claude Code skills for B2B Go-To-Market teams.** 14 phases, from research to revenue.

Built from 18 months running GTM for 10+ B2B clients. Every skill encodes a repeatable framework, not a prompt hack.

## What's Inside

| Phase | Skills | What it covers |
|-------|--------|---------------|
| 1. Research & Diagnostics | 15 | Market sizing, competitive intel, intent signals, win/loss analysis |
| 2. Strategy & Positioning | 14 | ICP, personas, messaging matrix, pricing, launch planning |
| 3. Infrastructure & Data | 12 | Email infra, CRM design, enrichment waterfalls, Clay tables, n8n workflows |
| 4. Prospecting & List Building | 11 | TAM building, signal-based lists, contact finding, micro-campaigns |
| 5. Outreach & Sequences | 15 | Cold email, LinkedIn, calls, multi-threading, A/B testing |
| 6. Content & Demand Gen | 16 | LinkedIn posts, lead magnets, SEO, newsletters, ad copy |
| 7. Sales Enablement | 13 | Battlecards, proposals, discovery frameworks, deal coaching |
| 8. ABM & Account Plays | 8 | Account-level campaigns, executive briefings, expansion plays |
| 9. RevOps & Operations | 10 | Sales process, territories, forecasting, handoffs, deal desk |
| 10. Customer Success | 8 | Health scoring, churn prevention, upsell triggers, advocacy |
| 11. Partnerships | 6 | Partner programs, co-marketing, channel enablement |
| 12. Event Marketing | 6 | Event GTM, conference talks, booth strategy, ROI tracking |
| 13. Analytics & Optimization | 10 | Campaign analysis, pipeline audits, attribution, experiments |
| 14. Freelancer & Agency | 7 | Scoping, SOWs, client reports, positioning, productizing |

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
<summary><strong>Phase 1 -- Research & Diagnostics (15 skills)</strong></summary>

| Skill | What it does |
|-------|-------------|
| `gtm-diagnostic` | Score GTM maturity across 7 dimensions |
| `competitor-analysis` | Deep competitive intel with ad intelligence |
| `intent-signals` | Map and prioritize buying signals |
| `market-sizing` | TAM/SAM/SOM estimation with sourced data |
| `icp-challenger` | Stress-test ICP assumptions against market data |
| `customer-interview-guide` | Generate timed interview scripts with follow-up branches |
| `win-loss-analyzer` | Extract patterns from won/lost/stalled deals |
| `tech-stack-analyzer` | Research prospect tech stack from public sources |
| `pricing-analyzer` | Analyze competitor pricing models and feature gates |
| `channel-fit-scorer` | Score channel-market fit for GTM channels |
| `signal-monitor-setup` | Design always-on signal monitoring system |
| `industry-briefing` | One-page industry primer for new verticals |
| `g2-review-miner` | Extract pain points from review platforms |
| `job-posting-analyzer` | Decode company priorities from job postings |
| `voice-of-customer-extractor` | Extract VoC themes from interviews and reviews |

</details>

<details>
<summary><strong>Phase 2 -- Strategy & Positioning (14 skills)</strong></summary>

| Skill | What it does |
|-------|-------------|
| `icp-model-creator` | Build comprehensive ICP document |
| `gtm-triangle-builder` | Positioning + ICP + personas + channels |
| `buying-committee-mapper` | Map 6 decision-maker roles with entry strategies |
| `sales-narrative-generator` | 6-part storyline per persona |
| `value-prop-mapper` | Map features to benefits to value by persona |
| `objection-library` | Compile objections with reframes and proof |
| `persona-deep-dive` | Detailed persona profile with psychographics |
| `messaging-matrix` | Message variants by persona x stage x channel |
| `category-designer` | Design or redefine your market category |
| `case-study-builder` | Structure engagement results into case study |
| `pitch-deck-outliner` | Outline investor or sales deck |
| `account-tiering-model` | Score and tier accounts by fit + intent + access |
| `pricing-strategy` | Design pricing tiers, metrics, and migration plan |
| `launch-strategy` | Plan product/feature launch end-to-end |

</details>

<details>
<summary><strong>Phase 3 -- Infrastructure & Data (12 skills)</strong></summary>

| Skill | What it does |
|-------|-------------|
| `onboard-client` | Set up new engagement with context files |
| `domain-setup-guide` | Email infrastructure plan (domains, warmup, DNS) |
| `crm-field-mapper` | Design CRM field structure and picklists |
| `lead-scoring-model` | Build Fit + Intent scoring model |
| `enrichment-waterfall` | Design multi-provider enrichment sequence |
| `clay-table-designer` | Architect Clay table for a workflow |
| `crm-hygiene-audit` | Audit CRM data quality with cleanup plan |
| `deliverability-checker` | Diagnose email deliverability issues |
| `utm-taxonomy` | Design UTM parameter naming convention |
| `n8n-workflow-builder` | Generate n8n workflow specifications |
| `tam-builder` | Build total addressable market list |
| `tech-stack-auditor` | Audit GTM tool stack for gaps and overlap |

</details>

<details>
<summary><strong>Phase 4 -- Prospecting & List Building (11 skills)</strong></summary>

| Skill | What it does |
|-------|-------------|
| `build-prospect-list` | Build qualified, enriched prospect list |
| `lead-enricher` | Enrich companies with firmographic + intent data |
| `contact-finder` | Find buying committee contacts at target accounts |
| `lookalike-finder` | Find companies matching your best customers |
| `signal-list-generator` | Generate prospect list from a buying signal |
| `linkedin-search-builder` | Convert ICP to Sales Navigator searches |
| `event-prospector` | Build prospect list from event attendees/speakers |
| `trigger-campaign-designer` | Design micro-campaign around a trigger event |
| `warm-lead-reactivator` | Re-engage dormant CRM leads |
| `account-mapper` | Map organization structure and entry points |
| `email-validator` | Validate and clean email list |

</details>

<details>
<summary><strong>Phase 5 -- Outreach & Sequences (15 skills)</strong></summary>

| Skill | What it does |
|-------|-------------|
| `write-outbound-sequence` | Multichannel outbound sequence |
| `cold-email-writer` | Write cold email with PAS/AIDA framework |
| `linkedin-message-writer` | Connection requests and follow-up messages |
| `cold-call-script` | Call script with objection handles |
| `follow-up-sequence` | 4-touch follow-up for opens-no-reply |
| `referral-email` | Internal referral request with forwardable message |
| `video-prospecting-script` | 45-second Loom/Vidyard script |
| `multi-thread-sequence` | Multi-persona outreach at one account |
| `reply-handler` | Response templates for 8 reply types |
| `subject-line-generator` | 10 subject line variants across 5 frameworks |
| `outreach-personalizer` | Research-based personalization snippets |
| `event-follow-up` | Post-event follow-up sequences |
| `ab-test-designer` | Design A/B tests for outbound campaigns |
| `nurture-sequence-writer` | Long-term nurture over 3-6 months |
| `inbound-follow-up-sequence` | Source-specific inbound follow-up |

</details>

<details>
<summary><strong>Phase 6 -- Content & Demand Gen (16 skills)</strong></summary>

| Skill | What it does |
|-------|-------------|
| `write-linkedin-post` | Draft LinkedIn post matching proven patterns |
| `lead-magnet-creator` | Design lead magnet with promotion plan |
| `case-study-to-content` | Repurpose case study into 5-7 posts |
| `blog-post-writer` | SEO-optimized blog post |
| `newsletter-writer` | Newsletter edition with commentary |
| `content-calendar` | 4-week content calendar with briefs |
| `hook-generator` | 10 hook variants across 5 frameworks |
| `carousel-outliner` | LinkedIn carousel slide-by-slide outline |
| `content-repurposer` | Turn one piece into 5+ derivatives |
| `webinar-planner` | Plan webinar end-to-end |
| `social-proof-collector` | Templates for collecting testimonials |
| `seo-content-brief` | SEO content brief from keyword research |
| `ad-copy-writer` | Ad copy for LinkedIn/Google/Meta |
| `youtube-script-writer` | YouTube video script with b-roll suggestions |
| `podcast-guest-pitch` | Podcast guest pitch with topic angles |
| `landing-page-copy` | Conversion-optimized landing page copy |

</details>

<details>
<summary><strong>Phase 7 -- Sales Enablement (13 skills)</strong></summary>

| Skill | What it does |
|-------|-------------|
| `pre-call-brief` | One-page pre-call brief from research |
| `battlecard-generator` | Competitive battlecard with trap questions |
| `proposal-writer` | Client proposal with tiered pricing |
| `discovery-question-set` | Discovery questions using MEDDIC/BANT/SPICED |
| `deal-strategy-advisor` | Deal health analysis with next steps |
| `qbr-deck-builder` | QBR deck with slide-by-slide content |
| `roi-calculator` | ROI model with sensitivity analysis |
| `mutual-action-plan` | Deal MAP working backwards from close date |
| `champion-enablement-kit` | Materials for your champion to sell internally |
| `meeting-recap-writer` | Call notes to structured recap email |
| `sales-coaching-analyzer` | Analyze call transcript for coaching insights |
| `sales-playbook-writer` | Sales playbook for a segment |
| `custom-demo-script` | Account-tailored demo script |

</details>

<details>
<summary><strong>Phase 8 -- ABM & Account Plays (8 skills)</strong></summary>

| Skill | What it does |
|-------|-------------|
| `abm-campaign-planner` | Full ABM campaign with tier-specific plays |
| `account-play-designer` | Custom play for one strategic account |
| `abm-content-mapper` | Map content to buying stages x personas |
| `executive-briefing` | Personalized C-level briefing |
| `gifting-strategy` | Direct mail/gifting for top accounts |
| `linkedin-ads-abm-setup` | LinkedIn Ads ABM campaign spec |
| `account-expansion-planner` | Expansion in existing accounts |
| `dinner-event-planner` | Executive dinner planning |

</details>

<details>
<summary><strong>Phase 9 -- RevOps & Operations (10 skills)</strong></summary>

| Skill | What it does |
|-------|-------------|
| `sales-process-designer` | Sales stages with entry/exit criteria |
| `territory-planner` | Territory design with capacity modeling |
| `compensation-modeler` | Sales comp plan with accelerators |
| `forecast-model` | Stage-weighted pipeline forecast |
| `handoff-designer` | Marketing-to-sales handoff process |
| `deal-desk-playbook` | Discount authority and approval workflows |
| `capacity-planner` | SDR/AE headcount model |
| `revops-audit` | Revenue operations audit (6 dimensions) |
| `onboarding-ramp-plan` | 90-day new rep onboarding plan |
| `weekly-ritual-designer` | GTM operating rhythm design |

</details>

<details>
<summary><strong>Phase 10 -- Customer Success (8 skills)</strong></summary>

| Skill | What it does |
|-------|-------------|
| `customer-health-scorer` | Health scoring model with alert thresholds |
| `churn-prevention-playbook` | Early warning signals and intervention tiers |
| `nps-survey-designer` | NPS/CSAT program with follow-up actions |
| `referral-program-designer` | Referral program design |
| `advocacy-program` | Customer advocacy program (3 tiers) |
| `upsell-trigger-mapper` | Map upsell/cross-sell triggers |
| `customer-onboarding-planner` | Post-sale onboarding milestones |
| `success-plan-template` | Customer success plan with KPIs |

</details>

<details>
<summary><strong>Phase 11 -- Partnerships (6 skills)</strong></summary>

| Skill | What it does |
|-------|-------------|
| `partner-program-designer` | Partner program with tiers and benefits |
| `co-marketing-planner` | Joint campaign with lead split rules |
| `partner-pitch-builder` | Partner recruitment pitch |
| `integration-partner-brief` | Tech partnership brief |
| `channel-enablement-kit` | Partner sales materials and certification |
| `marketplace-listing-writer` | Marketplace listing copy |

</details>

<details>
<summary><strong>Phase 12 -- Event Marketing (6 skills)</strong></summary>

| Skill | What it does |
|-------|-------------|
| `event-gtm-playbook` | Full pre/during/post event strategy |
| `conference-talk-outliner` | Conference talk with narrative arc |
| `booth-strategy` | Trade show booth plan |
| `workshop-designer` | Hands-on workshop design |
| `field-event-roi-tracker` | Event ROI framework |
| `event-invitation-writer` | 4-touch invitation sequence |

</details>

<details>
<summary><strong>Phase 13 -- Analytics & Optimization (10 skills)</strong></summary>

| Skill | What it does |
|-------|-------------|
| `campaign-analyzer` | Campaign performance with scale/kill/test recs |
| `pipeline-health-check` | Pipeline audit with coverage and velocity |
| `outbound-dashboard-spec` | Reporting dashboard design |
| `ab-test-analyzer` | A/B test results with significance check |
| `attribution-modeler` | Attribution model design |
| `conversion-funnel-auditor` | Funnel drop-off analysis |
| `cohort-analyzer` | Customer cohort analysis (retention, LTV) |
| `experiment-designer` | Structured GTM experiment design |
| `weekly-gtm-report` | One-page weekly GTM report |
| `content-performance-analyzer` | Content ROI and pattern analysis |

</details>

<details>
<summary><strong>Phase 14 -- Freelancer & Agency (7 skills)</strong></summary>

| Skill | What it does |
|-------|-------------|
| `client-engagement-scoper` | Scope engagement with discovery |
| `sow-generator` | Statement of Work generator |
| `client-report-writer` | Client progress report |
| `case-study-from-engagement` | Extract publishable case study |
| `freelancer-positioning` | Personal positioning and LinkedIn copy |
| `service-productizer` | Turn service into productized offering |
| `inbound-qualifier` | Qualify inbound leads with scorecard |

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

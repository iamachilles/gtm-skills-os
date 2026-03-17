# GTM Skills OS

**151 Claude Code skills for B2B Go-To-Market teams.** 14 phases, from research to revenue.

Built from 15 months running GTM for 10+ B2B clients. Every skill encodes a repeatable framework — not a prompt hack.

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

**11 skills ready to use.** 140 coming soon.

## Browse the Full Directory

Explore all 151 skills with filters, search, and detailed metadata:

**[Open the GTM Skills OS on Notion](https://www.notion.so/1234480458f14f1daa854480e22c6e29)**

Every skill includes: one-liner, who it's for, required inputs, expected output, which skills it chains with, and difficulty level.

## Install

### Option 1 — Install a single skill

```bash
# Copy the skill folder into your Claude Code skills directory
cp -r skills/gtm-diagnostic ~/.claude/skills/gtm-diagnostic
```

### Option 2 — Install all skills

```bash
git clone https://github.com/iamachilles/gtm-skills-os.git
cp -r gtm-skills-os/skills/* ~/.claude/skills/
```

### Option 3 — Cherry-pick by phase

```bash
# Example: install all prospecting skills
for skill in gtm-skills-os/skills/phase-04-*; do
  cp -r "$skill" ~/.claude/skills/$(basename "$skill" | sed 's/phase-[0-9]*-//')
done
```

After installing, restart Claude Code and type `/skills` to see your new skills.

## How Skills Chain Together

Skills are most powerful when composed. Each phase's output feeds the next.

```
New market entry (7 skills):
market-sizing → industry-briefing → icp-model-creator → gtm-triangle-builder
→ buying-committee-mapper → sales-narrative-generator → write-outbound-sequence

Signal-based micro-campaign (5 skills):
intent-signals → signal-monitor-setup → signal-list-generator
→ outreach-personalizer → trigger-campaign-designer

ABM play for a strategic account (6 skills):
account-mapper → account-play-designer → executive-briefing
→ custom-demo-script → multi-thread-sequence → event-follow-up

Content engine (5 skills):
content-calendar → hook-generator → write-linkedin-post
→ content-repurposer → content-performance-analyzer

Full client engagement (6 skills):
client-engagement-scoper → onboard-client → gtm-diagnostic
→ gtm-triangle-builder → build-prospect-list → write-outbound-sequence
```

## Skill File Format

Each skill is a Markdown file with YAML frontmatter:

```markdown
---
description: What the skill does (shown in /skills menu)
tools: Read, Write, WebSearch
---

# Skill Name

Instructions for Claude Code to execute the skill.

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

## Contributing

Found a bug? Want to add a skill? PRs welcome.

1. Fork the repo
2. Add your skill in `skills/` following the naming convention: `phase-XX-skill-name/SKILL.md`
3. Submit a PR with a description of what the skill does and which phase it belongs to

## Who Built This

**Achille Morin-Lemoine** — GTM Engineering as a Service

I build outbound systems for B2B growth teams: ICP, signals, infrastructure, sequences, CRM ops, and automation. Everything a GTM Engineer would own, without the full-time hire.

- [LinkedIn](https://linkedin.com/in/achille-morin-lemoine/)
- [Website](https://blog.achilles.ml)

## License

MIT — use it, fork it, build on it.

---
description: Research a prospect's tech stack for sales intelligence and outreach personalization. Trigger phrases — "tech stack analysis", "what tools do they use", "technology stack", "prospect tech stack", "tech research"
tools: Read, Write, WebFetch, WebSearch
---

# Tech Stack Analyzer

Research a prospect company's technology stack to identify integration opportunities, competitive displacement angles, and personalization hooks for outreach. The output is a per-company intelligence file that sales can use to tailor conversations.

Good tech stack research goes beyond listing tools. It identifies what the stack reveals about the company's maturity, priorities, and potential pain points.

## Inputs

- **Company name** (required) — the company to research
- **Company domain** (required) — website URL for scraping and research
- **Product/service context** (optional) — what you're selling, so displacement angles are relevant. Check `CLAUDE.md` for this.
- **ICP document** (optional) — if `docs/icp.md` exists, load it to assess tech fit signals
- **Specific tools to check for** (optional) — particular technologies to look for (e.g., "Are they using Salesforce or HubSpot?")

If company name and domain are both missing, ask before proceeding. You need at least one to start research.

## Steps

### Step 1 — Load Context

Read existing project documents:
- Check for `CLAUDE.md` — load product context and positioning
- Check for `docs/icp.md` — load tech-related ICP signals (technology stack criteria, integration requirements)
- Check for `docs/competitors/competitive-analysis.md` — load competitor tools for displacement identification

Identify which technology categories matter most for this product/prospect combination.

### Step 2 — Scrape Company Website

Use WebFetch to pull key pages from the company's website:

**Pages to check:**
- Homepage — overall positioning and maturity signals
- `/integrations` or `/partners` — explicitly listed technology partnerships
- `/about` or `/team` — team size and structure clues
- `/careers` or `/jobs` — job postings reveal tech stack in requirements
- `/blog` or `/engineering` — engineering blog posts mention tools and architecture
- `/security` or `/compliance` — infrastructure and compliance tools
- Footer — badges, certifications, "powered by" mentions

From each page, extract:
- Named technologies, platforms, and tools
- Integration partnerships
- Infrastructure clues (cloud provider, hosting)
- Maturity indicators (SOC2, GDPR, enterprise features)

### Step 3 — Research Job Postings

Job postings are the most reliable source of tech stack information. Use WebSearch:

- "{company name} engineering jobs"
- "{company name} careers developer"
- "{company name} jobs site:linkedin.com"
- "{company name} jobs site:greenhouse.io OR site:lever.co OR site:ashbyhq.com"
- "{company name} data engineer OR analytics engineer jobs"
- "{company name} sales operations jobs" (reveals CRM and sales tools)
- "{company name} marketing manager jobs" (reveals marketing stack)

From job postings, extract every technology mentioned in:
- Required skills / tech requirements
- "Nice to have" / preferred qualifications
- Job description body (tools they use day-to-day)

### Step 4 — Search Tech Intelligence Sources

Use WebSearch to find tech stack data from aggregator sources:

- "{company name} tech stack"
- "{company name} site:stackshare.io"
- "{company name} site:builtwith.com"
- "{company name} technologies used"
- "{company name} engineering blog tools"
- "site:{domain} powered by OR built with OR integrates with"
- "{company name} case study" (vendors publish case studies naming their customers)

Also check:
- "{company name} {specific tool}" for each tool you want to verify
- "{company name} migrated from OR switched from" for technology changes

If WebSearch returns nothing for a query, record "Not found." Do not guess what tools a company uses.

### Step 5 — Categorize the Tech Stack

Organize all discovered technologies into categories:

| Category | What to Look For |
|----------|-----------------|
| CRM | Salesforce, HubSpot, Pipedrive, Close, Freshsales |
| Marketing Automation | HubSpot, Marketo, Pardot, ActiveCampaign, Mailchimp |
| Sales Engagement | Outreach, Salesloft, Apollo, Lemlist |
| Analytics & BI | Tableau, Looker, Amplitude, Mixpanel, GA4 |
| Data/CDP | Segment, mParticle, Snowflake, BigQuery |
| Product/Engineering | React, Python, AWS, GCP, Azure, Kubernetes |
| Support | Zendesk, Intercom, Freshdesk, Help Scout |
| HR/People | Workday, BambooHR, Gusto, Rippling |
| Communication | Slack, Teams, Zoom |
| Project Management | Jira, Asana, Linear, Monday |
| Finance | Stripe, Chargebee, Zuora, NetSuite |

For each tool identified, note:
- Confidence level: Confirmed (seen on website/job posting) / Likely (mentioned in a related source) / Possible (inferred from context)
- Source where it was found

### Step 6 — Identify Integration Opportunities

Based on the product being sold and the prospect's stack:
- Which tools in their stack does your product integrate with?
- Which tools could your product replace?
- Which tools create workflow dependencies your product should fit into?
- Are there gaps in their stack your product fills?

Map each opportunity:
- Tool in their stack + how your product connects
- The value proposition of that connection
- Potential friction (migration cost, switching risk)

### Step 7 — Identify Displacement Angles

For each competitor tool found in their stack:
- What are the known weaknesses of that tool?
- What switching triggers exist? (pricing changes, feature gaps, contract renewals)
- What's the migration path look like?
- What would the prospect gain by switching?

Search: "{competitor tool} complaints", "{competitor tool} alternatives", "switching from {competitor tool}"

### Step 8 — Assess Tech Maturity

Based on the full stack picture, assess:
- **Overall maturity:** Early-stage (basic tools, lots of manual work) / Growth (specialized tools, some automation) / Mature (enterprise stack, heavy integration)
- **Investment priority:** Where are they spending? (engineering-heavy vs. sales-heavy vs. marketing-heavy)
- **Modernization signals:** Are they migrating to modern tools? (legacy to cloud, spreadsheets to platforms)
- **Integration sophistication:** Do they use iPaaS (Zapier, Make, Workato)? Custom integrations?

### Step 9 — Run Quality Gate

Before saving, verify:
- [ ] At least 5 technology categories have findings (even if "no tool identified")
- [ ] Every tool listed has a confidence level and source
- [ ] No tools are listed without evidence (no "they probably use Slack" without a source)
- [ ] Integration opportunities are specific to the product being sold
- [ ] Displacement angles reference actual weaknesses, not generic claims
- [ ] Tech maturity assessment is consistent with the tools found

## Output Format

Save to `docs/prospects/{company-slug}-tech-stack.md`:

```markdown
# Tech Stack Analysis: [Company Name]
Date: [Date]
Domain: [URL]
Research Confidence: [High/Medium/Low — based on data availability]

## Summary
[3-4 sentences: key stack characteristics, maturity level, most relevant findings for outreach]

## Technology Stack

| Category | Tool(s) | Confidence | Source |
|----------|---------|-----------|--------|
| CRM | [Tool] | Confirmed | [Job posting / website / etc.] |
| Marketing Automation | [Tool] | Likely | [Source] |
| Sales Engagement | Not identified | — | — |
| Analytics | [Tool] | Confirmed | [Source] |
| [etc.] | | | |

## Integration Opportunities

| Their Tool | Integration Point | Value Proposition |
|-----------|-------------------|-------------------|
| [Tool] | [How it connects] | [Why it matters to them] |
| [Tool] | [How it connects] | [Why it matters to them] |

## Competitive Displacement Angles

| Competitor Tool | Known Weakness | Switching Trigger | Migration Path |
|----------------|---------------|-------------------|----------------|
| [Tool] | [Weakness] | [Trigger] | [Complexity: Easy/Medium/Hard] |

## Tech Maturity Assessment
- **Overall:** [Early / Growth / Mature]
- **Investment priority:** [Where they're spending]
- **Modernization signals:** [Any migration patterns]

## Outreach Personalization Hooks
- [Hook 1: specific tech-related talking point for outreach]
- [Hook 2: specific tech-related talking point]
- [Hook 3: specific tech-related talking point]

## Data Sources
1. [Source and what it revealed]
2. [Source and what it revealed]
```

## Key Principles

1. **Confidence levels are mandatory.** Never state a tool as part of their stack without noting whether it's confirmed, likely, or possible. Misidentifying a prospect's tools destroys credibility in outreach.
2. **Job postings are the richest source.** A single engineering job posting reveals more about a tech stack than 10 web searches. Always check job postings first.
3. **The stack tells a story.** A company using Salesforce + Marketo + Outreach is at a different maturity level than one using HubSpot Free + Mailchimp. Read the narrative, not just the list.
4. **Outreach hooks are the payoff.** The tech stack table is research. The personalization hooks are what makes this useful for sales. Every analysis must end with specific things to say in outreach.

## Anti-Patterns

- **Do NOT list tools without evidence.** "Most companies this size use Slack" is not evidence that this company uses Slack. Only list what you found.
- **Do NOT scrape or access tools that require authentication.** Only use publicly available information from web searches and public web pages.
- **Do NOT over-research.** If after Steps 2-4 you have a solid picture, move to analysis. Diminishing returns hit fast. Cap total research queries at 20.

## Skill Chain

- **Chains to:** Outreach personalization (tech hooks feed cold email/LinkedIn), pre-call research (brief for sales calls)

> **Next step:** "Want me to research another prospect's tech stack?" or "Should I use these findings to personalize an outreach sequence?"

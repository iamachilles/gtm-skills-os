---
name: tech-stack-auditor
description: Audit the GTM tech stack for overlap, gaps, and cost efficiency. Use when someone asks "audit tech stack", "tool audit", "GTM tools review", "consolidate tools", "tech stack analysis", "which tools to keep", or "tool overlap"
allowed-tools: Read, Write
metadata:
  author: Achille Morin-Lemoine
  version: "1.0.0"
---

# Tech Stack Auditor

Audit the GTM tech stack by categorizing tools, identifying overlap and gaps, estimating cost per function, and producing a consolidation plan with a data flow map. The output helps teams cut redundant tools and fill critical gaps.

## Inputs

- **Current tool list with costs** (required) — list of tools with approximate monthly cost per tool
- **Team size** (optional) — number of people using the stack
- **Pain points** (optional) — what is not working (slow, expensive, disconnected, etc.)
- **Budget target** (optional) — desired monthly spend for the full stack

If the tool list is missing, ask for it before proceeding. Need at minimum: tool names and approximate monthly cost.

## Steps

### Step 0 — Idempotency Check

Check if operations documents exists. If it does, ask: "A tech stack audit already exists. Do you want to run a fresh audit or update the existing one?"

### Step 1 — Load Context

Read these files if they exist:
- ICP document — for understanding GTM requirements
- gtm triangle.md documents — for channel and motion context
- operations documents — for enrichment tool context
- `CLAUDE.md` — project context

### Step 2 — Categorize Tools by Function

Map each tool to its primary GTM function:

| Category | Description | Tools in Stack |
|----------|------------|---------------|
| CRM | Contact and deal management | [List] |
| Enrichment | Data enrichment and email finding | [List] |
| Sequencing | Email outreach automation | [List] |
| Analytics | Website and campaign analytics | [List] |
| Automation | Workflow automation (n8n, Zapier) | [List] |
| Content | Content creation and management | [List] |
| Social | Social media management | [List] |
| Advertising | Paid advertising platforms | [List] |
| Communication | Team communication (Slack, etc.) | [List] |
| Project Management | Task and project tracking | [List] |
| Intent / Signals | Buying signal detection | [List] |
| Other | Does not fit above categories | [List] |

If a tool serves multiple functions, list it under its PRIMARY function and note secondary uses.

### Step 3 — Identify Overlap

Flag categories where multiple tools serve the same function:

| Category | Tools | Overlap Type | Recommendation |
|----------|-------|-------------|---------------|
| Enrichment | Apollo + Clearbit + ZoomInfo | Full overlap | Consolidate to 1 primary + 1 fallback |
| Sequencing | Lemlist + Instantly | Partial overlap | Choose one based on feature needs |
| Analytics | GA4 + Mixpanel + HubSpot Analytics | Partial overlap | Evaluate which provides unique value |

For each overlap:
- **Full overlap**: tools do the same thing for the same users. Consolidate.
- **Partial overlap**: tools share some capabilities but have unique features. Evaluate.
- **Complementary**: tools in the same category but serve different use cases. Keep.

### Step 4 — Identify Gaps

Check for missing critical functions:

| Function | Status | Impact | Recommendation |
|----------|--------|--------|---------------|
| Email verification | Missing | High bounce risk | Add Findymail or NeverBounce |
| Intent signal monitoring | Missing | Missing buying signals | Add Clay or Bombora |
| Call recording/analysis | Missing | No call insights | Add Gong or Chorus |
| Attribution tracking | Missing | Cannot measure ROI | Configure UTM + analytics |
| Data backup | Missing | Single point of failure | Add CRM export automation |

Only flag gaps that are relevant to the company's GTM motion. A company doing purely outbound does not need a content management gap flagged.

### Step 5 — Estimate Cost Per Function

Calculate what each GTM function costs:

| Function | Tools | Monthly Cost | % of Total | Benchmark |
|----------|-------|-------------|-----------|-----------|
| CRM | HubSpot | $800/mo | 25% | $50-200/user/mo |
| Enrichment | Apollo + Clearbit | $500/mo | 16% | $0.02-0.15/record |
| Sequencing | Lemlist | $200/mo | 6% | $50-100/user/mo |
| Total | — | $3,200/mo | 100% | — |

Include benchmark costs per function to identify overspend. Flag any category where spend is more than 2x the benchmark.

Also calculate:
- **Cost per seat**: total spend / number of users
- **Cost per function**: spend in category / number of tools in category
- **Utilization estimate**: is the tool being used to its potential? (Low / Medium / High)

### Step 6 — Recommend Consolidation

For each overlap, recommend a specific action:

| Action | Tool(s) Affected | Monthly Savings | Risk | Migration Effort |
|--------|-----------------|----------------|------|-----------------|
| Drop ZoomInfo, keep Apollo | ZoomInfo | $500/mo | Low (Apollo covers same data) | Low (export contacts) |
| Replace Instantly with Lemlist | Instantly | $100/mo | Medium (different UI, team retraining) | Medium (migrate sequences) |
| Upgrade HubSpot tier instead of using 3 tools | Tool A + Tool B | $300/mo | Low (HubSpot native features) | High (rebuild automations) |

For each recommendation:
- Quantify monthly savings
- Rate migration effort (Low / Medium / High)
- Identify risks and mitigation steps
- Note if the change affects other tools in the stack (integration dependencies)

### Step 7 — Produce Data Flow Map

Show how tools should connect:

```
[Data Source] → [Enrichment] → [CRM] → [Sequencer]
                                  ↓
                              [Analytics]
                                  ↓
                              [Reporting]

Specific flow:
LinkedIn / Website → Clay (enrichment) → HubSpot (CRM) → Lemlist (sequences)
                                              ↓
                                         GA4 (analytics) → Google Sheets (reporting)
                                              ↓
                                         Slack (notifications)
```

For each connection, note:
- Integration method (native, Zapier, n8n, API, CSV export/import)
- Data that flows between tools
- Sync frequency (real-time, daily, manual)

### Step 8 — Quality Gate

Before saving, verify:
- [ ] Every tool in the provided list is categorized
- [ ] Overlap analysis identifies specific redundancies (not just "some overlap")
- [ ] Gap analysis is relevant to the company's GTM motion
- [ ] Cost per function includes benchmarks for comparison
- [ ] Consolidation recommendations include savings estimates
- [ ] Data flow map shows how tools connect (not just a list)
- [ ] Migration risks are noted for each consolidation recommendation

## Output Format

Save the output to your project. Suggested filename: `tech-stack-audit.md`

```markdown
# GTM Tech Stack Audit
Date: [Date]
Total Monthly Spend: [$X,XXX]
Number of Tools: [X]
Team Size: [X users]
Cost Per User: [$X/user/mo]

## Executive Summary
[2-3 sentences: overall health, biggest overlap, critical gaps, savings opportunity]

## Tool Inventory
| Tool | Category | Monthly Cost | Users | Utilization | Primary Use |
|------|----------|-------------|-------|-------------|------------|
| ... | ... | $X | X | Low/Med/High | ... |

## Cost by Function
| Function | Tools | Monthly Cost | % of Total | Benchmark | Status |
|----------|-------|-------------|-----------|-----------|--------|
| ... | ... | $X | X% | $X | Over/Under/On track |

## Overlap Analysis
| Category | Overlapping Tools | Type | Recommendation |
|----------|------------------|------|---------------|
| ... | ... | Full/Partial | ... |

## Gap Analysis
| Missing Function | Impact | Priority | Recommended Tool | Est. Cost |
|-----------------|--------|----------|-----------------|-----------|
| ... | ... | High/Med/Low | ... | $X/mo |

## Consolidation Plan
| # | Action | Savings | Effort | Risk | Timeline |
|---|--------|---------|--------|------|----------|
| 1 | ... | $X/mo | Low/Med/High | ... | [X weeks] |

**Total potential savings: $X/mo ($X/year)**

## Data Flow Map
```
[Visual flow diagram]
```

### Connection Details
| From | To | Method | Data | Frequency |
|------|----|--------|------|-----------|
| ... | ... | Native/API/Zapier | ... | Real-time/Daily/Manual |

## Recommendations Summary
1. **Quick wins** (low effort, high savings): [List]
2. **Strategic moves** (high effort, high impact): [List]
3. **Nice to have** (low priority): [List]

## Next Steps
- [Immediate actions]
- [30-day actions]
- [90-day actions]
```

## Key Principles

1. **Categorize before you optimize.** You cannot find overlap without a clear taxonomy. Map every tool to its function first.
2. **Cost per function, not cost per tool.** A $500/month tool that replaces three $200/month tools saves money. Evaluate the function, not the line item.
3. **Utilization matters more than features.** A tool with 100 features where you use 5 is not worth its price. Score utilization honestly.
4. **Data flow determines integration cost.** The cheapest tool that does not integrate with your CRM costs more in manual work than a pricier tool with native integration.
5. **Audit annually, review quarterly.** Tech stacks accumulate tools like closets accumulate clothes. Regular audits prevent bloat.

## Anti-Patterns

- **"We need this tool, we have always used it."** Sunk cost is not a reason to keep a tool. Evaluate every tool against current needs, not historical decisions.
- **"Let us add another tool to fill this gap."** Before adding, check if an existing tool can cover the gap with a configuration change or upgrade. New tools mean new integrations, new logins, and new costs.
- **"The free tier is fine."** Free tiers have limits that cause problems at scale (rate limits, feature restrictions, no support). Factor in the hidden cost of workarounds.

## Chain Triggers

After completing, suggest:
- "Run **enrichment-waterfall** to optimize the enrichment tools identified in this audit"
- "Run **n8n-workflow-builder** to design automations connecting the recommended stack"
- "Run **utm-taxonomy** to ensure analytics tools are properly tracking campaigns"

---
name: signal-monitor-setup
description: Generate Clay/n8n/Zapier configurations for monitoring buying signals. Use when someone asks "set up signal monitoring", "automate intent signals", "build signal workflows", "configure buying signal alerts", or "operationalize signals"
allowed-tools: Read, Write
metadata:
  author: Achille Morin-Lemoine
  version: "1.0.0"
---

# Signal Monitor Setup

Generate tool-specific configuration blueprints for monitoring buying signals. This skill takes a signal map (from intent-signals) and produces actionable setup specs for Clay, n8n, or Zapier. The output is a configuration document that an ops person can implement directly.

This skill does NOT execute API calls or create live automations. It produces the blueprint with placeholder values for credentials and endpoints.

## Inputs

- **Signal map or docs/intent-signals.md** (required) — prioritized buying signals with capture methods
- **Preferred tool** (required) — one of: Clay, n8n, Zapier, or "all three"
- **CRM destination** (optional) — where enriched signals should land (HubSpot, Salesforce, Pipedrive, etc.)
- **Notification channel** (optional) — where alerts should go (Slack channel, email, etc.)
- **Budget context** (optional) — affects which enrichment providers to recommend

If signal map is missing, tell the user to run **intent-signals** first. If preferred tool is missing, ask which platform they use.

## Steps

### Step 1 — Load Signal Map and Context

Read these files if they exist:
- intent signals.md documents — the signal map with priorities and capture methods
- ICP document — ICP context for filtering logic
- `CLAUDE.md` — project context

From the signal map, extract:
- Each prioritized signal (focus on top 5 by priority score)
- Data sources per signal
- Capture methods and frequency
- Any compound signal definitions

### Step 2 — Define Per-Signal Configuration Specs

For each of the top 5 priority signals, define:

- **Signal name** — human-readable identifier
- **Trigger condition** — the exact event or data change that fires the signal (be specific: "New job posting containing 'Head of Revenue' OR 'VP Sales' posted in the last 7 days" not "hiring signal detected")
- **Data source** — primary source (LinkedIn, job boards, Crunchbase, G2, Google Alerts, press releases)
- **Enrichment steps** — what additional data to pull once the signal fires (company info, contact details, tech stack, recent funding)
- **Filter logic** — ICP-based filters to reduce noise (company size, industry, geography, exclude existing customers)
- **Routing rules** — where the enriched signal goes (CRM record update, Slack alert, email notification, outreach sequence enrollment)
- **Alert format** — exactly what the notification should contain (signal type, company name, signal details, recommended action, relevant contact)
- **Frequency** — how often to check (real-time, daily, weekly)

### Step 3 — Generate Tool-Specific Configuration

Based on the preferred tool, produce the configuration blueprint:

**If Clay:**
- Table schema with column names, data types, and source mappings
- Enrichment waterfall: which Clay enrichments to run and in what order
- Filter formulas for ICP matching
- Integration setup for CRM push and Slack notifications
- Clay-specific: use Clay's built-in enrichment providers (Clearbit, Apollo, LinkedIn, etc.)

**If n8n:**
- Workflow node sequence with node types and configurations
- Trigger node specification (webhook, cron, or event-based)
- HTTP Request nodes for data source APIs with URL patterns and headers
- IF/Switch nodes for filter logic with exact conditions
- Output nodes for CRM API calls and Slack messages
- Error handling nodes for API failures and rate limits

**If Zapier:**
- Zap structure: trigger app + action apps in sequence
- Trigger configuration (app, event type, filter conditions)
- Action steps with field mappings
- Filter steps with conditions
- Formatter steps for data transformation
- Multi-step zap structure if needed

For each tool configuration, include:
- Placeholder values marked as `{{PLACEHOLDER_NAME}}` for API keys, webhook URLs, and credentials
- Expected API endpoints and methods
- Rate limit considerations
- Error handling approach

### Step 4 — Define Compound Signal Logic

For compound signals (2-3 individual signals that together indicate high intent):
- Define the combination logic (Signal A AND Signal B within 30 days)
- Specify how to track signal co-occurrence across time
- Design the escalation: compound signals should trigger higher-priority alerts
- Include a scoring mechanism: each individual signal adds points, compound threshold triggers action

### Step 5 — Create Testing Checklist

For each signal configuration:
- How to test with a known company (manual verification)
- Expected output format with example data
- Common failure modes and debugging steps
- Metrics to track: signal volume, false positive rate, time-to-action

### Step 6 — Run Quality Gate

Before saving, verify:
- [ ] Each of the top 5 signals has a complete configuration spec
- [ ] Trigger conditions are specific and testable, not vague
- [ ] Filter logic references actual ICP criteria (not generic "good fit")
- [ ] All credential/API key values use `{{PLACEHOLDER}}` format
- [ ] Routing rules specify exact destinations (Slack channel name, CRM object type)
- [ ] At least one compound signal is defined
- [ ] Testing checklist is included for each signal

## Output Format

Save the output to your project. Suggested filename: `signal-monitoring-setup.md`

```
# Signal Monitoring Setup: [Company/Product Name]
Date: [Date]
Platform: [Clay / n8n / Zapier]

## Prerequisites
- [ ] [Platform] account with [tier] plan
- [ ] API keys: [List required API keys with placeholder names]
- [ ] CRM integration: [CRM name] connected
- [ ] Notification channel: [Slack channel / email] configured

## Signal Configurations

### Signal 1: [Signal Name] — Priority [1-5]
**Trigger:** [Exact trigger condition]
**Source:** [Data source and access method]
**Frequency:** [Check interval]

**Enrichment steps:**
1. [Step with provider]
2. [Step with provider]

**Filter logic:**
- [Condition 1]
- [Condition 2]

**Routing:**
- If score >= [threshold]: [Action — e.g., create CRM deal + Slack alert]
- If score < [threshold]: [Action — e.g., add to nurture list]

**Alert format:**
> :signal_type: **[Signal Type]** detected
> **Company:** [name]
> **Signal:** [details]
> **Contact:** [name, title]
> **Action:** [recommended next step]

**[Platform] Configuration:**
[Tool-specific setup details — table schema / workflow nodes / zap structure]

[Repeat for each signal]

## Compound Signals

### [Compound Signal Name]
- **Combination:** [Signal A] + [Signal B] within [timeframe]
- **Scoring:** Signal A = [X] pts, Signal B = [Y] pts, threshold = [Z] pts
- **Escalation:** [What happens when compound signal fires]
- **Configuration:** [How to implement in chosen platform]

## Testing Checklist
- [ ] Test Signal 1 with [known company] — expected output: [description]
- [ ] Test Signal 2 with [known company] — expected output: [description]
- [ ] Test compound signal with [scenario]
- [ ] Verify CRM record creation/update
- [ ] Verify Slack/email notification delivery

## Maintenance
- **Weekly:** Review false positive rate, adjust filters
- **Monthly:** Check API usage and rate limits, review signal volume
- **Quarterly:** Re-evaluate signal priorities against pipeline data
```

## Key Principles

1. **Specificity over flexibility.** "Job posting containing 'RevOps' posted in last 7 days for companies with 50-500 employees" beats "monitor hiring signals." Vague triggers produce noisy alerts.
2. **Filter aggressively.** Every signal should pass through ICP filters before alerting. Unfiltered signals create alert fatigue and get ignored.
3. **No credentials in output.** Every API key, webhook URL, and token must use `{{PLACEHOLDER}}` format. This is a blueprint, not a live config.
4. **Start with 3-5 signals, not 15.** More signals means more noise. Recommend starting with the highest-priority signals and expanding only after validation.
5. **Compound signals are the prize.** Individual signals are useful. Two signals from the same company within 30 days are actionable. Always design for compound detection.

## Anti-Patterns

- **Do not produce API keys, tokens, or real credentials.** Use placeholders only.
- **Do not design configurations that require enterprise-tier tools when the user has a free plan.** Ask about budget context and design accordingly.
- **Do not skip error handling.** Every API call can fail. Every configuration must include what happens when a data source is unavailable.

## Chain Triggers

After completing, suggest:
- "Run **signal-list-generator** to build a prospect list from companies matching these signals"
- "Run **trigger-campaign-designer** to create outreach campaigns triggered by these signals"
- "Run **write-outbound-sequence** to draft messaging that references the detected signals"

---
description: Generate a human-readable n8n workflow specification from a natural language description. Use when someone asks "build n8n workflow", "automate this in n8n", "n8n automation", "design n8n flow", "workflow automation spec", or "connect these tools with n8n"
tools: Read, Write
---

# n8n Workflow Builder

Generate a human-readable n8n workflow specification from a natural language description. This skill translates "when X happens, do Y then Z" into a node-by-node specification with configurations, data transformations, and error handling. The output is a blueprint that someone can implement in n8n's visual editor.

This skill does NOT generate JSON workflow exports. It produces a human-readable spec.

## Inputs

- **Workflow description** (required) — natural language description of what the automation should do (e.g., "When a new lead is added to HubSpot with ICP score above 80, enrich with Apollo, send Slack notification, and add to Lemlist sequence")
- **Tools/platforms involved** (optional) — which services the workflow connects
- **Trigger type** (optional) — what initiates the workflow (webhook, schedule, CRM event, manual)
- **Error handling needs** (optional) — what should happen when a step fails

If the workflow description is missing or too vague to design nodes, ask for clarification.

## Steps

### Step 0 — Idempotency Check

Derive a name slug from the workflow description (e.g., "lead-enrichment-notify", "signal-to-sequence"). Check if `docs/ops/n8n-workflow-{name-slug}.md` exists. If it does, ask: "A spec for this workflow already exists. Do you want to refine it or overwrite it?"

### Step 1 — Load Context

Read these files if they exist:
- `docs/ops/enrichment-waterfall.md` — for enrichment step details
- `docs/ops/crm-fields.md` — for CRM field mappings
- `docs/ops/lead-scoring-model.md` — for scoring logic
- `CLAUDE.md` — project context

### Step 2 — Parse Workflow into Steps

Break the natural language description into discrete steps:

1. **Trigger** — what starts the workflow
2. **Data retrieval** — what data needs to be fetched
3. **Processing** — transformations, scoring, filtering
4. **Decisions** — conditional logic (if/else branches)
5. **Actions** — what happens as output (create record, send message, update field)
6. **Error handling** — what happens when things fail

Map each step to a category: Trigger / Fetch / Transform / Branch / Action / Error.

### Step 3 — Identify n8n Nodes Needed

For each step, identify the appropriate n8n node:

**Trigger nodes:**
| Trigger Type | n8n Node | Configuration |
|-------------|----------|---------------|
| Webhook | Webhook | POST, JSON body |
| Schedule | Cron | Interval, time |
| CRM event | HubSpot/Pipedrive Trigger | Event type, filters |
| Manual | Manual Trigger | — |
| Email received | Email Trigger (IMAP) | Mailbox, filters |

**Processing nodes:**
| Function | n8n Node | Use Case |
|----------|----------|----------|
| HTTP call | HTTP Request | API calls to external services |
| Conditional | IF | Route based on conditions |
| Multi-path | Switch | Route to multiple paths |
| Transform data | Set | Rename/restructure fields |
| Code logic | Code | Custom JavaScript for complex logic |
| Merge data | Merge | Combine data from multiple paths |
| Loop | SplitInBatches | Process items one at a time |
| Wait | Wait | Pause between steps (rate limiting) |
| Filter | Filter | Remove items that don't match |

**Action nodes:**
| Destination | n8n Node | Operations |
|-------------|----------|-----------|
| HubSpot | HubSpot | Create/update contact, company, deal |
| Pipedrive | Pipedrive | Create/update person, organization, deal |
| Salesforce | Salesforce | Create/update any object |
| Slack | Slack | Send message to channel or DM |
| Email | Send Email | SMTP send |
| Google Sheets | Google Sheets | Append row, update row |
| Lemlist | HTTP Request | API call to Lemlist |
| Clay | HTTP Request / Webhook | Trigger Clay table |

### Step 4 — Define Node-by-Node Configuration

For each node in the workflow, specify:

```
Node [#]: [Node Name]
Type: [n8n node type]
Purpose: [What this node does in one sentence]
Configuration:
  - [Setting 1]: [Value]
  - [Setting 2]: [Value]
Input: [What data this node receives — reference previous node output]
Output: [What data this node produces — field names and types]
Connects to: [Next node(s)]
Error handling: [What happens if this node fails]
```

### Step 5 — Define Data Transformations

For each point where data changes shape, document the transformation:

| Input Field | Transformation | Output Field | Node |
|------------|---------------|-------------|------|
| `contact.properties.email` | Direct map | `email` | Set node |
| `company.properties.numberofemployees` | Parse to integer | `employee_count` | Code node |
| `icp_score` | IF >= 80 then "hot" | `lead_tier` | IF node |

Include the exact field paths from API responses (e.g., HubSpot returns `contact.properties.email.value`).

### Step 6 — Define Error Handling

For each node that can fail (HTTP requests, API calls, external services):

| Node | Failure Mode | Handling | Fallback |
|------|-------------|----------|----------|
| HTTP Request (Apollo) | 429 Rate Limited | Wait 60s, retry | Skip enrichment, flag record |
| HubSpot Create | 409 Conflict (duplicate) | Update instead of create | Log error, continue |
| Slack Message | 403 Forbidden | Log error | Send email notification instead |

Design a global error handler:
- Catch unhandled errors
- Log to Google Sheet or error tracking
- Send Slack notification with error details
- Do not silently fail

### Step 7 — Specify Execution Settings

| Setting | Value | Reason |
|---------|-------|--------|
| Timeout | [X seconds] per node | Prevent hanging |
| Retry on fail | [Yes/No, how many times] | Transient error handling |
| Execute once | [Yes/No] | Process all items or just first |
| Batch size | [X] | Rate limit compliance |
| Wait between batches | [X seconds] | Rate limit compliance |

### Step 8 — Quality Gate

Before saving, verify:
- [ ] Every step in the description maps to at least one node
- [ ] Trigger node is defined and appropriate for the use case
- [ ] Data transformations document exact field paths (not generic "map the data")
- [ ] Error handling is defined for every external API call
- [ ] No node produces output that the next node cannot consume (field name mismatches)
- [ ] Rate limiting is addressed for APIs with known limits
- [ ] The workflow can be implemented by reading the spec alone (no ambiguity)

## Output Format

Save to `docs/ops/n8n-workflow-{name-slug}.md`:

```markdown
# n8n Workflow Spec: [Workflow Name]
Date: [Date]
Purpose: [One-sentence description]
Trigger: [What starts the workflow]
Frequency: [How often it runs]

## Workflow Overview
[Diagram-like text showing the flow]
Trigger → Fetch Data → Score → Branch (Hot/Warm/Cold) → Actions

## Node Specifications

### Node 1: [Name]
- **Type:** [n8n node type]
- **Purpose:** [One sentence]
- **Configuration:**
  - [Key]: [Value]
- **Input:** [Source]
- **Output fields:** [List]
- **Connects to:** Node 2
- **On error:** [Handling]

[Repeat for each node]

## Data Flow
| Step | Input Fields | Transformation | Output Fields |
|------|-------------|---------------|--------------|
| 1→2 | ... | ... | ... |

## Error Handling
| Node | Failure | Response | Fallback |
|------|---------|----------|----------|
| ... | ... | ... | ... |

## Global Error Handler
- Catch: [All unhandled errors]
- Log to: [Google Sheet / Error tracker]
- Notify: [Slack channel / Email]

## Execution Settings
- Timeout: [X]s
- Retry: [X] times
- Batch size: [X]
- Wait between batches: [X]s

## Credentials Required
| Service | Credential Type | n8n Credential Name |
|---------|----------------|-------------------|
| ... | API Key / OAuth | ... |

## Testing Steps
1. [How to test trigger]
2. [How to verify each node]
3. [Expected end-to-end result]

## Maintenance Notes
- [Rate limits to monitor]
- [API changes to watch for]
- [Scaling considerations]
```

## Key Principles

1. **Human-readable specs, not JSON exports.** The spec should be implementable by someone looking at n8n's visual editor. Node types, configurations, and connections must be clear enough to build from.
2. **Every external call needs error handling.** APIs fail. Webhooks timeout. Services go down. The spec must define what happens in each failure case.
3. **Field paths must be exact.** "Map the email field" is useless. `contact.properties.email.value` is implementable. Specify the actual data paths.
4. **Rate limiting is not optional.** If the workflow calls Apollo, HubSpot, or any API with rate limits, the spec must include wait/batch logic to stay within limits.
5. **One workflow, one job.** Do not design a workflow that enriches leads AND monitors signals AND syncs CRM data. Split into focused workflows that can be tested independently.

## Anti-Patterns

- **"Generate actual n8n JSON export."** JSON exports are brittle, version-specific, and unreadable. A human-readable spec is more durable and easier to maintain.
- **"Skip error handling, it usually works."** n8n workflows run unattended. Silent failures mean lost data and broken processes. Error handling is mandatory.
- **"Connect 15 nodes in a straight line."** Long linear workflows are hard to debug. Use branches, merge nodes, and sub-workflows to keep complexity manageable. Aim for under 12 nodes per workflow.

## Hard Caps

- Maximum 12 nodes per workflow (split into sub-workflows if more)
- Every HTTP Request node must have error handling defined
- Every API call must specify rate limit compliance
- Credentials listed as placeholders only (never real values)

## Chain Triggers

After completing, suggest:
- "Run **clay-table-designer** to design the Clay table this workflow will trigger"
- "Run **enrichment-waterfall** to define the enrichment sequence for this workflow"
- "Run **signal-monitor-setup** to connect signal detection to this automation"

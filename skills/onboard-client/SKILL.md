---
description: Set up a new client engagement with context file, discovery questions, infra checklist, and timeline
tools: Read, Write, WebFetch, WebSearch
---

# Onboard Client

Set up a new client engagement from scratch. This skill creates the foundational documents needed to kick off a GTM consulting or services engagement: client context file, tailored discovery questionnaire, infrastructure checklist, and project timeline.

The goal is to go from "we just signed a client" to "we're ready for the kickoff call" in one session.

## Inputs

- **Company name** (required) — the client company
- **Company website** (required) — for research and context building
- **Contact name and title** (required) — primary point of contact
- **Engagement scope** (required) — what was sold (e.g., "full GTM build," "outbound system setup," "ICP and messaging work")
- **Engagement duration** (optional) — length of the engagement (default: 3 months)
- **Known context** (optional) — any notes from sales calls, proposals, or prior conversations
- **Industry** (optional) — helps tailor discovery questions

## Steps

### Step 1 — Research the Company

Use WebFetch to scrape the company website. Pull:
- Homepage messaging and positioning
- Product/service description
- Team page (key people, company size signals)
- Case studies or customer logos
- Pricing model if public

Use WebSearch to find:
- Recent news, funding, or press coverage
- LinkedIn company page (employee count, growth trends)
- Competitor landscape
- Industry context and market trends
- G2 or review site presence

### Step 2 — Create Client Context File

Write a structured client context file with all gathered information:

```
# Client: [Company Name]
Date onboarded: [Date]
Website: [URL]

## Company Overview
[2-3 paragraphs summarizing what they do, who they serve, company stage]

## Key Contacts
| Name | Title | Role in Engagement | Email | Notes |
|------|-------|-------------------|-------|-------|

## Engagement Scope
- **Type:** [Full GTM build / Outbound setup / ICP work / etc.]
- **Duration:** [X months]
- **Key deliverables:** [List]
- **Success criteria:** [What "done well" looks like]

## Current State (Pre-Discovery)
- **Positioning:** [What their website says]
- **ICP:** [Who they appear to target]
- **Sales motion:** [Inbound/outbound/PLG/partner — based on observation]
- **Content:** [LinkedIn activity, blog, newsletter — observed]
- **Tech stack:** [Any visible tools]

## Market Context
- **Industry:** [Vertical]
- **Competitors:** [Top 3-5 observed]
- **Market trends:** [Key dynamics]

## Open Questions
[Questions that need answers from the discovery call]
```

### Step 3 — Generate Tailored Discovery Questionnaire

Create a discovery questionnaire customized to the client's industry and engagement scope. The questionnaire should:

- Be organized by topic (company context, customers, sales process, marketing, data/tools, goals)
- Include 20-30 questions total, grouped into 5-6 sections
- Mix factual questions ("What CRM do you use?") with strategic questions ("Which of your current customers would you most want to clone, and why?")
- Include questions that validate or challenge assumptions from Step 1
- Flag which questions are critical (must-answer) vs. nice-to-have

Sections to cover:
1. **Company and Product** — what they sell, how it works, pricing model, key differentiators
2. **Customers and ICP** — best customers, worst customers, why they buy, why they churn
3. **Sales Process** — how deals happen today, cycle length, win/loss reasons, team structure
4. **Marketing and Content** — current channels, what's working, what's been tried
5. **Data and Tools** — CRM, enrichment, sequencing, analytics tools in use
6. **Goals and Priorities** — what success looks like, timeline expectations, constraints

### Step 4 — Create Infrastructure Checklist

Build an infrastructure checklist based on the engagement scope. This covers the technical and operational setup needed:

**Domain and Email:**
- [ ] Verify sending domain (separate from primary domain if doing cold outbound)
- [ ] Set up SPF, DKIM, DMARC records
- [ ] Warm up email domain (if new)
- [ ] Create sender email addresses

**CRM Setup:**
- [ ] Audit current CRM fields and pipeline stages
- [ ] Create custom fields for ICP scoring, signal tracking
- [ ] Set up lead source tracking
- [ ] Define lifecycle stages and handoff rules

**Enrichment and Data:**
- [ ] Select enrichment provider (if not in place)
- [ ] Define enrichment fields needed
- [ ] Set up data hygiene processes
- [ ] Import existing prospect/customer data

**Sequencing and Outbound:**
- [ ] Select sequencing tool (if not in place)
- [ ] Connect to CRM
- [ ] Set up templates and sequence structures
- [ ] Configure sending limits and schedules

**Tracking and Measurement:**
- [ ] Define KPIs and reporting cadence
- [ ] Set up dashboard or reporting template
- [ ] Create tracking sheet for campaign performance
- [ ] Define review meeting cadence

Customize the checklist based on what the engagement actually requires. A messaging-only engagement doesn't need domain setup.

### Step 5 — Draft Project Timeline

Create a phase-based timeline with milestones:

**Phase 1: Discovery and Foundation (Weeks 1-2)**
- Kickoff call
- Discovery questionnaire completion
- Market and competitor research
- Deliverable: ICP draft, initial positioning

**Phase 2: Build (Weeks 3-6)**
- Core deliverables based on engagement scope
- Infrastructure setup
- Sequence writing / content creation / campaign design
- Weekly check-in cadence

**Phase 3: Launch and Iterate (Weeks 7-10)**
- Go-live on campaigns / outbound / content
- Monitor initial results
- Iterate on messaging, targeting, sequences
- Weekly performance reviews

**Phase 4: Optimize and Handoff (Weeks 11-12)**
- Analyze results against success criteria
- Document playbooks for internal team
- Handoff meeting with ongoing recommendations
- Define Phase 2 scope (if applicable)

Adjust timing based on the stated engagement duration and scope.

### Step 6 — Create Folder Structure

Define the recommended folder structure for organizing engagement deliverables:

```
[Client Name]/
├── context/          # Client context file, discovery notes
├── research/         # Market research, competitor analysis
├── deliverables/     # ICP, personas, messaging, sequences
├── campaigns/        # Campaign assets, templates, sequences
├── reporting/        # Performance data, dashboards
└── meetings/         # Meeting notes, call recordings
```

## Output Format

Produce 4 separate documents:

1. **Client context file** — `[client-name]-context.md`
2. **Discovery questionnaire** — `[client-name]-discovery.md`
3. **Infrastructure checklist** — `[client-name]-infra-checklist.md`
4. **Project timeline** — `[client-name]-timeline.md`

## Quality Checks

- The client context file contains actual research, not placeholder text. The "Current State" section should reflect what was observed on their website and online presence.
- Discovery questions are tailored to the industry and scope. A fintech client should get different questions than an HR tech client.
- The infrastructure checklist is scoped to the engagement. Don't include domain setup for a strategy-only engagement.
- The timeline has specific week numbers and deliverables, not vague phase descriptions.
- Open questions from the context file are addressed in the discovery questionnaire.
- All documents use the client's actual company name, not placeholders.

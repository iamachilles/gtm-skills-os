---
name: channel-enablement-kit
description: Build enablement materials for channel partners. Use when someone says "partner enablement", "channel enablement", "partner sales kit", "partner materials", "enable partners", "partner certification", or "partner training"
allowed-tools: Read, Write
metadata:
  author: Achille Morin-Lemoine
  version: "1.0.0"
---

# Channel Enablement Kit

Build a complete enablement kit that gives partners everything they need to sell your product effectively. Includes a partner sales deck, email templates, competitive guide, certification quiz, and deal registration spec.

## Inputs

- **Partner name or type** (required) -- specific partner or partner category (reseller, referral, agency)
- **Product details** (required) -- what you sell, key value props, pricing model
- **Partner context** (optional) -- their sales process, their customers, how they'll position your product
- **Existing materials** (optional) -- sales deck, competitive intel, email templates to adapt

If partner type or product details are missing, ask: "I need to know which partner (or partner type) and your product details to build the enablement kit."

## Steps

### Step 0 -- Check for Existing Output

Search the project for any existing output from a previous run of this skill (check common locations like `docs/`, the project root, or any organized output directory). If a previous version is found, present a summary and ask: "An enablement kit for this partner already exists. Do you want me to (a) update it, (b) add a new section, or (c) rebuild?" 

### Step 1 -- Load Context

Search the project for any available context. Look in the project root, `docs/`, or any organized directory. Read what you find:

1. **GTM Triangle** -- positioning and messaging
2. **Value proposition mapping** -- value props by persona
3. **Battlecards** documents -- competitive intelligence
4. **Sales** documents -- existing sales materials
5. **Partner Program** documents -- partner program structure
6. `CLAUDE.md` -- project-level instructions

### Step 2 -- Create Partner Sales Deck Outline

Adapt your sales deck for the partner's context:

1. **Title slide:** Co-branded or partner-ready
2. **Partner context:** Why the partner recommends this (framed as their expertise)
3. **Customer problem:** Adapted for the partner's audience
4. **Solution overview:** How your product solves it (simplified, not your full feature list)
5. **Proof points:** Case studies and metrics relevant to the partner's customers
6. **How it works:** 3-step process (simple enough for a partner to explain)
7. **Pricing:** Clear, simple tiers or packages
8. **Next steps:** What the partner should propose to their client

Rule: partners won't memorize a 30-slide deck. Keep it under 12 slides with a clear narrative.

### Step 3 -- Write Email Templates

Create 3 email templates partners can send to their clients:

**Template 1: Introduction email**
- Subject line
- Body: positions the partner as the expert introducing a solution
- CTA: book a joint call or demo

**Template 2: Follow-up after interest**
- Subject line
- Body: addresses common questions, includes proof point
- CTA: schedule next step

**Template 3: Re-engagement**
- Subject line
- Body: new trigger or reason to reconsider
- CTA: quick call to discuss changes

Each template should sound like the partner, not like you. Partners won't send emails that feel like vendor marketing.

### Step 4 -- Create Competitive Guide

Build a partner-friendly competitive positioning guide:

For each top 3 competitor:
- **When you'll encounter them:** {scenarios}
- **Their pitch:** {how they position}
- **Our advantage:** {specific differentiator}
- **Talk track:** {what to say in conversation}
- **Trap to set:** {question to ask that highlights their weakness}

Keep each competitor to half a page. Partners need quick reference, not a research paper.

### Step 5 -- Design Certification Quiz

Create 10 multiple-choice questions testing product knowledge:

- Questions 1-3: Product basics (what it does, who it's for)
- Questions 4-6: Value proposition and positioning (how to pitch it)
- Questions 7-8: Competitive differentiation (how to handle objections)
- Questions 9-10: Sales process (deal registration, pricing, next steps)

Each question should have 4 options with one clearly correct answer. Include the answer key.

Passing score: 8/10. Partners who score below should retake after reviewing materials.

### Step 6 -- Create Deal Registration Form Spec

Define the fields for deal registration:

**Required fields:**
- Partner company name
- Partner contact (name, email)
- Prospect company name
- Prospect contact (name, title, email)
- Estimated deal size
- Expected close date
- Current stage

**Protection rules:**
- Registration valid for 90 days (renewable once)
- First-to-register gets protection
- Must update status monthly or protection lapses

### Step 7 -- Quality Gate

- [ ] Sales deck outline is under 12 slides
- [ ] Email templates sound like a partner, not a vendor
- [ ] Competitive guide covers top 3 competitors
- [ ] Certification quiz has 10 questions with answer key
- [ ] Deal registration spec has clear protection rules
- [ ] All materials are adapted for the partner's context, not just copied from internal materials
- [ ] No em dashes in any copy

## Output Format

Save the output to your project. Suggested filename: `partner-enablement-{partner-slug}.md`

```markdown
# Partner Enablement Kit: {Partner Name or Type}

Date: {Date}

## Partner Sales Deck Outline
{Slide-by-slide outline}

## Email Templates

### Template 1: Introduction
**Subject:** {subject line}
{Body with CTA}

### Template 2: Follow-Up
**Subject:** {subject line}
{Body with CTA}

### Template 3: Re-Engagement
**Subject:** {subject line}
{Body with CTA}

## Competitive Guide
### {Competitor 1}
{When, their pitch, our advantage, talk track, trap}
### {Competitor 2}
{Same structure}
### {Competitor 3}
{Same structure}

## Certification Quiz
{10 questions with options and answer key}

## Deal Registration
### Required Fields
{Field list}
### Protection Rules
{Rules and timelines}
```

## Key Principles

1. **Partners are not your sales team.** They have their own products, their own pitch, their own priorities. Enablement materials must fit into their workflow, not replace it.
2. **Simplicity wins.** A partner who can explain your product in 30 seconds will outsell one who memorized your 50-page sales bible. Distill ruthlessly.
3. **Sound like the partner, not the vendor.** Email templates written in your marketing voice will never get sent. Write them in the partner's voice.
4. **Certification drives quality.** Untrained partners create bad customer experiences. A simple quiz ensures baseline competence.
5. **Deal registration protects relationships.** Without clear rules, partners lose deals to your direct team and stop referring. Make protection rules explicit and fair.

## Anti-Patterns

- **The info dump.** Sending partners a 100-page folder of marketing materials. They'll read none of it. Curate the essential 5 assets.
- **Internal-speak in partner materials.** Your internal terminology, acronyms, and product names mean nothing to a partner's client. Translate everything to customer language.

## What to Do Next

- Recruit new partners with a **partner pitch**: `/skill partner-pitch-builder`
- Plan **co-marketing** to help partners promote: `/skill co-marketing-planner`
- Write a **marketplace listing** for integration partners: `/skill marketplace-listing-writer`

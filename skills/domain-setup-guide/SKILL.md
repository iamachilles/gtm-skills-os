---
name: domain-setup-guide
description: Generate email infrastructure plan for cold outbound. Use when someone asks "set up sending domains", "email infrastructure plan", "domain setup for cold email", "how many domains do I need", "warmup schedule", or "DNS records for outbound"
allowed-tools: Read, Write
metadata:
  author: Achille Morin-Lemoine
  version: "1.0.0"
---

# Domain Setup Guide

Generate a complete email infrastructure plan for cold outbound. Calculates the number of domains needed based on volume targets, produces a warmup schedule, DNS records template, and monitoring checklist. This is a planning document, not a live configuration.

## Inputs

- **Number of senders** (required) — how many people will be sending
- **Daily volume target** (required) — total emails per day across all senders
- **Sending tool** (required) — Lemlist, Instantly, Smartlead, or other
- **Primary domain** (required) — the company's main domain (the one you must NOT use for cold email)
- **Budget for domains** (optional) — affects how many domains to recommend vs. consolidate

If any required input is missing, ask for it before proceeding.

## Steps

### Step 0 — Idempotency Check

Check if operations documents exists. If it does, ask: "A domain setup plan already exists. Do you want to refine the existing plan or overwrite it?"

### Step 1 — Load Context

Read these files if they exist:
- ICP document — for understanding the business context
- gtm triangle.md documents — for positioning context
- `CLAUDE.md` — project context

### Step 2 — Calculate Domain Requirements

Apply the **30 emails per domain per day** hard cap:

- `domains_needed = ceil(daily_volume_target / 30)`
- Each domain gets **2 mailboxes** (one per sender rotation, or 2 senders per domain max)
- Each mailbox sends a maximum of **15 emails per day** (not 30 — split across mailboxes)
- Add **20% buffer** — round up to the next whole number of domains

Example: 200 emails/day target = ceil(200/30) = 7 domains, +20% buffer = 9 domains.

### Step 3 — Plan Domain Naming Pattern

Generate domain name variations based on the primary domain. Patterns:

- `{verb}{brand}.com` — e.g., tryharvest.com, getharvest.com, joinharvest.com
- `{brand}{suffix}.com` — e.g., harvesthq.com, harvestapp.com, harvestio.com
- `{brand}-{word}.com` — e.g., harvest-team.com, harvest-mail.com
- Subdomain alternative: `outbound.harvest.com` (less ideal, easier to set up)

Rules:
- Avoid domains that look spammy or unrelated to the brand
- Keep the brand recognizable in each domain
- Recommend `.com` first, `.io` as fallback
- Each domain must have a basic landing page (not a blank page — at minimum a redirect to the primary domain or a simple "About" page)

Generate enough names to cover the calculated domain count plus 2-3 extras.

### Step 4 — Design Warmup Schedule

Create a warmup schedule per domain. Minimum 2 weeks, recommended 3-4 weeks:

| Day Range | Emails/Day/Mailbox | Notes |
|-----------|-------------------|-------|
| Days 1-3 | 2-3 | Send to known contacts only (colleagues, friends) |
| Days 4-7 | 5-7 | Mix of known contacts and opted-in lists |
| Days 8-10 | 8-10 | Start introducing cold contacts at low volume |
| Days 11-14 | 10-12 | Increase cold volume, monitor bounce rates |
| Days 15-21 | 12-15 | Full ramp, monitor spam placement |
| Days 22+ | 15 (cap) | Steady state — do not exceed |

Hard cap: never send more than 15 emails per mailbox per day. If the sending tool has built-in warmup, use it AND supplement with manual warmup sends in week 1.

### Step 5 — Generate DNS Records Template

For each domain, provide the following DNS record specifications:

**SPF Record:**
```
Type: TXT
Host: @
Value: v=spf1 include:{sending-tool-spf} ~all
```

**DKIM Record:**
```
Type: CNAME or TXT
Host: {selector}._domainkey
Value: {provided by sending tool during setup}
```

**DMARC Record:**
```
Type: TXT
Host: _dmarc
Value: v=DMARC1; p=none; rua=mailto:dmarc@{domain}; pct=100
```

**Custom tracking domain (for link tracking):**
```
Type: CNAME
Host: track (or links)
Value: {provided by sending tool}
```

Note: DKIM values are tool-specific. The plan should flag this as "configure during tool setup."

### Step 6 — Define Sending Limits

Create a per-domain, per-mailbox daily limit table:

| Domain | Mailbox 1 | Mailbox 2 | Daily Total | Status |
|--------|-----------|-----------|-------------|--------|
| domain1.com | 15/day | 15/day | 30/day | Warming |
| domain2.com | 15/day | 15/day | 30/day | Warming |

Include a column for status (Warming / Active / Paused / Flagged).

### Step 7 — Create Monitoring Checklist

Weekly monitoring tasks:
- [ ] Check bounce rate per domain (must stay below 3%)
- [ ] Check spam complaint rate (must stay below 0.1%)
- [ ] Verify DNS records still resolve correctly
- [ ] Review sending volume did not exceed daily caps
- [ ] Check warmup tool reports for deliverability scores
- [ ] Test inbox placement (send test emails to Gmail, Outlook, Yahoo)
- [ ] Rotate any domain that exceeds 5% bounce rate for 3 consecutive days

### Step 8 — Quality Gate

Before saving, verify:
- [ ] Domain count matches the volume calculation (with buffer)
- [ ] No plan uses the primary domain for cold email
- [ ] Warmup schedule spans at least 14 days
- [ ] DNS records include SPF, DKIM, and DMARC for every domain
- [ ] Daily limits do not exceed 15 emails per mailbox or 30 per domain
- [ ] Monitoring checklist includes bounce rate and spam rate thresholds
- [ ] Domain names are brand-recognizable, not random strings

## Output Format

Save the output to your project. Suggested filename: `domain-setup.md`

```markdown
# Email Infrastructure Plan
Date: [Date]
Sending Tool: [Tool]
Primary Domain: [domain.com] (DO NOT USE FOR COLD EMAIL)

## Volume Calculation
- Target daily volume: [X] emails/day
- Number of senders: [X]
- Domains needed: [X] (including 20% buffer)
- Mailboxes per domain: 2
- Max per mailbox: 15 emails/day
- Max per domain: 30 emails/day

## Domain Names
| # | Domain | Registrar | Status | Landing Page |
|---|--------|-----------|--------|-------------|
| 1 | [domain] | [TBD] | Not registered | [Redirect to primary] |

## DNS Records (per domain)
[SPF, DKIM, DMARC, tracking domain records]

## Warmup Schedule
[Day-by-day ramp table]

## Sending Limits
[Per-domain, per-mailbox limit table with status column]

## Monitoring Checklist
[Weekly tasks with thresholds]

## Emergency Procedures
- Domain blacklisted: Pause immediately, switch to backup domain, investigate cause
- Bounce rate spike: Reduce volume by 50%, clean list, check DNS records
- Spam complaints: Stop sending from that domain for 48 hours, review copy
```

## Key Principles

1. **Never send cold email from your primary domain.** If your primary domain gets flagged, you lose deliverability for all business communication. This is non-negotiable.
2. **30 emails per domain per day is the hard cap.** Going above this consistently will trigger spam filters. There is no shortcut.
3. **Warmup is not optional.** New domains without warmup land in spam. 14 days minimum, 21 days recommended.
4. **Every domain needs a landing page.** Blank domains look like spam to inbox providers. Even a simple redirect counts.
5. **Monitor weekly or lose domains.** Deliverability degrades silently. By the time you notice replies dropping, the domain may already be burned.

## Anti-Patterns

- **"Just buy 20 domains and start sending tomorrow."** Skipping warmup is the fastest way to burn domains and waste money. No exceptions.
- **"Use random domain names like xk7mail.com."** Domains that don't resemble the brand look like spam to both filters and recipients.
- **"Send 50 emails per mailbox, the tool allows it."** Tool limits are not deliverability limits. The inbox providers set the real cap.

## Hard Caps

- Max 30 emails per domain per day
- Max 15 emails per mailbox per day
- Min 14-day warmup period
- Bounce rate must stay below 3%
- Spam complaint rate must stay below 0.1%

## Chain Triggers

After completing, suggest:
- "Run **deliverability-checker** to verify DNS records are correctly configured"
- "Run **write-outbound-sequence** to create the email sequences for these domains"
- "Run **enrichment-waterfall** to set up the data pipeline that feeds these sequences"

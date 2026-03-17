---
description: Diagnose email deliverability issues for sending domains. Use when someone asks "check deliverability", "email landing in spam", "DNS records check", "domain blacklist", "email warmup status", "deliverability audit", or "why are my emails bouncing"
tools: Read, Write, WebSearch
---

# Deliverability Checker

Diagnose email deliverability for one or more sending domains. Checks DNS records (SPF, DKIM, DMARC), blacklist status, sending volume patterns, and common deliverability killers. Produces a fix-priority report.

## Inputs

- **Sending domains** (required) — list of domains to check (e.g., tryharvest.com, getharvest.com)
- **Sending tool** (optional) — Lemlist, Instantly, Smartlead (for tool-specific DNS values)
- **Current issues** (optional) — symptoms being observed (low open rates, bounces, spam placement)
- **Daily sending volume** (optional) — current emails per day per domain

If no domains are provided, ask for them before proceeding.

## Steps

### Step 0 — Idempotency Check

Check if `docs/ops/deliverability-report.md` exists. If it does, ask: "A deliverability report already exists. Do you want to run a fresh check or update the existing report?"

### Step 1 — Load Context

Read these files if they exist:
- `docs/ops/domain-setup.md` — domain infrastructure plan
- `CLAUDE.md` — project context

### Step 2 — Check SPF Records

For each domain, search for SPF configuration:

Search: `"{domain}" SPF record check`
Search: `site:mxtoolbox.com "{domain}" spf`

Verify:
- SPF record exists (TXT record starting with `v=spf1`)
- Includes the sending tool's SPF (e.g., `include:_spf.google.com`, `include:spf.lemlist.com`)
- Ends with `-all` (hard fail) or `~all` (soft fail, acceptable)
- Does not exceed 10 DNS lookups (SPF lookup limit)
- No duplicate SPF records (only one `v=spf1` record per domain)

Score: Pass / Warn / Fail

### Step 3 — Check DKIM Records

For each domain, verify DKIM:

Search: `"{domain}" DKIM check`
Search: `site:mxtoolbox.com "{domain}" dkim`

Verify:
- DKIM record exists for the sending tool's selector
- Record is properly formatted (CNAME or TXT)
- Key length is at least 1024 bits (2048 recommended)

Score: Pass / Warn / Fail

Note: DKIM selectors are tool-specific. If the sending tool is known, check for that specific selector. If unknown, check common selectors (google, default, selector1, selector2).

### Step 4 — Check DMARC Policy

For each domain, verify DMARC:

Search: `"{domain}" DMARC record`
Search: `site:mxtoolbox.com "{domain}" dmarc`

Verify:
- DMARC record exists at `_dmarc.{domain}`
- Policy is set (`p=none`, `p=quarantine`, or `p=reject`)
- Reporting address is configured (`rua=mailto:...`)
- For cold email domains: `p=none` is acceptable. `p=reject` is ideal but risky during warmup.

Score: Pass / Warn / Fail

### Step 5 — Check Blacklist Status

For each domain, check if listed on major blacklists:

Search: `"{domain}" blacklist check`
Search: `"{domain}" email reputation`
Search: `site:mxtoolbox.com "{domain}" blacklist`

Major blacklists to check:
- Spamhaus (SBL, XBL, PBL)
- Barracuda
- SORBS
- SpamCop
- URIBL
- SURBL

Score: Listed (Critical) / Clean (Pass)

If listed, note which blacklist and the recommended delisting procedure.

### Step 6 — Review Sending Patterns

Based on provided volume data or domain age, assess:

| Factor | Good | Warning | Bad |
|--------|------|---------|-----|
| Daily volume per domain | < 30 | 30-50 | > 50 |
| Warmup status | 3+ weeks | 1-2 weeks | No warmup |
| Sending consistency | Same volume daily | +/- 20% variance | Spikes > 2x normal |
| Bounce rate | < 3% | 3-5% | > 5% |
| Spam complaint rate | < 0.05% | 0.05-0.1% | > 0.1% |

### Step 7 — Identify Common Deliverability Killers

Review for these issues (ask about or infer from context):

**Email Content:**
- [ ] Spammy subject lines (ALL CAPS, excessive punctuation, "free", "act now")
- [ ] Image-heavy emails (over 40% image to text ratio)
- [ ] Missing plain-text version
- [ ] URL shorteners (bit.ly, etc.)
- [ ] Too many links (more than 2 in a cold email)
- [ ] Large attachments

**Technical:**
- [ ] Missing unsubscribe link (required by law for commercial email)
- [ ] Custom tracking domain not configured (using default tracking domain)
- [ ] Reply-to address different from sending address
- [ ] Sending from no-reply@ address for cold outbound

**Behavioral:**
- [ ] Sending same template to entire list (no personalization)
- [ ] No engagement (0% reply rate over sustained period)
- [ ] Sending to unverified lists
- [ ] Not removing bounced contacts

### Step 8 — Produce Fix Recommendations

For each issue found, provide:
- What the problem is
- Why it matters (impact on deliverability)
- Exact fix steps
- Priority (P0: fix immediately, P1: fix this week, P2: fix when possible)

### Step 9 — Quality Gate

Before saving, verify:
- [ ] Each domain has SPF, DKIM, and DMARC check results
- [ ] Blacklist status is checked for each domain
- [ ] Fix recommendations include exact steps, not just "fix your SPF"
- [ ] Priorities are assigned to each recommendation
- [ ] Content issues are addressed (not just DNS)
- [ ] Volume assessment is included if sending data was provided

## Output Format

Save to `docs/ops/deliverability-report.md`:

```markdown
# Email Deliverability Report
Date: [Date]
Domains Checked: [Count]
Overall Status: [Healthy / At Risk / Critical]

## Domain Status Summary
| Domain | SPF | DKIM | DMARC | Blacklist | Volume | Overall |
|--------|-----|------|-------|-----------|--------|---------|
| domain1.com | Pass | Pass | Warn | Clean | OK | Healthy |
| domain2.com | Fail | Pass | Fail | Listed | High | Critical |

## Detailed Findings

### [domain1.com]

**SPF:** [Pass/Warn/Fail]
- Record: `v=spf1 include:... ~all`
- Issues: [None / List issues]

**DKIM:** [Pass/Warn/Fail]
- Selector: [selector name]
- Issues: [None / List issues]

**DMARC:** [Pass/Warn/Fail]
- Record: `v=DMARC1; p=...; rua=...`
- Issues: [None / List issues]

**Blacklist:** [Clean / Listed]
- Listings: [None / Which blacklists]

**Volume Assessment:**
- Daily sends: [X]
- Status: [Within limits / Exceeding limits]

[Repeat for each domain]

## Content & Behavioral Issues
| Issue | Severity | Status |
|-------|----------|--------|
| ... | P0/P1/P2 | Found / Not Found |

## Fix Recommendations (Priority Order)
### P0 — Fix Immediately
1. [Issue]: [Exact fix steps]

### P1 — Fix This Week
1. [Issue]: [Exact fix steps]

### P2 — Fix When Possible
1. [Issue]: [Exact fix steps]

## Re-Check Schedule
- Re-check after fixes: [Date]
- Routine check cadence: [Monthly recommended]
```

## Key Principles

1. **DNS is the foundation.** SPF, DKIM, and DMARC must all be correctly configured before any other deliverability optimization matters. Fix DNS first.
2. **Blacklists are emergencies.** A blacklisted domain means emails are not being delivered. Pause sending and delist immediately.
3. **Volume spikes kill domains.** Going from 10 emails/day to 100 in one day is a spam signal. Ramp gradually, always.
4. **Content matters as much as infrastructure.** Perfect DNS with spammy content still lands in spam. Check both.
5. **Deliverability is ongoing, not one-time.** Check monthly at minimum. Things change: blacklists update, DNS records expire, sending patterns shift.

## Anti-Patterns

- **"DNS looks fine, the problem must be something else."** DNS issues are the most common deliverability killer. Check them first and check them thoroughly.
- **"Just buy new domains when old ones get burned."** This treats the symptom, not the cause. Diagnose why the domain was burned before replacing it.
- **"Our open rates dropped but we did not change anything."** Deliverability is not static. Inbox providers change algorithms, blacklists update, and domain reputation decays with volume changes.

## Chain Triggers

After completing, suggest:
- "Run **domain-setup-guide** to plan replacement domains if any are beyond repair"
- "Run **write-outbound-sequence** to review email copy for deliverability issues"

---
description: "Validate and clean an email list with format checks, risk scoring, and deliverability flags. Trigger: 'validate emails', 'clean email list', 'check these emails', 'email list hygiene', 'email validation'"
tools: Read, Write
---

# Email Validator

Validate and clean an email list using logic-based checks. This skill does not send verification emails or ping mail servers. It applies format validation, pattern detection, and risk scoring to flag problematic addresses before you send. The output is a cleaned list with risk scores and recommendations. Nothing is deleted. Everything is flagged for the user to decide.

## Inputs

- **Email list** (required) — pasted emails, CSV, or file path containing email addresses
- **Context** (optional) — where the list came from (purchased list, event signups, CRM export, scraped)
- **Risk tolerance** (optional) — "strict" (flag aggressively) or "permissive" (flag only obvious issues). Default: strict

If the email list is missing, ask: "Please provide the email list to validate. Paste the emails, provide a CSV, or point me to a file."

## Steps

### Step 0 — Idempotency Check

Check if `docs/prospects/validated-emails.md` already exists. If it does, ask: "A validated email list already exists. Should I overwrite it or save with a different name?"

### Step 1 — Load Context

Read available context:
- `CLAUDE.md` — project instructions

No ICP or GTM context needed for this skill. It is pure data validation.

### Step 2 — Parse and Deduplicate

- Extract all email addresses from the input
- Normalize to lowercase
- Remove exact duplicates
- Count total input vs. unique emails
- Flag any entries that are not valid email format

### Step 3 — Format Validation

Check each email against format rules:

| Check | Rule | Flag |
|-------|------|------|
| Basic format | Must contain exactly one @ with text before and after | Invalid |
| Domain format | Domain must have at least one dot, valid TLD | Invalid |
| Local part length | Must be 1-64 characters | Invalid |
| Domain length | Must be 1-253 characters | Invalid |
| Allowed characters | Local part: letters, numbers, dots, hyphens, underscores, plus signs | Invalid |
| No spaces | No whitespace anywhere in the address | Invalid |
| No consecutive dots | No ".." in local part or domain | Invalid |

### Step 4 — Pattern Detection

Flag emails matching risky patterns:

**Obvious fakes:**
- test@, demo@, example@, fake@, asdf@, xxx@
- Emails at example.com, test.com, mailinator.com, guerrillamail.com (known disposable domains)

**Role-based addresses:**
- info@, sales@, support@, hello@, contact@, team@, admin@, billing@, marketing@
- These go to shared inboxes, not individuals. Higher bounce risk and lower engagement.

**Generic patterns:**
- Single letter local parts (a@, b@)
- Initials-only patterns (ab@, jd@) — may be valid but higher risk
- All-numeric local parts (123@, 456789@)

**Catch-all domain indicators:**
- Multiple emails at the same domain with very different naming patterns
- Known catch-all domains (if recognizable)

### Step 5 — Risk Scoring

Assign each email a risk score:

| Risk Level | Criteria | Recommendation |
|------------|----------|---------------|
| Safe | Valid format, personal address, recognized domain | Send |
| Low Risk | Valid format, minor pattern flag (e.g., initials-only) | Send with monitoring |
| Medium Risk | Role-based address or unusual pattern | Review before sending |
| High Risk | Disposable domain, obvious fake, or multiple red flags | Do not send |
| Invalid | Failed format validation | Remove |

### Step 6 — Domain Analysis

Group emails by domain and note:
- Number of emails per domain
- Domain type (corporate, free email provider, educational, government)
- Free email providers (gmail.com, yahoo.com, hotmail.com, outlook.com) — may indicate personal rather than business emails
- Domains with suspiciously many contacts (may indicate scraped or purchased data)

### Step 7 — Quality Gate

Before saving, verify:
- [ ] Every email has a risk score assigned
- [ ] No emails were deleted — only flagged
- [ ] Format validation caught all obvious formatting issues
- [ ] Role-based addresses are identified and flagged
- [ ] Disposable email domains are flagged
- [ ] Domain analysis summary is included
- [ ] Duplicate count is reported
- [ ] Recommendations are actionable

If any check fails, fix before proceeding.

## Output Format

Save to `docs/prospects/validated-emails.md`:

```
# Email Validation Report
Date: {date}
Source: {where the list came from}
Risk tolerance: {strict|permissive}

## Summary
- Total emails received: {count}
- Duplicates removed: {count}
- Unique emails: {count}
- Valid (Safe + Low Risk): {count} ({percentage}%)
- Needs review (Medium Risk): {count} ({percentage}%)
- Do not send (High Risk): {count} ({percentage}%)
- Invalid format: {count} ({percentage}%)
- Role-based addresses: {count}

## Validated List

### Safe ({count})
| # | Email | Domain Type | Notes |
|---|-------|-------------|-------|
| 1 | {email} | Corporate | — |

### Low Risk ({count})
| # | Email | Domain Type | Flag | Notes |
|---|-------|-------------|------|-------|
| 1 | {email} | Corporate | Initials-only pattern | May be valid, monitor bounce |

### Medium Risk — Review Before Sending ({count})
| # | Email | Domain Type | Flag | Notes |
|---|-------|-------------|------|-------|
| 1 | {email} | Corporate | Role-based (info@) | Goes to shared inbox |

### High Risk — Do Not Send ({count})
| # | Email | Flag | Reason |
|---|-------|------|--------|
| 1 | {email} | Disposable domain | mailinator.com is a throwaway service |

### Invalid — Remove ({count})
| # | Email | Issue |
|---|-------|-------|
| 1 | {text} | Missing @ symbol |

## Domain Analysis

| Domain | Count | Type | Notes |
|--------|-------|------|-------|
| {domain} | {n} | Corporate | — |
| gmail.com | {n} | Free provider | Personal emails, not business |

## Recommendations
- {What to do with each risk tier}
- {Whether the overall list quality suggests a hygiene issue}
- {Recommended verification services for medium-risk emails}
```

## Key Principles

1. **Flag, don't delete.** This skill identifies problems but never removes emails from the list. The user decides what to act on.
2. **Logic only, no server checks.** This skill cannot verify if a mailbox exists. It catches format issues, pattern risks, and known-bad domains. For server-level validation, recommend a verification service.
3. **Role-based is not invalid.** info@ addresses are deliverable but go to shared inboxes. Flag them as medium risk, don't mark them as invalid.
4. **Context matters.** A list from event signups has different risk profiles than a purchased list. Use the source context to calibrate flagging.
5. **Conservative scoring.** When in doubt, flag for review rather than marking as safe. A bounced email damages sender reputation.

## Anti-Patterns

- **The Auto-Deleter:** Removing emails from the list without user confirmation. This skill flags. The user decides.
- **The False Verifier:** Claiming an email "is valid" or "will deliver" based on format alone. Format validity does not guarantee deliverability.
- **The Over-Flagger:** Marking every non-corporate email as high risk. Gmail addresses can be legitimate business contacts. Score based on patterns, not just domain type.

## Hard Caps

- Never claim an email is verified or deliverable. This skill checks format and patterns only.
- Never delete or remove emails from the list. Flag and recommend.
- Never attempt to send test emails or ping mail servers.

## Next Skills

- List validated? Load the safe and low-risk emails into your sequencing tool.
- Need to find replacement contacts for invalid emails? Run **contact-finder** for those companies.
- Ready to send? Run **deliverability-checker** to verify your sending infrastructure first.

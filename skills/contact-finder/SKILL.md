---
description: "Find the right contacts at target accounts with buying committee mapping. Trigger: 'find contacts at', 'who should I reach out to at', 'find decision makers', 'build contact list'"
tools: Read, Write, WebSearch
---

# Contact Finder

Find the right people at target companies by mapping the buying committee, searching for individuals in each role, and gathering contact information. Every contact is mapped to their buying committee role so outreach can be tailored to their perspective.

## Inputs

- **Company list** (required) — one or more company names to find contacts at
- **Target roles** (required) — titles or functions to search for (e.g., "VP Sales, Head of Revenue Operations, CRO")
- **Buying committee definition** (optional) — if not provided, check docs/gtm-triangle.md for persona definitions
- **Number of contacts per company** (optional) — default: 3-5

If the company list is missing, ask: "Which companies should I find contacts at? Provide names, a file, or a list."
If target roles are missing, ask: "What roles or titles should I look for? (e.g., VP Sales, Director of Marketing)"

## Steps

### Step 0 — Idempotency Check

For each company, check if `docs/prospects/contacts-{company-slug}.md` already exists. If it does, ask whether to update or skip that company.

### Step 1 — Load Context

Read available context:
- `docs/gtm-triangle.md` — for persona definitions and buying committee roles
- `docs/icp.md` — for qualifying criteria
- `CLAUDE.md` — project instructions

### Step 2 — Define the Buying Committee

For each company, define the buying committee structure:
- **Decision Maker** — who signs off (typically C-level or VP)
- **Champion** — who drives the initiative internally (typically Director or Sr. Manager)
- **Influencer** — who shapes the decision with technical or operational input
- **Blocker** — who could veto (legal, procurement, IT security)
- **End User** — who will use the solution daily

Map the provided target roles to these buying committee positions.

### Step 3 — Search for Contacts

For each company and each target role, search using WebSearch:

**Primary searches:**
- `site:linkedin.com/in "{company}" "{role title}"`
- `site:linkedin.com/in "{company}" "{title variation}"`
- `"{company}" "{role title}" site:linkedin.com`

**Secondary searches (if primary yields no results):**
- `"{company}" team leadership`
- `"{company}" "{department}" director OR VP OR head`
- `"{company}" about us team`

**Title variations to try:**
- VP Sales / VP of Sales / Vice President Sales / Head of Sales
- Director Marketing / Director of Marketing / Marketing Director
- Include common seniority variants (Senior, Lead, Principal)

### Step 4 — Gather Contact Information

For each identified contact:
- Full name
- Current title (verified as current, not a past role)
- LinkedIn profile URL
- Email pattern (search: "{company domain} email format", "email {first name} {last name} {company}")
- Time in current role (if visible from LinkedIn search results)
- Recent activity (posts, articles, speaking, job change)

### Step 5 — Map to Buying Committee

Assign each contact to their buying committee role:

| Contact | Title | Committee Role | Why |
|---------|-------|---------------|-----|
| {name} | CRO | Decision Maker | Controls budget for revenue tools |
| {name} | Director RevOps | Champion | Operationally owns the process |
| {name} | Sales Manager | End User | Will use the tool daily |

### Step 6 — Quality Gate

Before saving, verify:
- [ ] Each company has at least 2 contacts identified
- [ ] No email addresses were guessed or fabricated
- [ ] Email patterns are only listed when the pattern is confirmed from a source
- [ ] Each contact is mapped to a buying committee role
- [ ] LinkedIn URLs point to real profile paths (format: linkedin.com/in/{slug})
- [ ] No contacts from prior roles listed as current

If any check fails, fix before proceeding.

## Output Format

Save to `docs/prospects/contacts-{company-slug}.md` (one file per company):

```
# Contacts: {Company Name}
Date: {date}
Website: {url}
Total contacts found: {count}

## Buying Committee Map

| Role | Contact | Title | LinkedIn | Email Pattern | Confidence |
|------|---------|-------|----------|--------------|------------|
| Decision Maker | {name} | {title} | {url} | {pattern or "Not found"} | {H/M/L} |
| Champion | {name} | {title} | {url} | {pattern or "Not found"} | {H/M/L} |
| Influencer | {name} | {title} | {url} | {pattern or "Not found"} | {H/M/L} |

## Contact Details

### {Contact Name}
- **Title:** {current title}
- **Committee role:** {Decision Maker / Champion / Influencer / etc.}
- **LinkedIn:** {url or "Not found"}
- **Email pattern:** {first.last@domain or "Not found"}
- **Time in role:** {estimate or "Unknown"}
- **Recent activity:** {relevant posts, job change, speaking, or "None found"}
- **Outreach note:** {what to reference when reaching out}

[Repeat for each contact]

## Gaps
- {Roles not yet filled and suggestions for finding them}
```

## Key Principles

1. **Never guess email addresses.** Use known patterns ({first}.{last}@domain) only when the pattern is confirmed from a verifiable source. Otherwise mark as "Not found."
2. **Verify currency.** A contact's LinkedIn result from 2023 may show a role they no longer hold. Look for signals that the role is current.
3. **Map before you search.** Define the buying committee first, then search for people to fill each role. This prevents a list of random names with no strategic value.
4. **Fewer, better contacts.** 3 well-mapped contacts with committee roles beat 10 names with no context.

## Anti-Patterns

- **The Email Guesser:** Constructing email addresses from name + domain without verifying the company's email pattern. "Not found" is always better than a bounce.
- **The Title Collector:** Finding 8 people at a company without mapping any of them to buying committee roles. Names without roles are not actionable.
- **The Stale Profiler:** Listing someone as "VP Sales at {company}" based on a 2-year-old search result without checking if they still hold the role.

## Next Skills

- Contacts mapped? Run **write-outbound-sequence** with the champion or decision maker as the persona.
- Need more companies? Run **lookalike-finder** to expand the account list.
- Want to validate emails before sending? Run **email-validator** on the collected addresses.

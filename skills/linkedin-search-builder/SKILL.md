---
description: "Convert ICP criteria into Sales Navigator search configurations and boolean strings. Trigger: 'build LinkedIn searches', 'Sales Navigator filters', 'boolean search for LinkedIn', 'search config for Sales Nav'"
tools: Read, Write
---

# LinkedIn Search Builder

Translate ICP criteria into ready-to-use LinkedIn Sales Navigator search configurations. This includes filter settings, boolean search strings for title and keyword searches, and recommendations for saved search strategy. No WebSearch needed. This is pure logic translation from ICP to platform filters.

## Inputs

- **ICP criteria** (required) — industry, company size, geography, target titles, keywords, seniority level
- **Search type** (optional) — "lead search" (find people) or "account search" (find companies) or "both". Default: both
- **Platform** (optional) — "Sales Navigator" or "LinkedIn basic". Default: Sales Navigator

If ICP criteria are missing, check `docs/icp.md`. If that does not exist, ask: "What ICP criteria should I translate into LinkedIn searches? I need: target titles, industry, company size, geography, and any qualifying keywords."

## Steps

### Step 0 — Idempotency Check

Check if `docs/prospects/linkedin-searches.md` already exists. If it does, ask: "LinkedIn search configs already exist. Should I overwrite or append new searches?"

### Step 1 — Load Context

Read available context:
- `docs/icp.md` — ICP criteria to translate
- `docs/gtm-triangle.md` — positioning context for keyword selection
- `CLAUDE.md` — project instructions

### Step 2 — Map ICP to Filters

Translate each ICP dimension to the corresponding Sales Navigator filter:

| ICP Dimension | Sales Nav Filter | Notes |
|---------------|-----------------|-------|
| Industry | Industry filter | Use LinkedIn's industry taxonomy, not custom labels |
| Company size | Company headcount | Ranges: 1-10, 11-50, 51-200, 201-500, 501-1000, 1001-5000, 5001-10000, 10001+ |
| Geography | Geography filter | Country, region, or metro area |
| Target titles | Title filter + boolean | Use boolean for complex title matching |
| Seniority | Seniority level | Owner, CXO, VP, Director, Manager, Senior, Entry |
| Department | Function filter | Sales, Marketing, Operations, IT, HR, Finance, etc. |
| Keywords | Keywords filter | Technologies, methodologies, certifications |
| Company type | Company type | Public, Private, Nonprofit, etc. |

### Step 3 — Build Boolean Strings

Create boolean search strings for the title field:

**Rules for LinkedIn boolean:**
- Use `OR` between title variations: `"VP Sales" OR "VP of Sales" OR "Head of Sales"`
- Use `AND` to combine required terms: `"Marketing" AND "Director"`
- Use `NOT` to exclude: `NOT "Assistant" NOT "Intern"`
- Use quotation marks for exact phrases: `"Revenue Operations"`
- Parentheses for grouping: `("VP" OR "Director") AND ("Sales" OR "Revenue")`
- LinkedIn boolean has a ~500 character limit per field

**Build strings for each persona in the ICP:**
- Primary persona title boolean
- Secondary persona title boolean (if applicable)
- Keyword boolean (for the Keywords filter)

### Step 4 — Design Saved Search Strategy

Recommend how to organize saved searches:

- **By persona:** One saved search per buying committee role
- **By geography:** Split large geographic targets into separate searches
- **By signal:** One search with "Changed jobs in past 90 days" filter for warm leads
- **Account list vs. lead list:** When to use each approach

**Recommended saved searches:**
1. {Persona 1} at {ICP companies} in {geography}
2. {Persona 2} at {ICP companies} in {geography}
3. {Any persona} who changed jobs recently at {ICP companies}

### Step 5 — Quality Gate

Before saving, verify:
- [ ] Boolean strings use correct syntax (OR, AND, NOT, quotes, parentheses)
- [ ] Boolean strings are under 500 characters each
- [ ] Company size ranges match LinkedIn's available options
- [ ] Industry names match LinkedIn's taxonomy (not custom terms)
- [ ] Seniority levels use LinkedIn's options (not custom labels)
- [ ] Each search has a clear name and purpose

If any check fails, fix before proceeding.

## Output Format

Save to `docs/prospects/linkedin-searches.md`:

```
# LinkedIn Sales Navigator Search Configs
Date: {date}
ICP: {one-line summary}
Total saved searches recommended: {count}

## Filter Summary

| Filter | Value |
|--------|-------|
| Industry | {industries} |
| Company size | {ranges} |
| Geography | {regions} |
| Seniority | {levels} |
| Function | {departments} |

## Boolean Strings

### Persona 1: {Role Name}
**Title boolean:**
```
{boolean string}
```
**Keyword boolean:**
```
{boolean string}
```
**Expected results:** {estimate: broad/medium/narrow}

### Persona 2: {Role Name}
[Same format]

## Saved Search Configs

### Search 1: {Descriptive Name}
- **Type:** Lead search / Account search
- **Filters:** {list each filter and its value}
- **Boolean:** {which boolean to paste in title field}
- **Purpose:** {what this search finds}
- **Recommended frequency:** {how often to check new results}

### Search 2: {Descriptive Name}
[Same format]

## Tips
- {Platform-specific advice for getting better results}
- {How to combine with account lists}
- {When to broaden vs. narrow filters}
```

## Key Principles

1. **Use LinkedIn's taxonomy.** Industry names, seniority levels, and company size ranges must match what LinkedIn actually offers. Custom labels will not work as filters.
2. **Boolean under 500 characters.** LinkedIn silently truncates long boolean strings. Keep each string under 500 characters. Split into multiple searches if needed.
3. **One persona per search.** Mixing multiple personas in one search makes results noisy. Create separate saved searches for each buying committee role.
4. **Include title variations.** "VP Sales" and "Vice President of Sales" are different strings. Boolean must cover all common variations.

## Anti-Patterns

- **The Mega-Boolean:** Writing a 2000-character boolean string that LinkedIn will silently truncate, producing unreliable results. Keep it under 500 characters.
- **The Custom Taxonomist:** Using industry labels like "RevTech" or "Sales Enablement" that don't exist in LinkedIn's filter options. Always use LinkedIn's actual industry list.

## Next Skills

- Searches built? Run them in Sales Navigator, then use **contact-finder** to research the best results.
- Need to enrich the contacts you find? Run **lead-enricher** on your exported list.
- Ready to reach out? Run **write-outbound-sequence** for the top leads.

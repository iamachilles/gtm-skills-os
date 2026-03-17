---
description: Design multi-persona outreach at the same account with coordinated timing. Use when someone says "multi-thread", "multi-threading", "buying committee outreach", "account-based sequence", "surround the account", or "contact multiple stakeholders"
tools: Read, Write
---

# Multi-Thread Sequence

Design coordinated outreach to 3-5 contacts within the same account, each receiving role-specific messaging with orchestrated timing. Multi-threading increases deal velocity because when your Champion goes to their boss, that boss has already seen your name. This isn't coincidence. It's choreography.

Chains from: buying-committee-mapper. If you've already mapped the buying committee, this skill turns that map into action.

## Inputs

- **Account info** (required) -- company name, industry, size, key signals
- **Buying committee** (required) -- 3-5 contacts with roles: Champion, Economic Buyer, Technical Evaluator, End User, Blocker
- **Value proposition** (required) -- what you offer and why it matters to this account
- **Proof points** (optional) -- relevant case studies or results
- **Existing engagement** (optional) -- any prior contact or signals from this account

If account or buying committee is missing, ask: "I need the account details and at least 3 buying committee members with their roles. Do you have docs/buying-committees/{account-slug}.md, or should I run buying-committee-mapper first?"

## Steps

### Step 0 -- Check for Existing Output

Read `docs/sequences/multi-thread-{account-slug}.md` if it exists. If found, present a summary and ask: "A multi-thread sequence for this account already exists covering [N] contacts. Do you want me to (a) add new contacts, (b) update messaging, or (c) rebuild from scratch?"

### Step 1 -- Load Context

Read all available context:

1. `docs/buying-committees/{account-slug}.md` -- buying committee mapping
2. `docs/personas/*.md` -- persona profiles for each role
3. `docs/messaging-matrix.md` -- role-specific messaging
4. `docs/sales-narratives.md` -- narrative framing
5. `CLAUDE.md` -- project-level instructions

For each contact, identify:
- Their role in the buying process (Champion, Economic Buyer, etc.)
- The value pillar that resonates most with their KPIs
- The messaging angle from the matrix that fits their pain points

### Step 2 -- Assign Role-Specific Messages

For each contact in the buying committee, write a tailored first-touch message:

**Champion:** Lead with the problem and how you solve it. This person needs to see themselves as the internal advocate. Give them the language to sell internally.

**Economic Buyer:** Lead with business impact and ROI. Keep it strategic. They don't care about features. They care about revenue, cost, and risk.

**Technical Evaluator:** Lead with credibility and proof. Reference architecture, integrations, or technical results. They need to believe it works before anything else.

**End User:** Lead with ease and impact on their daily work. How does this make their job easier? What do they stop doing?

**Blocker (if identified):** Lead with risk mitigation. Address their likely objection head-on. Acknowledge what could go wrong and how you prevent it.

Each message follows the cold email rules: under 120 words, specific subject line, one CTA.

### Step 3 -- Design Timing Orchestration

Map the sequence timing:

**Week 1:**
- Day 1: Champion gets first touch (always first)
- Day 3: End User or Technical Evaluator gets first touch

**Week 2:**
- Day 5: Second contact to Champion (follow-up)
- Day 7: Economic Buyer gets first touch
- Day 8: Second contact to Technical Evaluator

**Week 3:**
- Day 10: Third contact to Champion
- Day 12: Second contact to Economic Buyer
- Day 14: Blocker gets first touch (if applicable)

Spacing rules:
- Never contact two people at the same company on the same day
- Leave at least 2 days between touches to different contacts
- The Champion always gets contacted first and most frequently
- The Economic Buyer gets contacted after the Champion has had 1-2 touches

### Step 4 -- Define Escalation Rules

Write escalation logic:

1. If Champion responds positively: coordinate with Champion on how to bring in other stakeholders. Adjust outreach to align with their internal process.
2. If Champion doesn't respond after Touch 3: engage Economic Buyer directly with a strategic angle. Reference the problem, not the Champion.
3. If Technical Evaluator has concerns: pause other threads. Address technical objections before continuing.
4. If Economic Buyer engages before Champion: update Champion messaging to reference "conversations with your team."
5. If Blocker surfaces objections: share objection-handling content with Champion to help them navigate internally.

### Step 5 -- Quality Gate

Run these checks before saving:

- [ ] Champion is contacted first. No exceptions.
- [ ] No two contacts at the same account are contacted on the same day
- [ ] Each contact's message is tailored to their specific role and pain points
- [ ] Messages don't look coordinated from the outside (different angles, not the same template)
- [ ] Escalation rules cover all 5 scenarios
- [ ] Each message is under 120 words
- [ ] Subject lines are role-specific, not account-generic
- [ ] No em dashes in any copy

If any check fails, fix it before proceeding.

## Output Format

Save to `docs/sequences/multi-thread-{account-slug}.md`:

```markdown
# Multi-Thread Sequence: {Account Name}
Date: {Date}
Industry: {Industry}
Contacts: {N}

## Buying Committee
| Contact | Role | Title | Primary Pain Point | Value Pillar |
|---------|------|-------|--------------------|-------------|
| {Name} | Champion | {Title} | {Pain} | {Pillar} |
| {Name} | Economic Buyer | {Title} | {Pain} | {Pillar} |
| {Name} | Technical Evaluator | {Title} | {Pain} | {Pillar} |

## Timing Orchestration
| Day | Contact | Channel | Touchpoint | Purpose |
|-----|---------|---------|------------|---------|
| 1 | {Champion} | Email | Touch 1 | Open the conversation |
| 3 | {Tech Eval} | Email | Touch 1 | Establish credibility |
| 5 | {Champion} | LinkedIn | Touch 2 | Follow up |
[Continue for full sequence]

## Messages by Contact

### {Champion Name} -- Champion
#### Touch 1 (Day 1)
**Subject:** {subject}
**Body:** {full email}

#### Touch 2 (Day 5)
**Subject:** {subject}
**Body:** {full email}

[Continue for each contact]

## Escalation Rules
1. **Champion responds positively:** {action}
2. **Champion unresponsive after Touch 3:** {action}
3. **Technical concerns surface:** {action}
4. **Economic Buyer engages first:** {action}
5. **Blocker raises objections:** {action}

## Internal Notes
- Signals that triggered this outreach: {signals}
- Account priority tier: {tier}
- Overlap with other accounts: {notes}
```

## Key Principles

1. **The Champion gets contacted first. Always.** They are your internal advocate. Reaching the Economic Buyer before the Champion has context undermines your position.
2. **Coordination, not duplication.** Each contact gets a role-specific message. If they compare notes, it should look like you understand each person's unique perspective, not like you blasted the entire team.
3. **Timing creates internal awareness.** When the Champion mentions your name and the Economic Buyer has already seen an email from you, that's not luck. That's orchestration.
4. **Escalation is not aggression.** Moving to the Economic Buyer after Champion silence is a strategic decision, not a threat. The messaging should reflect that.

## Anti-Patterns

- **Same message to everyone.** If you're sending the same email to three people at the same company, you're spamming, not multi-threading.
- **Contacting everyone on the same day.** This makes it obvious you're running a playbook. Space it out so it looks organic.
- **Skipping the Champion.** Going straight to the Economic Buyer signals you don't understand how decisions get made. Start with the Champion.

## What to Do Next

- Map the **buying committee** if not done yet: `/skill buying-committee-mapper`
- Write **individual cold emails** for each role: `/skill cold-email-writer`
- Prepare **reply templates** for each scenario: `/skill reply-handler`

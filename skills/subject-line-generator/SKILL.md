---
name: subject-line-generator
description: Generate 10 subject line variants across 5 categories with A/B test pairings. Use when someone says "subject lines", "email subject", "subject line ideas", "subject line test", "A/B test subjects", or "improve open rates"
allowed-tools: Read, Write
metadata:
  author: Achille Morin-Lemoine
  version: "1.0.0"
---

# Subject Line Generator

Generate 10 subject line variants across 5 categories, paired into A/B test sets with a recommended top 3. Subject lines are the single highest-leverage element in email outreach. A 20% improvement in open rate compounds across every email in the sequence.

## Inputs

- **Email topic** (required) -- what the email is about (pain point, offer, insight)
- **Persona** (required) -- who is receiving this email (title, industry)
- **Existing subject lines** (optional) -- current subject lines and their performance data
- **Brand constraints** (optional) -- words or phrases to avoid

If email topic or persona is missing, ask: "I need the email topic and target persona to generate subject lines. What is the email about and who is receiving it?"

## Steps

### Step 0 -- Check for Existing Output

Search the project for any existing output from a previous run of this skill (check common locations like `docs/`, the project root, or any organized output directory). If a previous version is found, present a summary and ask: "Subject lines for this topic already exist. Do you want me to (a) generate fresh variants, (b) refine existing ones, or (c) rebuild from scratch?" 

### Step 1 -- Load Context

Search the project for any available context. Look in the project root, `docs/`, or any organized directory. Read what you find:

1. **Persona profiles** -- persona language and priorities
2. **Messaging matrix** -- messaging angles for this persona
3. **Persona profiles** -- existing emails for alignment
4. `CLAUDE.md` -- project-level instructions

Identify the persona's language patterns. Subject lines that use the reader's words get opened.

### Step 2 -- Generate 10 Subject Lines Across 5 Categories

Write 2 subject lines per category:

**Question-Based (2)**
- Ask something the persona would want to answer
- Must be relevant to their role, not generic
- Example pattern: "{pain point}?" or "still doing {manual process}?"

**Curiosity Gap (2)**
- Create a gap between what they know and what they want to know
- Don't be clickbaity. The gap must be honest and deliverable.
- Example pattern: "{company}'s {metric} problem" or "the {topic} most teams miss"

**Specificity (2)**
- Use a specific number, name, or data point
- Specificity signals research and relevance
- Example pattern: "{X}% of {role}s miss this" or "{number} {things} about {topic}"

**Social Proof (2)**
- Reference a result, company, or peer
- Must be believable and relevant to their industry
- Example pattern: "how {similar company} solved {problem}" or "{company} cut {metric} by {X}%"

**Direct Benefit (2)**
- State the outcome clearly with no ambiguity
- Lead with what they get, not what you do
- Example pattern: "cut {process} time in half" or "stop losing {thing}"

### Step 3 -- Apply Rules to All Subject Lines

Check every subject line against these hard caps:
- 2-6 words each
- All lowercase
- No emojis
- No ALL CAPS
- No exclamation marks
- No clickbait or false urgency ("urgent," "last chance," "don't miss")
- No spam trigger words ("free," "guaranteed," "act now")

Rewrite any that violate these rules.

### Step 4 -- Pair into A/B Test Sets

Create 5 A/B test pairs, one from each category:

- **Test 1:** Question vs. Curiosity Gap
- **Test 2:** Specificity vs. Social Proof
- **Test 3:** Direct Benefit vs. Question
- **Test 4:** Social Proof vs. Direct Benefit
- **Test 5:** Curiosity Gap vs. Specificity

For each pair, explain what you're testing and what the result would tell you.

### Step 5 -- Recommend Top 3

Select the 3 strongest subject lines and explain why:

1. **Best for cold outreach** -- which subject line works best when the prospect doesn't know you
2. **Best for warm follow-up** -- which works best when they've had prior exposure
3. **Best for A/B testing first** -- which pair should be tested first to learn the most

### Step 6 -- Quality Gate

Run these checks before saving:

- [ ] All 10 subject lines are 2-6 words
- [ ] All subject lines are lowercase
- [ ] No emojis, ALL CAPS, or exclamation marks
- [ ] No two subject lines are just rephrased versions of each other
- [ ] Each category has exactly 2 subject lines
- [ ] A/B test pairs compare different categories (not variants within the same category)
- [ ] Top 3 recommendations include rationale
- [ ] No em dashes in any copy

If any check fails, fix it before proceeding.

## Output Format

Save the output to your project. Suggested filename: `subject-lines-{topic-slug}.md`

```markdown
# Subject Lines: {Topic}
Date: {Date}
Persona: {Persona Title}

## All Subject Lines

### Question-Based
1. {subject line}
2. {subject line}

### Curiosity Gap
3. {subject line}
4. {subject line}

### Specificity
5. {subject line}
6. {subject line}

### Social Proof
7. {subject line}
8. {subject line}

### Direct Benefit
9. {subject line}
10. {subject line}

## A/B Test Pairs

### Test 1: Question vs. Curiosity Gap
- A: {subject line}
- B: {subject line}
- **Testing:** Does a direct question or an information gap drive more opens?

### Test 2: Specificity vs. Social Proof
- A: {subject line}
- B: {subject line}
- **Testing:** Does data or peer validation create more urgency to open?

[Continue for all 5 tests]

## Top 3 Recommendations
1. **Best for cold outreach:** "{subject line}" -- {rationale}
2. **Best for warm follow-up:** "{subject line}" -- {rationale}
3. **Best A/B test to run first:** {pair} -- {rationale}

## Testing Protocol
- Minimum sample size: 100 sends per variant
- Primary metric: open rate
- Secondary metric: reply rate (to catch misleading opens)
- Test duration: run until both variants hit 100 sends
- Winner becomes control for next test
```

## Key Principles

1. **Subject lines earn the open, nothing more.** Don't try to sell, explain, or persuade in the subject line. Just earn the click.
2. **Lowercase wins in outbound.** It reads as personal, not promotional. Every ALL CAPS word screams "marketing email."
3. **Specificity beats cleverness.** A subject line with a number or name outperforms a clever turn of phrase because it signals "this is for you."
4. **Test one variable at a time.** Comparing a question-based subject line against a completely different email teaches you nothing. Isolate the variable.

## Anti-Patterns

- **Clickbait that doesn't deliver.** "You won't believe this" earns an open and a delete. The subject line must honestly represent the email.
- **Too many words.** Subject lines over 6 words get truncated on mobile. Mobile is where most email is read. Stay under 6.

## What to Do Next

- Write **cold emails** using the winning subject lines: `/skill cold-email-writer`
- Design **A/B test** for the full sequence: `/skill ab-test-designer`
- Build **follow-up sequence** with unique subject lines per touch: `/skill follow-up-sequence`

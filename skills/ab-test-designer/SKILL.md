---
name: ab-test-designer
description: Design A/B tests for outbound campaigns with variables, sample sizes, and analysis frameworks. Use when someone says "A/B test", "split test", "test email", "test subject line", "optimize campaign", "test outreach", or "experiment design"
allowed-tools: Read, Write
metadata:
  author: Achille Morin-Lemoine
  version: "1.0.0"
---

# A/B Test Designer

Design a structured A/B test for an outbound campaign. Defines the variable, control vs. variant, minimum sample size, success metric, test duration, and analysis framework. The goal is to learn something actionable, not just run an experiment for the sake of it.

## Inputs

- **Campaign details** (required) -- what campaign you're testing (channel, audience, current performance if known)
- **What to test** (required) -- the specific variable (subject line, opening line, CTA, sequence length, send time, persona)
- **Current performance** (optional) -- baseline metrics to improve against
- **Volume** (optional) -- expected send volume per week

If campaign details or test variable is missing, ask: "I need the campaign details and what specific variable you want to test. What are we working with?"

## Steps

### Step 0 -- Check for Existing Output

Search the project for any existing output from a previous run of this skill (check common locations like `docs/`, the project root, or any organized output directory). If a previous version is found, present a summary and ask: "An A/B test design for this variable already exists. Do you want me to (a) update the design, (b) design a follow-up test, or (c) rebuild from scratch?" 

### Step 1 -- Load Context

Search the project for any available context. Look in the project root, `docs/`, or any organized directory. Read what you find:

1. **Existing outreach sequences** -- the campaign assets being tested
2. **Analytics** documents -- any prior test results
3. `CLAUDE.md` -- project-level instructions

Understand the current campaign performance to set realistic improvement targets.

### Step 2 -- Define the Variable

State clearly what is being tested:
- **Variable name:** The specific element (e.g., "subject line," "opening line," "CTA type")
- **Why this variable:** What makes you think changing this will improve performance
- **Expected impact:** Which metric should improve if the variant wins

Rules:
- Test one variable at a time. If you change the subject line AND the opening line, you won't know which caused the change.
- The variable must be clearly different between control and variant. Subtle rewording teaches you nothing.

### Step 3 -- Define Control vs. Variant

Write out both versions completely:

**Control (A):** The current version or the default approach
**Variant (B):** The alternative being tested

For each, explain the hypothesis:
- Control represents: {what assumption it embodies}
- Variant represents: {what alternative assumption it tests}

The hypothesis should be stated as: "If we change {variable} from {control approach} to {variant approach}, we expect {metric} to improve because {reasoning}."

### Step 4 -- Calculate Minimum Sample Size

Apply these rules of thumb:

**For email subject lines:**
- Minimum 100 sends per variant (200 total)
- Expected difference to detect: 5+ percentage points in open rate
- If your baseline open rate is under 20%, you may need 200+ per variant

**For email body copy:**
- Minimum 100 sends per variant (200 total)
- Expected difference to detect: 2+ percentage points in reply rate
- Reply rates are lower, so larger samples may be needed

**For full sequences:**
- Minimum 50 prospects per variant (100 total)
- Measure meeting rate as the primary metric
- Sequence tests take longer because you need the full sequence to complete

**For send time:**
- Minimum 200 sends per variant (400 total)
- Test over 2+ weeks to account for weekly patterns

If volume is low (under 50 sends per week), recommend: "With your current volume, this test will take {X} weeks. Consider testing a higher-impact variable first."

### Step 5 -- Define Success Metrics

For each test type, define primary and secondary metrics:

| Variable | Primary Metric | Secondary Metric |
|----------|---------------|-----------------|
| Subject line | Open rate | Reply rate |
| Opening line | Reply rate | Meeting rate |
| CTA | Reply rate | Meeting rate |
| Sequence length | Meeting rate | Unsubscribe rate |
| Send time | Open rate | Reply rate |
| Persona | Meeting rate | Reply rate |

Explain why secondary metrics matter: a subject line that increases opens but decreases replies is a net negative.

### Step 6 -- Define Test Duration and Rules

- **Start date:** When to begin
- **End date:** When both variants hit minimum sample size OR maximum of 4 weeks
- **Traffic split:** 50/50 random assignment
- **Stopping rules:** Stop early only if one variant is performing 2x worse (to limit damage)
- **Winner criteria:** Primary metric must be higher with at least {minimum sample} sends per variant

### Step 7 -- Create Analysis Framework

Define how to analyze results:

1. Compare primary metric between A and B
2. Check if the difference is meaningful (rule of thumb: 5+ percentage point difference for open rate, 2+ for reply rate)
3. Check secondary metrics to ensure no negative trade-offs
4. Document what you learned regardless of outcome
5. Define the next test based on results

### Step 8 -- Quality Gate

Run these checks before saving:

- [ ] Only one variable is being tested
- [ ] Control and variant are clearly different (not subtle rewording)
- [ ] Hypothesis is stated and testable
- [ ] Sample size is defined with rationale
- [ ] Primary and secondary metrics are defined
- [ ] Test duration has a clear end date
- [ ] Analysis framework includes "what to do next" for both outcomes
- [ ] No em dashes in any copy

If any check fails, fix it before proceeding.

## Output Format

Save the output to your project. Suggested filename: `ab-test-{test-slug}.md`

```markdown
# A/B Test: {Test Name}
Date: {Date}
Campaign: {Campaign name}
Status: Designed / Running / Complete

## Hypothesis
If we change {variable} from {control} to {variant}, we expect {metric} to improve because {reasoning}.

## Test Design

### Variable
{What is being tested and why}

### Control (A)
{Full text or description of the control}

### Variant (B)
{Full text or description of the variant}

## Parameters
- **Sample size:** {N} per variant ({2N} total)
- **Traffic split:** 50/50
- **Start date:** {date}
- **End date:** {date} or when sample size is reached
- **Stopping rule:** Stop if either variant performs 2x worse on primary metric

## Success Metrics
- **Primary:** {metric} (current baseline: {X}%)
- **Secondary:** {metric} (watch for negative trade-offs)
- **Winner threshold:** {X} percentage point improvement on primary metric

## Analysis Framework
1. Compare primary metric: A = {X}% vs B = {X}%
2. Check secondary metric: no degradation
3. Document learning: {what this tells us about our audience}
4. Next test: if A wins, test {X}. If B wins, test {Y}.

## Results (fill after test completes)
- Control (A): {metric} = {result}
- Variant (B): {metric} = {result}
- Winner: {A or B}
- Learning: {what we learned}
- Next action: {what to do with this information}
```

## Key Principles

1. **One variable at a time.** Testing two things simultaneously is not an A/B test. It's guessing with extra steps.
2. **Sample size is not optional.** Drawing conclusions from 20 emails is not testing, it's confirmation bias. Wait for the data.
3. **Negative results are results.** If the variant loses, you learned something. Document what and move on.
4. **Test the highest-leverage variable first.** If your open rate is 5%, fix the subject line before testing CTAs. Work upstream.
5. **Secondary metrics catch hidden costs.** A subject line that doubles opens but halves replies made things worse. Always check the downstream impact.

## Anti-Patterns

- **Testing subtle differences.** Changing "Hi" to "Hey" is not a meaningful test. Make the variants meaningfully different or don't bother.
- **Calling a winner too early.** 15 sends per variant is not a test. It's a coin flip. Wait for the minimum sample size.
- **Testing without a hypothesis.** "Let's just see what happens" produces data without insight. Start with why you think the variant will win.

## What to Do Next

- Generate **subject line variants** for testing: `/skill subject-line-generator`
- Write **email variants** with different angles: `/skill cold-email-writer`
- Design **follow-up sequence** to test sequence structure: `/skill follow-up-sequence`

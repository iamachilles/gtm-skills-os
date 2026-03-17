---
description: Design a GTM experiment with hypothesis, parameters, and analysis framework. Use when someone says "design experiment", "GTM experiment", "test hypothesis", "run an experiment", "experiment design", "test this idea", or "structured test"
tools: Read, Write
---

# Experiment Designer

Design a structured GTM experiment with a specific hypothesis, test parameters, sample size calculation, success criteria, timeline, and analysis framework. Every experiment should teach you something, whether it succeeds or fails.

## Inputs

- **Idea to test** (required) -- what you want to learn or validate
- **Context** (required) -- what you know so far (data, observations, gut feeling)
- **Resources** (optional) -- budget, time, team capacity available for the test
- **Constraints** (optional) -- minimum sample size, maximum duration, risk tolerance

If the idea or context is missing, ask: "I need to know what you want to test and what you already know about it. What's the hypothesis?"

## Steps

### Step 0 -- Check for Existing Output

Read `docs/analytics/experiment-{slug}.md` if it exists. If found, present a summary and ask: "An experiment design for this already exists. Do you want me to (a) update the design, (b) design a follow-up experiment, or (c) keep it?"

### Step 1 -- Load Context

Read all available context:

1. `docs/analytics/*.md` -- prior experiments and results
2. `docs/analytics/campaign-report-*.md` -- performance data that informs the hypothesis
3. `CLAUDE.md` -- project-level instructions

### Step 2 -- Define Hypothesis

Write a specific, falsifiable hypothesis:

**Format:** "If we {change}, then {metric} will {improve/increase/decrease} by {amount} because {reasoning}."

Rules:
- The hypothesis must be specific enough to be proven wrong
- It must reference a measurable metric
- It must include the expected magnitude of change
- The reasoning must explain WHY you expect this outcome

Bad: "If we try a new approach, results will improve."
Good: "If we target VP-level contacts instead of Directors, meeting rate will increase from 2% to 4% because VPs have more budget authority and shorter decision cycles."

### Step 3 -- Define Test Parameters

**What changes (independent variable):**
- {Specific thing being changed}
- {How it differs from current approach}

**What stays constant (controlled variables):**
- {Everything that remains the same}
- {Why these are held constant}

**What you measure (dependent variable):**
- **Primary metric:** {the one metric that determines success}
- **Secondary metrics:** {2-3 additional metrics to monitor for trade-offs}

### Step 4 -- Calculate Sample Size

Determine minimum data needed:

**For conversion rate tests:**
- Baseline rate: {current %}
- Minimum detectable effect: {what improvement would be meaningful}
- Required sample: {N per variant, minimum 100}

**For revenue/value tests:**
- Baseline value: {current average}
- Minimum detectable effect: {what change would be meaningful}
- Required sample: depends on variance, but minimum 30 per variant

**Rule:** if your weekly volume can't produce the minimum sample within 4 weeks, either find a way to increase volume or accept a longer test duration. Never compromise on sample size.

### Step 5 -- Set Success Criteria

Define before running the test:

- **Primary metric threshold:** "{Metric} must reach {X}% or higher for the experiment to be considered successful."
- **Secondary metric guardrail:** "{Secondary metric} must not drop below {Y}%."
- **Minimum confidence:** Results must have at least 100 data points per variant.

### Step 6 -- Define Timeline

- **Preparation:** {what needs to be set up and how long}
- **Test start:** {date}
- **Minimum duration:** 2 weeks (to account for day-of-week and weekly pattern effects)
- **Maximum duration:** 6 weeks (if sample size isn't reached by then, the volume is too low for this test)
- **Analysis date:** {date, within 3 days of test end}
- **Decision date:** {date, within 1 week of analysis}

### Step 7 -- Plan Analysis Framework

Define how to analyze results:

1. Calculate primary metric for test vs. control
2. Check if minimum sample size was reached
3. Compare to success criteria threshold
4. Check secondary metrics for negative trade-offs
5. Segment results (does the experiment work better for some segments?)
6. Extract the learning: what does this tell us about our audience/market/approach?
7. Define next action: scale the winning approach, design a follow-up test, or revert

**Learning extraction template:**
- "We learned that {finding}."
- "This suggests that {implication for future strategy}."
- "The next experiment should test {follow-up question}."

### Step 8 -- Quality Gate

- [ ] Hypothesis is specific, falsifiable, and includes expected magnitude
- [ ] One independent variable (testing one thing at a time)
- [ ] Primary and secondary metrics are defined
- [ ] Sample size is calculated with minimum 100 per variant
- [ ] Success criteria are set before the test runs
- [ ] Timeline includes minimum 2 weeks
- [ ] Analysis framework includes learning extraction
- [ ] No em dashes in any copy

## Output Format

Save to `docs/analytics/experiment-{slug}.md`:

```markdown
# Experiment: {Name}

Date designed: {Date}
Status: Designed / Running / Complete
Owner: {Who runs this}

## Hypothesis
If we {change}, then {metric} will {improve} by {amount} because {reasoning}.

## Test Design

### What Changes
{Independent variable}

### What Stays Constant
{Controlled variables}

### What We Measure
- **Primary:** {metric + threshold}
- **Secondary:** {metrics + guardrails}

## Parameters
- **Sample size:** {N} per variant ({total} total)
- **Duration:** {start} to {end} (minimum {N} weeks)
- **Success threshold:** {primary metric must reach X}
- **Guardrail:** {secondary metric must not drop below Y}

## Timeline
| Phase | Dates | Activities |
|-------|-------|-----------|
| {rows} |

## Analysis Framework
{Steps for analyzing results}

## Results (fill after completion)
- **Primary metric:** Test = {X}, Control = {Y}
- **Secondary metrics:** {results}
- **Sample size reached:** Yes/No
- **Winner:** {Test / Control / Inconclusive}

## Learning
- **Finding:** {what we learned}
- **Implication:** {what this means for strategy}
- **Next experiment:** {follow-up test}
```

## Key Principles

1. **Hypothesis first, test second.** Running experiments without hypotheses is random activity. The hypothesis forces you to think about WHY something should work, which makes the learning valuable regardless of outcome.
2. **One variable at a time.** Changing two things means you can't tell which caused the result. Discipline in isolation is what makes experiments useful.
3. **Set success criteria before you see results.** Deciding what counts as "success" after seeing the data is not experimentation. It's confirmation bias.
4. **Two weeks minimum.** Shorter tests capture day-of-week effects and anomalies. Two weeks gives you two full cycles and more reliable data.
5. **The learning matters more than the outcome.** A failed experiment that teaches you something is more valuable than a successful one you can't explain.

## Anti-Patterns

- **The perpetual experiment.** Running experiments indefinitely without acting on results. Every experiment must end with a decision: scale, kill, or follow-up test.
- **Testing trivial changes.** Changing button color when your messaging is wrong. Test high-leverage variables first.
- **No documentation.** Running experiments but not recording hypotheses, parameters, or learnings. Six months later, nobody remembers what was tested or what was learned.

## What to Do Next

- Analyze **experiment results**: `/skill ab-test-analyzer`
- Review **campaign performance** to generate new hypotheses: `/skill campaign-analyzer`
- Log results in the **weekly report**: `/skill weekly-gtm-report`

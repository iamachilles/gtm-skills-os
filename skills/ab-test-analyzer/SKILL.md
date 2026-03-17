---
description: Analyze A/B test results with statistical rigor. Use when someone says "analyze A/B test", "test results", "split test results", "which variant won", "A/B test analysis", "test significance", or "compare variants"
tools: Read, Write
---

# A/B Test Analyzer

Analyze A/B test results with statistical rigor. Calculates metrics per variant, tests for significance, segments results, declares a winner (or not), and recommends the next test.

Hard cap: do not call a winner with under 100 data points per variant. That's noise, not signal.

## Inputs

- **Test data** (required) -- performance metrics for variant A and variant B (sends, opens, replies, meetings per variant)
- **Test design** (required) -- what was tested, the hypothesis, success metric
- **Segment data** (optional) -- results broken down by persona, industry, or other dimension

If test data is missing, ask: "I need the performance data for both variants (sends, opens, replies, meetings per variant). What are the results?"

## Steps

### Step 0 -- Check for Existing Output

Read `docs/analytics/ab-test-results-{test-slug}.md` if it exists. If found, present a summary and ask: "Results for this test already exist. Do you want me to (a) update with new data, (b) analyze a different segment, or (c) keep the existing analysis?"

### Step 1 -- Load Context

Read all available context:

1. `docs/analytics/ab-test-*.md` -- the test design and any prior results
2. `docs/analytics/campaign-report-*.md` -- campaign context
3. `CLAUDE.md` -- project-level instructions

### Step 2 -- Calculate Metrics Per Variant

| Metric | Variant A | Variant B | Difference | % Change |
|--------|-----------|-----------|-----------|----------|
| Sends | {N} | {N} | - | - |
| Opens | {N} | {N} | {delta} | {%} |
| Open rate | {%} | {%} | {delta} | {%} |
| Replies | {N} | {N} | {delta} | {%} |
| Reply rate | {%} | {%} | {delta} | {%} |
| Meetings | {N} | {N} | {delta} | {%} |
| Meeting rate | {%} | {%} | {delta} | {%} |

### Step 3 -- Test Statistical Significance

Apply these rules:

**Minimum data requirement:**
- Under 100 data points per variant: **Inconclusive.** Do not declare a winner. State: "Insufficient data. Need {N} more sends per variant to reach minimum sample size."
- 100-200 per variant: Preliminary results. Declare a winner only if the difference is large (5+ percentage points on open rate, 2+ on reply rate).
- 200+ per variant: Sufficient data. Apply standard significance test.

**Significance rules of thumb (without full statistical test):**
- Open rate difference of 5+ percentage points with 200+ sends: likely significant
- Reply rate difference of 2+ percentage points with 200+ sends: likely significant
- Meeting rate difference of 1+ percentage point with 100+ prospects: likely significant

**When in doubt:** state the result with a confidence caveat rather than declaring a definitive winner.

### Step 4 -- Analyze by Segment

If segment data is available, check if the winner varies by segment:

| Segment | Variant A | Variant B | Winner |
|---------|-----------|-----------|--------|
| {Persona 1} | {metric} | {metric} | {A/B/Tied} |
| {Persona 2} | {metric} | {metric} | {A/B/Tied} |

Important: a variant can win overall but lose in a specific segment. This is valuable intelligence. If Variant B wins for VPs but loses for Directors, you might use different variants per segment.

### Step 5 -- Determine Winner

State clearly:

**If conclusive:**
"Variant {A/B} wins on {primary metric} with a {X} percentage point improvement ({baseline}% to {new}%) based on {N} data points per variant."

**If inconclusive:**
"Results are inconclusive. Variant {A/B} is leading by {X} percentage points on {metric}, but with only {N} data points per variant, this could be noise. Continue the test until {minimum sample} per variant."

**If no difference:**
"No meaningful difference between variants. Both performed within {X} percentage points on {metric} with {N} data points each. The variable tested does not appear to impact performance."

### Step 6 -- Write Recommendation

Structure as:

1. **Primary finding:** What the test proved or disproved
2. **Action:** What to change based on results (implement winner, continue testing, or move on)
3. **Caveats:** What limitations apply (sample size, segment differences, secondary metric trade-offs)
4. **Next test:** What to test next based on these results. Be specific about the variable, hypothesis, and expected impact.

### Step 7 -- Quality Gate

- [ ] Metrics are calculated per variant with differences and % change
- [ ] Sample size is evaluated (minimum 100 per variant for any conclusion)
- [ ] Winner declaration includes confidence level
- [ ] Segment analysis is included (if data available)
- [ ] Secondary metrics are checked for trade-offs
- [ ] Next test is recommended with specific hypothesis
- [ ] No em dashes in any copy

## Output Format

Save to `docs/analytics/ab-test-results-{test-slug}.md`:

```markdown
# A/B Test Results: {Test Name}

Date: {Date}
Campaign: {Campaign name}
Variable tested: {What was tested}
Status: Complete / Inconclusive / Needs More Data

## Hypothesis
{Original hypothesis from test design}

## Results

### Overall
| Metric | Variant A | Variant B | Difference |
|--------|-----------|-----------|-----------|
| {rows} |

### Winner
{Clear statement with confidence level}

### By Segment
| Segment | Winner | Notes |
|---------|--------|-------|
| {rows} |

## Analysis
{What the data tells us about our audience, messaging, or approach}

## Secondary Metric Check
{Did the winner come at the expense of another metric?}

## Recommendation
1. **Action:** {What to do}
2. **Caveats:** {Limitations}
3. **Next test:** {What to test next and why}

## Learning
{What this teaches us beyond the specific test}
```

## Key Principles

1. **100 data points per variant is the minimum.** Below that, you're reading tea leaves. Wait for the data or don't run the test.
2. **Check secondary metrics.** A subject line that doubles opens but halves replies made things worse. The winner on the primary metric must not degrade secondary metrics.
3. **Segment analysis reveals hidden insights.** A variant that wins overall might lose in your best segment. Always check if results vary by audience.
4. **Negative results are results.** If the variant loses, you eliminated a hypothesis. Document the learning and move to the next test.
5. **The next test matters as much as the current result.** Every test should inform the next one. Build a chain of learning.

## Anti-Patterns

- **Calling winners with tiny samples.** "Variant B got 3 replies out of 40 sends vs. 2 out of 40 for A, so B wins." That's a coin flip, not a test.
- **Ignoring segment differences.** Averaging results across segments that behave differently. If enterprise responds to A and mid-market responds to B, the average helps nobody.
- **Testing without learning.** Running tests but never documenting what was learned. Each test should make the next campaign smarter.

## What to Do Next

- Design the **next A/B test** based on findings: `/skill ab-test-designer`
- Update the **campaign** with winning variants: `/skill cold-email-writer`
- Review **overall campaign performance**: `/skill campaign-analyzer`

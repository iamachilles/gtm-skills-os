---
name: social-proof-collector
description: Generate templates for collecting testimonials, case study interviews, and approval workflows. Use when someone says "collect testimonials", "social proof", "get reviews", "testimonial request", "client feedback", or "case study interview"
allowed-tools: Read, Write
metadata:
  author: Achille Morin-Lemoine
  version: "1.0.0"
---

# Social Proof Collector

Generate templates and workflows for collecting testimonials, conducting case study interviews, and managing client approvals. Social proof is the highest-converting asset in B2B marketing. But most companies either don't ask, ask badly, or ask at the wrong time.

This skill produces request templates, interview guides, and approval workflows.

## Inputs

- **Client context** (optional) -- specific clients to request from, with engagement details
- **Results data** (optional) -- specific outcomes to reference in requests
- **Use cases** (optional) -- where the social proof will be used (website, sales deck, LinkedIn)

No required inputs. This skill generates reusable templates. If client context is provided, templates are personalized.

## Steps

### Step 0 -- Check for Existing Output

Read content documents. If found, ask: "Social proof templates already exist. Do you want me to (a) add new templates, (b) personalize for a specific client, or (c) rebuild?"

### Step 1 -- Load Context

Read available context:

1. **Case studies** -- existing case studies
2. **Persona profiles** -- who provides testimonials
3. **Value proposition mapping** -- what outcomes to highlight
4. `CLAUDE.md` -- project-level instructions

Identify:
- Which clients had the strongest results
- What specific outcomes to reference
- Where social proof will have the most impact

### Step 2 -- Create Request Templates

Write 3 distinct request templates:

**Template 1: Email Request (personalized to results)**
- Subject line (2 variants)
- Opening: reference specific work together and results
- The ask: specific and easy (not "write us a testimonial")
- Offer to draft something they can edit
- Time commitment: "5 minutes to review, not 30 minutes to write"
- Sign-off

**Template 2: LinkedIn Recommendation Request**
- Direct message format
- Reference the specific project or engagement
- Suggest what to highlight (make it easy)
- Offer reciprocity (you'll write one for them too)

**Template 3: Quick Feedback Form (5 questions)**
Design questions that produce usable quotes:
1. What was the situation before we worked together?
2. What specific result did you see? (Include numbers if possible.)
3. What was the most valuable part of working with us?
4. Who would you recommend this for?
5. Anything else you'd want someone considering this to know?

Each question is designed to elicit specific, outcome-focused responses, not generic praise.

### Step 3 -- Write Case Study Interview Questions

10 questions for a 30-minute interview:

**Context (3 questions):**
1. What was happening in your business when you decided to [engage/buy]?
2. What had you already tried? What worked and what didn't?
3. What would have happened if you hadn't made a change?

**Experience (3 questions):**
4. Walk me through the first 30 days. What happened?
5. What surprised you most about the process?
6. Was there a turning point where you knew this was working?

**Results (2 questions):**
7. What specific results have you seen? (Prompt for numbers.)
8. How has this changed how your team operates day to day?

**Forward-looking (2 questions):**
9. What would you tell someone who's considering this but hasn't committed?
10. What's next for you in this area?

### Step 4 -- Create Approval Workflow

Design the approval process:

**Step 1: Draft**
- Write the testimonial or case study based on the interview/feedback
- Include specific numbers and outcomes
- Keep it under 100 words for testimonials, under 500 for case studies

**Step 2: Client Review**
- Send draft with: "I've drafted this based on our conversation. Please edit anything that doesn't feel right or that you'd rather not share publicly."
- Give a clear deadline (5 business days)
- Make it easy to approve (reply "looks good" is sufficient)

**Step 3: Sign-Off**
- Confirmation email: "Thanks for approving. Here's where we'll use this: [specific placements]."
- Note any restrictions the client mentioned

**Step 4: Usage Tracking**
- Log where each piece of social proof is used
- Set a reminder to update testimonials annually

### Step 5 -- Quality Gate

- [ ] Email request template references specific results, not generic work
- [ ] LinkedIn request is under 100 words
- [ ] Feedback form questions elicit specific outcomes, not generic praise
- [ ] Interview questions cover context, experience, results, and future
- [ ] Approval workflow includes a clear draft-review-signoff process
- [ ] All templates make it easy for the client (low effort, high specificity)

If any check fails, fix it before proceeding.

## Output Format

Save the output to your project. Suggested filename: `social-proof-templates.md`

```markdown
# Social Proof Collection Templates
Date: [Date]

## Request Templates

### Email Request
**Subject line A:** [Subject]
**Subject line B:** [Subject]

[Full email template with placeholders]

### LinkedIn Recommendation Request
[Full DM template]

### Quick Feedback Form
[5 questions with instructions]

## Case Study Interview Guide
**Duration:** 30 minutes
**Recording:** [Yes/No recommendation]

[10 questions with interviewer notes]

## Approval Workflow
### Step 1: Draft
[Process]

### Step 2: Client Review
[Email template]

### Step 3: Sign-Off
[Confirmation template]

### Step 4: Usage Tracking
[Tracking template]

## Best Practices
- When to ask (timing recommendations)
- How to follow up without being pushy
- What makes a testimonial usable vs. generic
```

## Key Principles

1. **The best testimonials are specific about outcomes, not generic praise.** "Great to work with" is useless. "Reply rates went from 1.2% to 4.8% in 6 weeks" is gold.
2. **Make it easy, not effortful.** Draft the testimonial for them. Nobody wants homework. Offer to write something they just review and approve.
3. **Ask at the peak.** Request testimonials right after a win, not 3 months later when the excitement has faded.
4. **Specificity is credibility.** A testimonial with the person's name, title, company, and specific numbers is 10x more powerful than an anonymous quote.

## Anti-Patterns

- **The cold ask:** Requesting a testimonial from someone who hasn't experienced a clear win yet. Earn the right to ask.
- **The open-ended request:** "Can you write us a testimonial?" Most people freeze. Give them structure, prompts, or a draft to react to.
- **The one-and-done:** Collecting testimonials once and never updating them. Fresh social proof with current dates outperforms 3-year-old quotes.

## What to Do Next

- Build a **case study** from the interview: `/skill case-study-builder`
- Repurpose testimonials into **LinkedIn posts**: `/skill write-linkedin-post`
- Add social proof to the **landing page**: `/skill landing-page-copy`

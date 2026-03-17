---
description: Define personal positioning for a freelancer or consultant. Use when someone says "positioning", "personal brand", "freelancer positioning", "consultant positioning", "LinkedIn profile", "how to position myself", or "differentiation"
tools: Read, Write, WebSearch
---

# Freelancer Positioning

Define personal positioning that makes you the obvious choice for a specific type of client. Captures your background, thesis, differentiation, and produces a positioning statement, LinkedIn headline, LinkedIn About section, and website hero copy.

## Inputs

- **Background** (required) -- skills, experience, notable results, career trajectory
- **Target client** (required) -- who you want to work with (industry, size, role)
- **Discipline** (required) -- what you do (GTM consulting, content strategy, sales ops, etc.)
- **Results** (optional) -- specific outcomes you've delivered for clients
- **Current positioning** (optional) -- existing LinkedIn headline, About, website copy

If background or target client is missing, ask: "I need your background (skills, experience, results) and who you want to work with. What's the context?"

## Steps

### Step 0 -- Check for Existing Output

Read `docs/positioning.md` if it exists. If found, present a summary and ask: "A positioning document already exists. Do you want me to (a) refine it, (b) reposition for a different audience, or (c) keep it?"

### Step 1 -- Load Context

Read all available context:

1. `docs/gtm-triangle.md` -- if positioning work has been done
2. `docs/case-studies/*.md` -- proof points
3. `CLAUDE.md` -- project-level instructions

### Step 2 -- Research Competitive Landscape

Search for:
- "{discipline} freelancer positioning" -- how others in your space position themselves
- "{discipline} consultant differentiation" -- what differentiators exist in the market

Extract:
- How top freelancers in your space position themselves
- Common positioning angles (and which are overused)
- Gaps in the market (positioning angles nobody owns)

### Step 3 -- Capture Background

Structure your background:

- **Career trajectory:** {Where you started, key transitions, current focus}
- **Core skills:** {3-5 skills, prioritized by relevance to target client}
- **Notable results:** {3-5 specific outcomes with numbers}
- **Unique experiences:** {What you've done that most people in your space haven't}

### Step 4 -- Identify Your Thesis

Your thesis is the market belief that drives your work. It's not what you do. It's WHY you do it the way you do.

**Format:** "Most {target clients} believe {common approach}. But {your thesis}. That's why {your approach works better}."

Example: "Most B2B startups believe they need more leads. But the problem isn't volume, it's that they're targeting accounts that will never buy. That's why I start with ICP definition before touching a single campaign."

The thesis must be:
- Contrarian enough to be interesting
- True enough to be defensible
- Relevant to your target client's biggest problem

### Step 5 -- Map Differentiation

Your differentiation is the unique combination of skills, experiences, and perspectives you bring. It's not one thing. It's the intersection.

**Skill combination:** {Skill A} + {Skill B} + {Skill C}

Most people have one of these skills. Some have two. Your unique value is the combination.

Example: "I combine enterprise sales experience with content marketing skills and a technical background. That means I can build GTM strategies that are commercially viable, content-driven, and technically sound."

### Step 6 -- Write Positioning Outputs

**Positioning statement** (2-3 sentences):
- Who you help
- What problem you solve
- How you're different
- What results you deliver

**LinkedIn headline** (under 120 characters):
- Format: "{What you do} for {who} | {proof point or thesis}"
- Must include what you do AND who you do it for
- Avoid: "Passionate about..." or vague titles

**LinkedIn About section** (200-300 words):
- Paragraph 1: The problem your clients face (speak to them, not about yourself)
- Paragraph 2: Your thesis (why the common approach doesn't work)
- Paragraph 3: What you do and how (your approach in 2-3 sentences)
- Paragraph 4: Proof points (2-3 specific results)
- Paragraph 5: CTA (how to work with you)

**Website hero copy** (headline + subheadline):
- Headline: {What you do for who} (under 10 words)
- Subheadline: {How, with proof or thesis} (under 25 words)

### Step 7 -- Quality Gate

- [ ] Thesis is contrarian and defensible
- [ ] Differentiation is a unique combination, not a single skill
- [ ] LinkedIn headline is under 120 characters
- [ ] LinkedIn About speaks to the client's problem first
- [ ] Website hero copy is under 10 words (headline)
- [ ] At least 2 specific proof points with numbers
- [ ] Positioning is specific to a target client (not "everyone")
- [ ] No em dashes in any copy

## Output Format

Save to `docs/positioning.md`:

```markdown
# Personal Positioning

Date: {Date}

## Target Client
{Who you serve: industry, size, role, stage}

## Thesis
{Your market belief in 2-3 sentences}

## Differentiation
{Your unique skill combination and why it matters}

## Positioning Statement
{2-3 sentences}

## LinkedIn Headline
{Under 120 characters}

## LinkedIn About
{200-300 words, structured as: their problem, your thesis, your approach, proof, CTA}

## Website Hero
**Headline:** {Under 10 words}
**Subheadline:** {Under 25 words}

## Proof Points
1. {Result with specific number}
2. {Result with specific number}
3. {Result with specific number}

## Research Notes
{Competitive positioning landscape and gaps identified}
```

## Key Principles

1. **Positioning is about what you say no to.** If your positioning applies to everyone, it applies to no one. The narrower your target, the more magnetic your positioning.
2. **Lead with their problem, not your resume.** Clients don't care about your background until they believe you understand their problem. Start with the pain.
3. **Your thesis is your sharpest tool.** A clear, contrarian thesis makes you memorable. "I do GTM consulting" is forgettable. "Most startups waste 80% of their outbound on accounts that will never buy" starts a conversation.
4. **Differentiation is a combination, not a superlative.** You're probably not the best at any single skill. But your unique combination of skills creates a positioning no one else occupies.

## Anti-Patterns

- **The generalist trap.** "I help companies grow" positions you against every consultant, agency, and in-house hire. Pick a lane.
- **Credentials over results.** Leading with certifications and degrees instead of outcomes delivered. Clients buy results, not diplomas.
- **Copying competitor positioning.** If your LinkedIn headline could be swapped with a competitor's and nobody would notice, your positioning isn't differentiated.

## What to Do Next

- **Productize your service**: `/skill service-productizer`
- Build a **case study** to support your positioning: `/skill case-study-builder`
- Write **outreach** using your positioning: `/skill cold-email-writer`

---
description: Design deal desk processes with discount authority, approval workflows, and pricing exceptions. Use when someone says "deal desk", "pricing approval", "discount matrix", "deal approval", "pricing exceptions", "non-standard deal", or "enterprise pricing"
tools: Read, Write
---

# Deal Desk Playbook

Design deal desk processes including standard deal templates, discount authority matrix, non-standard deal approval workflows, pricing exception guidelines, and multi-year/enterprise deal structures. The output is a playbook that lets reps know exactly what they can offer and who needs to approve what.

Without a deal desk playbook, every deal becomes a negotiation with your own company. Reps don't know what they can discount, managers become bottlenecks, and deal cycles extend by weeks while approvals ping-pong through Slack.

## Inputs

- **Pricing model** (required) -- how your product/service is priced (per seat, usage, flat fee, tiered)
- **Standard pricing** (required) -- list prices or rate card
- **Deal approval roles** (required) -- who can approve what (rep, manager, VP, CEO)
- **Average deal size** (optional) -- context for discount thresholds
- **Common deal exceptions** (optional) -- what non-standard requests come up frequently
- **Legal/procurement requirements** (optional) -- contract terms, payment terms, SLAs

If pricing model is missing, ask: "I need your pricing model and list prices to build the deal desk playbook. How is your product/service priced?"

## Steps

### Step 0 -- Check for Existing Output

Read `docs/ops/deal-desk-playbook.md` if it exists. If found, present a summary and ask: "A deal desk playbook already exists. Do you want me to (a) update discount thresholds, (b) add deal types, or (c) rebuild from scratch?"

### Step 1 -- Load Context

Read all available context:

1. `docs/ops/sales-process.md` -- when in the process deals need desk support
2. `docs/ops/compensation-model.md` -- how discounts affect commission
3. `docs/icp.md` -- customer segments that affect pricing
4. `CLAUDE.md` -- project-level instructions

### Step 2 -- Define Standard Deal Templates

Create templates for the most common deal types:

- **Standard deal:** List price, annual contract, standard payment terms (net 30)
- **Startup/SMB deal:** Reduced pricing, monthly or quarterly billing
- **Mid-market deal:** Annual contract, modest volume discount
- **Enterprise deal:** Multi-year, custom terms, volume pricing
- **Partner deal:** Referral or reseller pricing

For each template, define: pricing, payment terms, contract length, SLA, and any included professional services.

### Step 3 -- Build Discount Authority Matrix

Define who can approve what level of discount:

| Discount Level | Approval Required | Conditions |
|---------------|-------------------|------------|
| 0-10% | Rep (self-approved) | Standard deal, annual contract minimum |
| 11-20% | Sales Manager | Written justification, 2+ year contract preferred |
| 21-30% | VP Sales | Strategic account justification, multi-year required |
| 31-40% | CRO/CEO | Exceptional circumstances only, board-level strategic value |
| 40%+ | Not available | If the deal requires 40%+ discount, the fit is wrong |

Add conditions for each tier:
- Minimum contract length to qualify for discount
- Required trade (longer term, case study rights, referral commitment)
- Time limit (discount approval expires after 30 days)

### Step 4 -- Design Non-Standard Deal Workflow

Define the process when a deal doesn't fit standard templates:

1. **Rep identifies non-standard requirement** (custom terms, unusual pricing, payment exception)
2. **Rep submits deal desk request** with: deal amount, customer name, what's non-standard, justification, competitive context
3. **Deal desk reviews** within 24 hours (48 hours for complex requests)
4. **Decision returned** with: approved, approved with modifications, or rejected with alternative
5. **Approved terms documented** in CRM and contract

Define SLAs: deal desk response within 24 hours, complex deals within 48 hours. Every hour of delay past SLA risks the deal.

### Step 5 -- Set Pricing Exception Guidelines

Document the most common exceptions and how to handle them:

- **Payment terms:** Net 30 standard. Net 45 with manager approval. Net 60+ with VP approval.
- **Monthly billing:** Available with 10% premium over annual rate
- **Free trial extension:** Up to 14 days additional with manager approval
- **Pilot pricing:** 50% of list for 90-day pilot, converts to full price or cancels
- **Non-profit/education:** 20% standard discount, no additional approval needed
- **Competitive displacement:** Up to 20% "switch" discount with proof of competing contract

### Step 6 -- Document Multi-Year and Enterprise Structures

Define frameworks for large or complex deals:

**Multi-year discounts:**
- 2-year contract: 5-10% off annual rate
- 3-year contract: 10-15% off annual rate
- Payment: annual upfront preferred, quarterly with 3% premium

**Enterprise deal components:**
- Volume pricing tiers (break points and rates)
- Professional services packaging
- Custom SLA terms and their cost
- Executive sponsor assignment criteria
- Quarterly business review commitment

### Step 7 -- Quality Gate

- [ ] Standard deal templates cover 80%+ of deals without customization
- [ ] Discount authority matrix has clear thresholds and required approvals
- [ ] Every discount tier requires a trade (not just a signature)
- [ ] Non-standard deal workflow has an SLA (24-48 hours)
- [ ] Pricing exceptions cover the top 5 most common requests
- [ ] Multi-year structures include volume tiers and payment terms
- [ ] No discount tier allows 40%+ (if the discount is that high, the deal is wrong)

If any check fails, fix it before proceeding.

## Output Format

Save to `docs/ops/deal-desk-playbook.md`:

```markdown
# Deal Desk Playbook
Date: {Date}
Pricing Model: {Type}

## Standard Deal Templates

### Standard Deal
- **Pricing:** {List price}
- **Contract:** {Length}
- **Payment:** {Terms}
- **SLA:** {Standard}

### Enterprise Deal
[Same structure with enterprise-specific terms]

## Discount Authority Matrix
| Discount | Approver | Conditions | Required Trade |
|----------|----------|------------|---------------|

## Non-Standard Deal Process
1. {Step 1}
2. {Step 2}
3. {Step 3}
**SLA:** {Response time}

## Pricing Exceptions
| Exception | Standard Approach | Approval | Notes |
|-----------|------------------|----------|-------|

## Multi-Year Framework
| Term | Discount | Payment Options | Conditions |
|------|----------|----------------|------------|

## Enterprise Components
| Component | Standard Inclusion | Premium | Pricing |
|-----------|-------------------|---------|---------|

## Rules
- Discount approvals expire after {N} days
- All non-standard terms must be documented in CRM
- Competitive displacement discounts require proof of competing contract
```

## Key Principles

1. **Every discount requires a trade.** Discounts without trades train buyers to always negotiate. A discount for a longer contract, a case study, or a referral is a business decision. A discount because "they asked" is margin erosion.
2. **Speed of approval is a competitive advantage.** If your deal desk takes a week to respond, you lose deals to competitors who can say yes today. Set and enforce SLAs.
3. **Standard templates should cover 80% of deals.** If most deals require deal desk involvement, your pricing model is too complex or your standard terms are too rigid.
4. **Document everything in the CRM.** Non-standard terms agreed over Slack but not recorded create renewal nightmares.

## Anti-Patterns

- **Unlimited discounting authority for reps.** Reps will discount to the floor to close faster. Guardrails protect margins.
- **No trade for discounts.** Giving 20% off because the prospect asked nicely. Always get something in return: longer term, case study rights, referral commitment.
- **Approval bottlenecks.** Requiring VP approval for a 5% discount on a $5K deal. Match approval rigor to deal impact.

## What to Do Next

- Design the **sales process** that feeds deal desk: `/skill sales-process-designer`
- Build **compensation** that accounts for discounting impact: `/skill compensation-modeler`
- Create **proposal templates** for standard deals: `/skill proposal-generator`

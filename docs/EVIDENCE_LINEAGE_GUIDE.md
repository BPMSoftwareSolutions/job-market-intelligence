# Evidence Lineage Guide

## Understanding Evidence in Job Market Intelligence

This system is built on a core principle: **no insight without evidence**. Every market signal, pattern, and inference you see in the output can be traced back to the original job postings that support it. This guide explains how evidence flows through the system and how to follow it.

## The Evidence Chain

Evidence moves through a strict chain of transformations, with each step preserving references to its sources:

```
Job Posting (Primary Evidence)
           ↓
      Canonicalize
           ↓
Canonical Opportunity (Source: Job Posting)
           ↓
      Extract Facts
           ↓
Observed Facts (Source: Canonical Opportunity → Job Posting)
  - Compensation Facts
  - Competency Facts
  - Technology Facts
  - Business Problem Facts
           ↓
      Derive Signals
           ↓
Market Signals (Source: Observed Facts → Job Posting)
           ↓
      Aggregate & Pattern
           ↓
Market Patterns (Source: Market Signals → Facts → Job Posting)
           ↓
Project Intelligence
           ↓
Intelligence Profile (Every insight traces to source evidence)
```

## Fact Types and Evidence

Each observed fact in your analysis output represents something extracted from job postings:

### Compensation Facts
**What it captures:** Salary ranges, equity, benefits, and total compensation

**Evidence requirement:** Must appear explicitly in job posting
```
Posting text: "Salary: $150k-$190k + 0.05% equity"
         ↓
Compensation Fact: {
  "type": "compensation",
  "median": 170000,
  "low": 150000,
  "high": 190000,
  "equity": "0.05%",
  "sourcePostingIds": ["posting:greenhouse:company:12847"]
}
```

**How to use:**
- Validate market compensation ranges
- Track compensation trends by role or company
- Identify outliers that suggest specialization premium

### Competency Facts
**What it captures:** Required skills, experience levels, and educational requirements

**Evidence requirement:** Must appear in "Required Skills" or "Qualifications" sections
```
Posting text: "Required: 5+ years Kubernetes experience, 
              expert-level Go programming, AWS certification"
         ↓
Competency Facts: {
  "competency": "kubernetes",
  "yearsRequired": 5,
  "proficiencyLevel": "expert",
  "sourcePostingIds": ["posting:lever:company:5021"]
},
{
  "competency": "go-programming",
  "proficiencyLevel": "expert",
  "sourcePostingIds": ["posting:lever:company:5021"]
},
{
  "competency": "aws-certification",
  "certification": true,
  "sourcePostingIds": ["posting:lever:company:5021"]
}
```

**How to use:**
- Understand skill requirements for specific roles
- Track which competencies are in high demand
- Identify emerging skills by tracking new facts over time

### Technology Facts
**What it captures:** Named technologies mentioned in job postings

**Evidence requirement:** Must be explicitly mentioned in job description or requirements
```
Posting text: "We use Rust for performance-critical services,
              Kubernetes for orchestration, and PostgreSQL..."
         ↓
Technology Facts: {
  "technology": "rust",
  "context": "performance-critical-services",
  "sourcePostingIds": ["posting:greenhouse:company:8734"]
},
{
  "technology": "kubernetes",
  "context": "orchestration",
  "sourcePostingIds": ["posting:greenhouse:company:8734"]
},
{
  "technology": "postgresql",
  "context": "data-storage",
  "sourcePostingIds": ["posting:greenhouse:company:8734"]
}
```

**How to use:**
- Track technology adoption across organizations
- Identify emerging or declining technologies
- Understand technology patterns by industry or role

### Business Problem Facts
**What it captures:** Business challenges and outcomes mentioned in postings

**Evidence requirement:** Must be explicitly stated in "About Us" or "What We're Looking For" sections
```
Posting text: "We're solving real-time data processing at scale 
              for financial markets..."
         ↓
Business Problem Fact: {
  "problem": "real-time-data-processing-at-scale",
  "domain": "financial-services",
  "sourcePostingIds": ["posting:workday:company:3847"]
}
```

**How to use:**
- Understand organizational priorities
- Identify market pain points
- Track which problems organizations are solving

## Tracing Evidence in Output

### Step 1: Start with a Market Signal

Example signal from the output:
```json
{
  "signalId": "signal:technology:llm-infrastructure",
  "type": "technology-adoption",
  "name": "Large Language Model Infrastructure Investment",
  "confidence": "high",
  "observedPostingCount": 12,
  "sourceFactIds": [
    "fact:technology:transformer-models:2026-08",
    "fact:technology:vector-databases:2026-08",
    "fact:technology:prompt-engineering:2026-08"
  ]
}
```

### Step 2: Resolve the Source Facts

For each source fact ID, look up the fact in the output:
```json
{
  "factId": "fact:technology:transformer-models:2026-08",
  "type": "technology",
  "technology": "transformer-models",
  "mention_count": 8,
  "sourcePostingIds": [
    "posting:greenhouse:company-a:1024",
    "posting:greenhouse:company-b:2847",
    "posting:lever:company-c:384",
    "posting:lever:company-c:385",
    "posting:workday:company-d:921",
    "posting:workday:company-d:927",
    "posting:workday:company-e:1043",
    "posting:workday:company-e:1082"
  ]
}
```

### Step 3: Access the Original Postings

The `sourcePostingIds` array contains references to the original job postings. To verify the evidence:

1. **For Greenhouse postings:** 
   - Format: `posting:greenhouse:company-name:posting-id`
   - Look in `sources/greenhouse/` for company job data
   - Use the posting ID to find the specific job

2. **For Lever postings:**
   - Format: `posting:lever:company-name:posting-id`
   - Look in `sources/lever/` for company job data
   - Use the posting ID to find the specific job

3. **For Workday postings:**
   - Format: `posting:workday:company-name:posting-id`
   - Look in `sources/workday/` for company job data
   - Use the posting ID to find the specific job

4. **For web postings:**
   - Format: `posting:web:source-domain:posting-id`
   - Contains URL to original posting

### Step 4: Verify the Evidence

Open the posting and verify that it contains the claimed fact. For example:
- For "transformer-models" fact: Search the job description for mentions of transformers, LLMs, or deep learning models
- For "kubernetes-expertise" fact: Search for "Kubernetes" or "k8s" in requirements
- For "compensation-fact": Find the salary range in the job posting

## Pattern Evidence Chains

Market patterns are more complex—they reference signals, which reference facts, which reference postings:

```json
{
  "patternId": "pattern:ai-infrastructure-modernization",
  "type": "strategic-trend",
  "name": "Enterprise AI Infrastructure Modernization",
  "timeDisposition": "OBSERVABLY_TRUE",
  "supportingSignalIds": [
    "signal:technology:transformer-models",
    "signal:technology:vector-databases",
    "signal:competency:prompt-engineering",
    "signal:competency:llm-fine-tuning"
  ]
}
```

To verify this pattern:

1. Look up each supporting signal (e.g., `signal:technology:transformer-models`)
2. For each signal, follow the chain to its source facts
3. For each fact, trace to the original job postings
4. Read the postings to verify they collectively support the pattern claim

**Pattern is valid when:**
- Multiple signals converge on the same theme
- Signals appear across multiple companies
- Facts are consistent and not contradictory

## Evidence Rejection Scenarios

The system automatically rejects evidence that doesn't meet requirements:

### Private Source Rejection
**Rejected:** Internal job boards, private career pages, restricted LinkedIn data
```
Posting: "job.internalcompany.com/careers/engineer"
Status: REJECTED
Reason: Private source (internal domain)
```

**Why:** Only public job postings can be verified and are defensible as evidence

**What to do:** Use only public job boards (Greenhouse, Lever, Workday) or public web postings

### Duplicate or Low-Confidence Posting Rejection
**Rejected:** Posting is duplicate of existing posting (same content hash)
```
Posting ID: posting:greenhouse:company:2847
Status: REJECTED
Reason: Duplicate content (matches posting:greenhouse:company:2843)
```

**Why:** Duplicates inflate signal confidence; only unique postings count

**What to do:** Duplicates are automatically deduplicated; this is working as designed

### Malformed Posting Rejection
**Rejected:** Posting is missing required fields
```
Posting: (no job title, no description)
Status: REJECTED
Reason: Missing required fields: title, description
```

**Why:** Insufficient data to extract reliable facts

**What to do:** Ensure all job postings have titles, descriptions, and dates

## Reading Analyst Experience Views

The final intelligence profile includes an `analystExperience` view designed for non-technical review:

```json
{
  "analystExperience": {
    "organizationalInvestmentSignals": [
      {
        "investmentArea": "AI/ML Infrastructure",
        "signals": [
          {
            "name": "LLM Model Fine-Tuning Capability Building",
            "postingCount": 24,
            "companiesInvolved": 8,
            "sourceFacts": "12 competency facts + 8 technology facts",
            "lineage": "24 job postings → 20 facts → 8 signals → this pattern"
          }
        ]
      }
    ],
    "capabilityDemandGaps": [
      {
        "capability": "Vector Database Engineering",
        "demandSignals": 5,
        "supplyIndicators": 0,
        "gap": "SIGNIFICANT",
        "backingPostings": 5,
        "interpretation": "Organizations want vector DB expertise but few postings suggest existing supply"
      }
    ],
    "changeOverTime": {
      "disposition": "OBSERVABLY_TRUE",
      "interpretation": "Multiple observation windows show consistent AI infrastructure investment",
      "trendDirection": "INCREASING",
      "firstObserved": "2026-Q2",
      "latestObservation": "2026-Q3"
    }
  }
}
```

## Evidence Validation Checklist

When reviewing analyst output, verify evidence integrity:

- [ ] Every signal has a "sourceFactIds" array pointing to specific facts
- [ ] Every fact has a "sourcePostingIds" array pointing to original postings
- [ ] Posting IDs follow the format: `posting:source:company:id`
- [ ] Fact counts match the actual postings cited
- [ ] No signal appears without backing facts
- [ ] No pattern appears without backing signals
- [ ] Time disposition is labeled correctly (NOT_ESTABLISHED for single windows, OBSERVABLY_TRUE for multiple)

## Common Tracing Questions and Answers

**Q: Why does a signal show 20 postings but only 8 facts?**
A: A single posting can cite multiple instances of a fact (e.g., mentions "Rust" three times). Facts are deduplicated, but posting count is preserved.

**Q: Can I trace a pattern backward to individual postings?**
A: Yes. Pattern → Signal → Fact → Posting. Follow each link in order.

**Q: What if evidence is missing from the output?**
A: Evidence is only included if it meets quality thresholds. Very low-frequency facts may be excluded from summaries but preserved in raw data.

**Q: How do I know if a signal is reliable?**
A: Check three things:
1. Posting count (higher = more reliable)
2. Company diversity (appears across multiple companies = more reliable)
3. Consistency (appears in multiple observation windows = more reliable)

**Q: Can postings be edited or deleted after analysis?**
A: This system treats postings as immutable evidence. Each posting is assigned a content hash. If a posting is edited, it has a new hash and is treated as a different posting.

## Best Practices for Evidence Review

1. **Spot-check signals** — Pick 2-3 signals at random and trace them fully to source postings
2. **Verify pattern coherence** — Do the supporting signals actually support the pattern claim?
3. **Check for recency** — Are facts from recent postings, or dated evidence?
4. **Look for company overlap** — Do signals appear across multiple organizations (more credible) or from one company only?
5. **Question surprises** — If a signal seems unlikely, trace it to see if evidence actually supports the claim
6. **Use context** — Compare with industry news, earnings calls, and conference announcements to validate market intelligence

## Referencing Evidence in Reports

When citing job market intelligence in internal reports or external analysis:

**Good citation:**
"Market demand for Rust is increasing (8 job postings across 5 companies in Q3 2026, up from 3 postings in Q1 2026)"

**Better citation:**
"Rust adoption as critical infrastructure language is established (7 postings from Companies A, B, C, D, E; median salary $185k indicates specialization premium)"

**Best citation:**
"Rust adoption in infrastructure is OBSERVABLY_TRUE across multiple observation windows (Q2: 3 postings; Q3: 8 postings), citing specific facts: systems-design mastery, performance optimization, and low-latency requirements"

The more specificity you include—fact types, company names, compensation signals, observation windows—the more defensible your analysis.

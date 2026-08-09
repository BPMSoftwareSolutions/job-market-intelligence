# Quick Start: Common Market Analysis Workflows

Fast reference for the most common market intelligence tasks.

## 5-Minute Setup

### 1. Prepare Your Job Data
Ensure you have job postings from public sources:
- Greenhouse
- Lever
- Workday
- Public web postings

### 2. Define Observation Scope
Create a JSON file with your analysis parameters:

```json
{
  "observationId": "my-analysis-001",
  "startDate": "2026-07-01",
  "endDate": "2026-08-09",
  "sources": [
    {
      "sourceType": "ATS",
      "vendor": "Greenhouse",
      "companies": ["Company A"]
    }
  ],
  "jobCategories": ["Engineering"]
}
```

### 3. Run Analysis
```bash
# Node.js
node projected/node/capability.projected.mjs --input scope.json

# Python
python projected/python/consumer.generated.py --input scope.json

# C#
dotnet run --project projected/csharp/ProjectedConsumer.generated.csproj -- --input scope.json
```

### 4. Review Output
Open the generated `intelligence-profile.json` and look for:
- `organizationalInvestmentSignals` — What companies are building
- `capabilityDemandSignals` — What skills they need
- `analystExperience` — Analyst-friendly summary with evidence lineage

---

## Common Tasks

### Task: Analyze Compensation Trends

**Goal:** Understand salary ranges for a role across companies

**Setup:**
```json
{
  "observationId": "sr-engineer-compensation-2026",
  "startDate": "2026-01-01",
  "endDate": "2026-08-09",
  "jobTitles": ["Senior Engineer", "Staff Engineer"],
  "sources": [...]
}
```

**In Output, Look For:**
- `compensationFacts` array with `median`, `low`, `high` values
- `sourcePostingIds` to verify actual job postings
- Breakdown by `company` and `yearsRequired`

**Trace Evidence:**
1. Find compensation fact with median salary
2. Click/reference `sourcePostingIds` array
3. Verify each posting contains the stated compensation

---

### Task: Identify Emerging Technologies

**Goal:** Find technologies that are gaining adoption across companies

**Setup:**
```json
{
  "observationId": "emerging-tech-2026",
  "startDate": "2026-01-01",
  "endDate": "2026-08-09",
  "keywords": ["ai", "llm", "transformer", "vector", "embeddings"]
}
```

**In Output, Look For:**
- `technologyFacts` with high `confidence`
- `mention_count` and `sourcePostingIds` 
- Appears across multiple companies (`company_diversity`)

**Verify Emergence:**
1. Compare with previous quarter (run separate analysis)
2. Check if posting count is increasing
3. Verify companies are diverse (not just one company hiring)

**Trace Evidence:**
1. Find technology fact for "transformer-models"
2. Review all `sourcePostingIds`
3. Open each job posting to confirm technology is required/preferred

---

### Task: Find Capability Gaps

**Goal:** Identify skills companies need but may not have supply for

**Setup:**
```json
{
  "observationId": "capability-gaps-2026",
  "startDate": "2026-01-01",
  "endDate": "2026-08-09"
}
```

**In Output, Look For:**
- High `capabilityDemandSignals` with low supporting supply facts
- `yearsRequired` indicates specialization
- Multiple companies seeking same skill

**Interpret:**
- **High demand (10+ postings) + rare competency** = Gap exists
- **High demand (10+ postings) + mid-level competency** = Competitive market
- **Low demand (1-3 postings) + rare competency** = Niche need

**Example:**
```json
{
  "competency": "vector-database-architecture",
  "postingCount": 8,
  "companiesAsking": 6,
  "yearsRequired": [5, 7, 8],
  "interpretation": "HIGH DEMAND + RARE SKILL = SIGNIFICANT GAP"
}
```

---

### Task: Track Organizational Investment by Department

**Goal:** Understand which companies are hiring heavily in which areas

**Setup:**
```json
{
  "observationId": "hiring-investment-2026",
  "startDate": "2026-01-01",
  "endDate": "2026-08-09",
  "companies": ["Company A", "Company B", "Company C"]
}
```

**In Output, Look For:**
- `organizationalInvestmentSignals` grouped by domain
- Hiring volume by department (Engineering, Product, Data, etc.)
- Compare across companies

**Analyze:**
```
Company A: 45 Engineering, 12 Product, 8 Data Science
         → Heavy infrastructure investment

Company B: 8 Engineering, 6 Product, 22 Data Science
         → Heavy analytics/ML investment

Company C: 30 Engineering, 20 Product, 15 Data Science
         → Balanced, sustained hiring
```

---

### Task: Establish Change Over Time

**Goal:** Determine if a trend is real or a single observation

**Setup: Create Multiple Observation Windows**
```json
{
  "observationId": "ai-trend-verification",
  "windows": [
    {
      "start": "2026-01-01",
      "end": "2026-03-31",
      "id": "q1"
    },
    {
      "start": "2026-04-01",
      "end": "2026-06-30",
      "id": "q2"
    },
    {
      "start": "2026-07-01",
      "end": "2026-08-09",
      "id": "q3"
    }
  ]
}
```

**Process:**
1. Run analysis for each window separately
2. Compare the three intelligence profiles
3. Look at `timeDisposition` field

**Interpret Results:**

| Signal Appears In | Disposition | Interpretation |
|---|---|---|
| Q1, Q2, Q3 | OBSERVABLY_TRUE | Established trend, consistent |
| Q2, Q3 only | OBSERVABLY_TRUE | Emerging trend, gaining momentum |
| Q3 only | NOT_ESTABLISHED | Single observation, not a trend |
| Q1, Q2 only | Declining | Past investment, less active now |

---

### Task: Compare Two Companies

**Goal:** Understand how Company A and Company B differ in hiring/investment

**Setup:**
```json
{
  "observationId": "company-comparison-2026",
  "startDate": "2026-01-01",
  "endDate": "2026-08-09",
  "companies": ["Company A", "Company B"]
}
```

**In Output, Create Comparison Table:**

| Dimension | Company A | Company B | Winner |
|---|---|---|---|
| Total hiring volume | 120 postings | 85 postings | A (aggressive) |
| AI/ML investment signals | 18 signals | 5 signals | A (leading) |
| Average compensation | $185k | $195k | B (premium) |
| Rust adoption | 12 postings | 2 postings | A (early adopter) |
| Geographic diversity | 8 regions | 3 regions | A (distributed) |

**Trace Key Differences:**
- Pick top 3 signals that differ
- For each, trace to source facts and postings
- Understand why companies differ (budget, strategy, stage)

---

### Task: Monitor Competitor Hiring

**Goal:** Track what competitors are hiring for, especially compared to your company

**Setup:**
```json
{
  "observationId": "competitor-watch-2026",
  "startDate": "2026-06-01",
  "endDate": "2026-08-09",
  "companies": ["Competitor A", "Competitor B", "Competitor C"],
  "keywords": ["infrastructure", "security", "performance", "scalability"]
}
```

**Run Monthly and Track:**

| Month | Main Focus | Hiring Volume | New Signals | Notable Gaps |
|---|---|---|---|---|
| June | Cloud infrastructure | 12 | Kubernetes, Terraform | Security hiring low |
| July | Cloud + AI/ML | 18 | LLMs, vector DB | Still security light |
| Aug | Balanced | 15 | Shifted to observability | Emerging: platform eng |

**Competitive Intelligence Takeaways:**
1. Competitors shifting from infrastructure to AI/ML
2. Security remains de-prioritized (opportunity?)
3. Platform engineering becoming critical

---

### Task: Source Insights for a Blog Post or Report

**Goal:** Create a defensible market analysis for publication

**Setup:**
Standard analysis covering your market segment

**For Each Claim, Include:**
1. **The signal** — What you observed
2. **The evidence** — Posting count and companies
3. **The verification** — Link to observation methodology
4. **The qualifier** — Time period, geographic scope, source limitations

**Example Claim:**
> "Rust adoption for systems programming is growing. We observed 47 job postings mentioning Rust across 12 technology companies (Q1-Q3 2026), up from 18 postings in Q1 2026 alone. This represents a 2.6x increase in hiring focus on Rust-based infrastructure."

**Breakdown:**
- **Signal:** "Rust adoption is growing"
- **Evidence:** "47 postings across 12 companies, Q1-Q3 2026"
- **Verification:** "OBSERVABLY_TRUE across 3 observation windows (Q1, Q2, Q3)"
- **Source data:** "Public job postings from Greenhouse, Lever, Workday"
- **Qualifier:** "Technology companies only; may differ in other industries"

---

## Evidence Verification Workflow

When someone challenges your market analysis:

1. **State the signal** — "We found X is trending"
2. **Cite the count** — "8 postings from 5 companies"
3. **Provide the fact IDs** — "fact:technology:rust:2026-08"
4. **Trace to postings** — "posting:greenhouse:company-a:1024, posting:lever:company-b:2847, ..."
5. **Let them verify** — "You can inspect each job posting to confirm Rust is mentioned"

This full evidence chain makes your analysis defensible and reproducible.

---

## Troubleshooting Quick Reference

| Problem | Cause | Solution |
|---|---|---|
| No output generated | Invalid JSON syntax | Validate JSON: `jsonlint scope.json` |
| "Private source rejected" | Included internal jobs | Use only public job boards (Greenhouse, Lever, Workday) |
| Signals seem low | Single observation window | Run multiple time windows, compare profiles |
| Can't find source posting | Broken ID reference | Verify ID format: `posting:source:company:id` |
| Compensation fact missing | No salary in posting | Postings must include explicit salary ranges |
| Technology not recognized | Named too specifically | System recognizes major technologies; use standard names |
| Pattern confidence low | Too few supporting signals | Expand observation scope (more companies/time) |

---

## Key Files and Folders

| Location | Purpose | When to Use |
|---|---|---|
| `docs/MARKET_ANALYSIS_GUIDE.md` | Full reference | Deep dives, detailed questions |
| `docs/EVIDENCE_LINEAGE_GUIDE.md` | Evidence tracing | Verifying claims, understanding sources |
| `docs/QUICK_START.md` | This file | Fast lookup, common tasks |
| `features/` | Scenario definitions | Understanding the 13 analysis steps |
| `fixtures/` | Example analyses | Sample output format |
| `governance/` | Evidence rules | Understanding constraints and policies |

---

## Next Steps

1. **For your first analysis:** Follow the 5-minute setup above
2. **For deeper understanding:** Read MARKET_ANALYSIS_GUIDE.md
3. **For evidence questions:** Read EVIDENCE_LINEAGE_GUIDE.md
4. **For production reports:** Use the Evidence Verification Workflow section

---

Need help? Check:
- README.md for technical architecture
- governance/ folder for policy details
- fixtures/ folder for example output formats

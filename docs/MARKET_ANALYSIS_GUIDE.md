# Job Market Intelligence: Market Analysis Guide

## Overview

The Job Market Intelligence application is a Scenario-Driven Architecture (SDA) system that analyzes public job postings to derive evidence-backed market insights. Rather than treating job market data as point-in-time trends, this system maintains rigorous evidence lineage, ensuring every insight can be traced back to the public job postings that support it.

## What This App Does

The application processes job postings through a structured analysis pipeline:

1. **Discovers** public job opportunity references from specified sources
2. **Acquires** the full job posting documents
3. **Canonicalizes** postings into a normalized format
4. **Extracts** structured facts: compensation, competencies, technologies, and business problems
5. **Generates** market signals based on observed patterns
6. **Detects** trends and patterns in organizational investment
7. **Projects** a final market intelligence profile with analyst insights

At each step, evidence lineage is preserved—every signal, pattern, and inference identifies the original job postings that support it.

## How to Use This App for Market Analysis

### Step 1: Define Your Observation Scope

Create an observation scope JSON that specifies:
- Which companies or job boards to observe
- Date ranges (start and end dates)
- Geographic regions (if applicable)
- Job categories or role types to focus on

**Example observation scope:**
```json
{
  "observationId": "my-market-analysis-001",
  "startDate": "2026-01-01",
  "endDate": "2026-08-09",
  "sources": [
    {
      "sourceType": "ATS",
      "vendor": "Greenhouse",
      "companies": ["TechCorp", "InnovateLabs"]
    }
  ],
  "jobCategories": ["Engineering", "Product", "Data Science"],
  "regions": ["US-CA", "US-NY"]
}
```

### Step 2: Run the Analysis

The application processes your observation through a 13-scenario pipeline. You can trigger this via the projected runtime (Node.js, C#, or Python).

**Using Node.js:**
```bash
node projected/node/capability.projected.mjs --input observation-scope.json
```

**Using Python:**
```bash
python projected/python/consumer.generated.py --input observation-scope.json
```

**Using C#:**
```bash
dotnet run --project projected/csharp/ProjectedConsumer.generated.csproj -- --input observation-scope.json
```

### Step 3: Interpret the Output

The system produces a `JobMarketIntelligenceProfile` containing:

#### Market Signals
Evidence-backed signals indicating organizational investment and capability demand. Each signal includes:
- **Signal type**: e.g., "increasing-data-science-demand", "cloud-infrastructure-focus"
- **Source evidence**: The observed facts (job postings) supporting this signal
- **Fact identities**: References to specific compensation, technology, or competency facts
- **Confidence level**: Based on observation frequency

#### Market Patterns
Patterns detected from longitudinal aggregates:
- **Pattern classification**: Strategic trends, emerging technologies, skill gaps
- **Supporting signals**: Which market signals led to this pattern
- **Time disposition**: Whether change-over-time is established or just a single observation

#### Analyst Experience View
A structured view specifically designed for analysts:
- **Organizational investment signals** with complete source lineage
- **Capability demand signals** with fact identities
- **Change-over-time disposition**: 
  - `OBSERVABLY_TRUE` — Change is demonstrated across multiple observation windows
  - `NOT_ESTABLISHED` — Single observation window (not presented as a trend)
  - `CONTRADICTED` — Evidence shows conflicting signals

## How to Include Evidence

Evidence in this system flows through the analysis pipeline with strict lineage guarantees.

### Source Evidence Requirements

All evidence must meet these criteria:

1. **Public Source**: Job postings must be from publicly accessible sources (Greenhouse, Lever, Workday, or web postings)
2. **Structured Data**: Postings should contain fields for:
   - Job title
   - Company/organization
   - Date posted
   - Job description
   - Compensation (salary, equity, benefits)
   - Required skills and competencies
   - Technologies
   - Location

3. **Content Identity**: Each posting is assigned a content hash to track duplication and version changes

### Evidence Lineage Chain

```
Job Posting (Primary Evidence)
    ↓
Canonical Opportunity (normalized with source reference)
    ↓
Observed Facts (compensation, competencies, technologies, business problems)
    ↓
Market Signals (derived from facts)
    ↓
Market Patterns (derived from aggregated signals)
    ↓
Intelligence Profile (final analyst view)
```

At each stage, the system preserves references backward to all supporting evidence.

### Querying Evidence in Output

The output profile includes evidence identity references you can use to:

**Trace a signal to its source:**
```json
{
  "signal": "increased-rust-language-demand",
  "type": "technology-adoption",
  "sourceFactIdentities": [
    "fact:technology:rust:2026-08",
    "fact:technology:rust:2026-07"
  ],
  "confidence": "high",
  "observedPostingsCount": 47
}
```

**Trace a pattern to supporting signals:**
```json
{
  "pattern": "systems-infrastructure-modernization",
  "type": "strategic-trend",
  "supportingSignalIds": [
    "signal:technology:kubernetes",
    "signal:technology:cloud-native",
    "signal:technology:rust"
  ]
}
```

**Link back to original postings:**
```json
{
  "fact": "java-backend-engineer-compensation",
  "type": "compensation",
  "median": 185000,
  "source": "compensation:fact:2026-08",
  "sourcePostingIds": [
    "posting:greenhouse:techcorp:12847",
    "posting:greenhouse:innovatelabs:5021",
    "posting:lever:startupxy:438"
  ]
}
```

### Evidence Governance Policies

The system enforces these evidence policies automatically:

1. **Every observed fact has source evidence** — No fact exists without a backing job posting
2. **Every market signal has observed fact evidence** — No signal inferred without facts
3. **Every market inference has market signal evidence** — Patterns must be grounded in signals
4. **Source facts and inferences remain distinct** — Raw observations never mixed with analysis
5. **Historical observations are not overwritten** — Multiple observation windows create longitudinal insight

These policies are verified at runtime and block any analysis that violates them.

## Running Multiple Analyses for Trend Detection

To establish whether change-over-time exists:

1. **Define overlapping observation windows**
   ```json
   {
     "observationId": "trend-analysis-h2-2026",
     "startDate": "2026-01-01",
     "endDate": "2026-08-09",
     "windows": [
       { "start": "2026-01-01", "end": "2026-03-31", "id": "q1" },
       { "start": "2026-04-01", "end": "2026-06-30", "id": "q2" },
       { "start": "2026-07-01", "end": "2026-08-09", "id": "q3" }
     ]
   }
   ```

2. **Run separate analyses for each window**

3. **Compare the profiles** — The system will mark signals and patterns with their time disposition:
   - Signals appearing in multiple windows show consistent organizational investment
   - New signals in recent windows show emerging trends
   - Disappearing signals show declining areas

## Example: Analyzing AI/ML Infrastructure Demand

### Scenario
You want to understand organizational investment in AI/ML infrastructure across three tech companies.

### Observation Scope
```json
{
  "observationId": "ai-ml-infrastructure-2026-h2",
  "startDate": "2026-06-01",
  "endDate": "2026-08-09",
  "sources": [
    {
      "sourceType": "ATS",
      "vendor": "Greenhouse",
      "companies": ["Company A", "Company B", "Company C"]
    }
  ],
  "jobCategories": ["Engineering", "Infrastructure", "DevOps", "MLOps"],
  "keywords": ["ML", "AI", "LLM", "vector database", "GPU"]
}
```

### Expected Output
The profile will show:

**Market Signals:**
- `increased-llm-infrastructure-specialization` (3 postings reference LLMs)
- `vector-database-adoption` (2 postings require vector DB experience)
- `gpu-workload-capability-demand` (5 postings mention GPU optimization)

**Market Patterns:**
- `enterprise-ai-readiness-investment` (pattern: multiple signals converge on AI infrastructure)
- `talent-gap-vector-embeddings` (pattern: demand exceeds supply signals)

**Analyst View:**
- Organizational investment in AI infrastructure is `OBSERVABLY_TRUE` for Companies A and C
- Company B's investment is still emerging (`single-observation`)
- Capability gaps exist for vector database engineering (high signal, low job posting volume)

### Tracing an Insight
If you want to verify the "gpu-workload-capability-demand" signal:

1. The signal references 5 job posting IDs
2. Navigate to the project's `fixtures/` folder or request the posting details
3. Verify each references GPU optimization, system design at scale, or ML infrastructure
4. This traces the analyst insight directly to observable evidence

## Accessing Raw Evidence and Fixtures

The application includes test fixtures representing different analysis scenarios:

- **adobe-market-intelligence-001.fixture.json** — Single company market analysis
- **multi-company-trend-001.fixture.json** — Multi-company trend detection example
- **rejection-private-source.fixture.json** — Example of rejected evidence (private/internal postings)

These fixtures are useful for:
- Understanding expected output format
- Testing your interpretation of evidence lineage
- Validating custom observation scopes

## Troubleshooting

### "Private source rejection" in output
**Cause:** You included URLs or postings from internal job boards, private career pages, or non-public sources.

**Solution:** The system rejects private sources by design—only public postings are admitted as evidence. Re-run with only public job board data.

### Change-over-time marked as "NOT_ESTABLISHED"
**Cause:** You ran only one observation window.

**Solution:** Run multiple non-overlapping or overlapping analyses across time periods and compare profiles. The system will then establish whether patterns are consistent or changing.

### Missing evidence lineage in output
**Cause:** The profile may truncate evidence chains in summary views.

**Solution:** Use the provided fact/signal identity references to request full lineage details. Every reference is resolvable to source postings.

## Best Practices

1. **Start narrow, expand wide** — Begin with a single company or job board, then gradually expand your observation scope
2. **Use multiple observation windows** — Single snapshots show "what is", multiple windows show "what's changing"
3. **Follow the evidence chain** — When you see a surprising signal, trace back through facts to source postings
4. **Combine with external context** — Market intelligence is strongest when compared with industry reports, surveys, and competitive filings
5. **Document your scope** — Save your observation scope JSON so analyses are reproducible and comparable

## Further Reading

- **README.md** — Technical overview and SDA architecture
- **features/** — The 13 scenarios in Gherkin format
- **governance/** — Detailed evidence policies and rules
- **semantic-authority/** — Transformation and inference rules
- **ontology/** — Domain model and entity relationships

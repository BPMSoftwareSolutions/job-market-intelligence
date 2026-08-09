# Engineering Market Intelligence Report

**Reporting Period:** 2026-07-01T00:00:00Z — 2026-07-31T23:59:59Z
**Generated:** 2026-08-09
**Observation Scope:** `multi-company-input-dependent-intelligence` — organizationIds: [`northstar`, `harbor`], sourceIds: [`greenhouse`, `lever`], maxResultsPerSource: 50
**Organizations Observed:** 2
**Public Sources Observed:** 2
**Job Opportunities Observed:** 2
**Observed Facts:** 10
**Market Signals:** 10
**Market Inferences:** 10

---

# Executive Summary

## Market Overview

Since the previous edition of this report, the derivation pipeline stopped being a stub. Signal resolution, aggregation, and pattern detection now compute real results instead of hardcoded literals — see `docs/SCENARIO_CLASSIFICATION.md`. This edition reflects that: 10 evidence-backed signals (4 technology, 4 competency, 2 business-problem) were genuinely derived from 2 admitted opportunities, each traceable to its source posting and content hash.

What this edition is **not**: a live multi-company market scan. The observation/acquisition circuit (`features/public-job-market-observation.feature`) and the analysis circuit below remain unbridged — this run's input is fixture-shaped (`fixtures/capability-fixtures.authority.json`, `multi-company-input-dependent-intelligence`), not fetched live. That bridge is still the open item noted in the build report.

With only 2 observed opportunities, capability *ranking* is not yet meaningful — every signal here has identical support (1 opportunity, 1 fact). The value in this edition is that the mechanism is now real and auditable, not that the sample is large enough to rank.

**What was observed, by type:**

| Type | Subjects observed |
| --- | --- |
| Technology demand | Go, Kubernetes, Python, Kafka |
| Competency demand | platform engineering, reliability, data infrastructure, stream processing |
| Business-problem demand | developer productivity, real-time analytics |

## Key Market Signals

| Signal | Observation | Evidence Strength | Change Over Time |
| --- | --- | ---: | --- |
| `signal-technology-demand-Kubernetes` | 1 opportunity (northstar), 1 fact | 1 fact / 1 org | NOT_ESTABLISHED |
| `signal-technology-demand-Kafka` | 1 opportunity (harbor), 1 fact | 1 fact / 1 org | NOT_ESTABLISHED |
| `signal-competency-demand-data infrastructure` | 1 opportunity (harbor), 1 fact | 1 fact / 1 org | NOT_ESTABLISHED |
| `signal-business-problem-demand-developer productivity` | 1 opportunity (northstar), 1 fact | 1 fact / 1 org | NOT_ESTABLISHED |

*Evidence Strength is reported as raw counts, not a score — with n=1 per signal, a synthetic score would imply more confidence than the evidence supports.*

## Executive Interpretation

No strategic interpretation is offered beyond what the evidence supports: two companies, observed once, are each investing in one identifiable technical direction (northstar in internal platform/reliability tooling; harbor in streaming data infrastructure). Whether either represents a sustained trend is explicitly `NOT_ESTABLISHED` — see §9.

**Evidence boundary:** Interpretations in this report are derived from admitted market signals. They are not treated as observed facts. Every inference retains a reference to its supporting signal identities (§14).

---

# 1. Observation Coverage

## 1.1 Observation Scope

| Dimension | Value |
| --- | --- |
| Observation period | 2026-07-01T00:00:00Z — 2026-07-31T23:59:59Z |
| Organizations | 2 |
| Sources | 2 |
| Opportunities | 2 |
| Observed facts | 10 |
| Market signals | 10 |
| Inferences | 10 |

## 1.2 Organizations Observed

| Organization | Opportunities | Facts | Signals | First Observed | Last Observed |
| --- | ---: | ---: | ---: | --- | --- |
| northstar | 1 | 5 | 5 | 2026-07-15T12:00:00Z | 2026-07-15T12:00:00Z |
| harbor | 1 | 5 | 5 | 2026-07-20T12:00:00Z | 2026-07-20T12:00:00Z |

## 1.3 Source Coverage

| Source | Organization | Opportunities | Observation Status |
| --- | --- | ---: | --- |
| greenhouse | northstar | 1 | ADMITTED (fixture-shaped input) |
| lever | harbor | 1 | ADMITTED (fixture-shaped input) |

---

# 2. Organizational Investment Intelligence

## 2.1 Highest Observed Investment Areas

Not ranked — 2 organizations, 1 opportunity each. Ranking requires enough opportunities per organization that "highest" means something.

## 2.2 Investment Interpretation

Each organization's one observed opportunity maps to one declared organizational-intent value. That is real (see below), but it is one data point per company, not a trend.

## 2.3 Investment by Organization

### northstar

**Observed opportunities:** 1
**Observed compensation evidence:** $180,000–$220,000/year (Platform Engineer, staff)
**Primary capabilities:** platform engineering, reliability
**Primary technologies:** Go, Kubernetes
**Primary business problems:** developer productivity

#### Organizational Investment Assessment

The admitted evidence: role "Platform Engineer," organizational intent `scale-internal-platform`, backed by one posting.

**Supporting fact ID:** `fact-northstar-101-organizational-intent`
**Source evidence:** `greenhouse` · `https://boards.greenhouse.io/northstar/jobs/101` · SHA-256 `90868bde8c637c92422ca3c50e20f21cba20c483cbb380a260efb85c702f27db`

### harbor

**Observed opportunities:** 1
**Observed compensation evidence:** $165,000–$205,000/year (Data Infrastructure Engineer, senior)
**Primary capabilities:** data infrastructure, stream processing
**Primary technologies:** Python, Kafka
**Primary business problems:** real-time analytics

#### Organizational Investment Assessment

The admitted evidence: role "Data Infrastructure Engineer," organizational intent `expand-streaming-data-capability`, backed by one posting.

**Supporting fact ID:** `fact-harbor-202-organizational-intent`
**Source evidence:** `lever` · `https://jobs.lever.co/harbor/202` · SHA-256 `042b0d223355422b9206089784d3302113b8d22f672d8835716773972d47146f`

---

# 3. Capability Demand

## 3.1 Most Frequently Observed Capabilities

Not ranked (§2.1 reasoning applies identically here — every competency signal has count 1).

## 3.2 Capability Demand Analysis

Real, derived signals exist for `platform engineering`, `reliability` (northstar) and `data infrastructure`, `stream processing` (harbor) — each traced to `fact-{opportunityId}-competencies`. This is the first edition where these signals were computed rather than copy-pasted from the input; see §16 Rule 6 for why the previous edition left this section empty instead.

## 3.3 Emerging Capabilities

Not populated — "emerging" requires comparison against a prior window (§9), and this window's `priorAggregates` is `[]`.

## 3.4 Capability Co-Occurrence

Not populated — co-occurrence analysis (`competency-co-occurrence` in the query catalog) is declared but not implemented.

---

# 4. Technology Demand

## 4.1 Most Frequently Observed Technologies

| Technology | Opportunities | Organizations | Signal ID |
| --- | ---: | ---: | --- |
| Go | 1 | 1 (northstar) | `signal-technology-demand-Go` |
| Kubernetes | 1 | 1 (northstar) | `signal-technology-demand-Kubernetes` |
| Python | 1 | 1 (harbor) | `signal-technology-demand-Python` |
| Kafka | 1 | 1 (harbor) | `signal-technology-demand-Kafka` |

Not ranked by strength — all four are tied at n=1.

## 4.2 Technology Demand Analysis

Real signals, each independently addressable and evidence-backed (§15 shows one drilled all the way to source).

## 4.3 Technology → Capability Relationships

### Kubernetes

Observed in connection with: `platform engineering`, `reliability` (same opportunity, northstar-101).

**Observed opportunities:** 1
**Organizations:** 1
**Supporting fact ID:** `fact-northstar-101-technologies`

### Interpretation

One data point is not enough to distinguish "Kubernetes demand reflects platform-engineering investment" from "Kubernetes demand reflects generic infrastructure hiring" — the distinction this system is built to eventually draw (§ conceptually, the audit report's "technology → capability" framing) requires more opportunities than this window has.

---

# 5. Business Problem Intelligence

## 5.1 Most Frequently Funded Business Problems

| Business Problem | Organizations | Opportunities | Signal ID |
| --- | ---: | ---: | --- |
| developer productivity | 1 (northstar) | 1 | `signal-business-problem-demand-developer productivity` |
| real-time analytics | 1 (harbor) | 1 | `signal-business-problem-demand-real-time analytics` |

## 5.2 Business Problem Analysis

Both signals are real and newly derivable — business-problem facts previously fed nothing downstream; they now flow into signal derivation the same way technology and competency facts do.

## 5.3 Problem → Capability → Technology

### real-time analytics (harbor)

**Capabilities being hired:** data infrastructure, stream processing
**Technologies associated with the hiring:** Python, Kafka
**Organizations exhibiting the signal:** harbor
**Supporting signal IDs:** `signal-business-problem-demand-real-time analytics`, `signal-competency-demand-data infrastructure`, `signal-competency-demand-stream processing`, `signal-technology-demand-Python`, `signal-technology-demand-Kafka`

---

# 6. Compensation Intelligence

## 6.1 Compensation by Capability

Not populated. Compensation facts exist and are real (§2.3 shows them), but they are not yet correlated to capability signals — `highest-compensation-by-capability` is declared in the query catalog with `"status": "DECLARED"`, not implemented. Doing this honestly requires joining compensation facts to signals by `opportunityId`, which hasn't been built.

## 6.2 Compensation by Role Family

| Role Family | Opportunities | Compensation Evidence |
| --- | ---: | --- |
| Platform Engineer (staff) | 1 | $180,000–$220,000/year |
| Data Infrastructure Engineer (senior) | 1 | $165,000–$205,000/year |

## 6.3 Highest-Value Capability Signals

Not answerable this edition — see §6.1.

---

# 7. Seniority & Organizational Commitment

## 7.1 Hiring by Seniority

| Seniority | Opportunities |
| --- | ---: |
| Staff | 1 (northstar) |
| Senior | 1 (harbor) |

## 7.2 Senior-Level Investment Signals

Not interpreted — one posting per seniority band per company is not repetition, so "repeated senior-level hiring" (the pattern this section is meant to detect) has no evidence either way yet.

---

# 8. Company Comparison

## 8.1 Capability Comparison

| Capability | northstar | harbor |
| --- | ---: | ---: |
| Platform/reliability engineering | ✓ (1 opportunity) | — |
| Data infrastructure/stream processing | — | ✓ (1 opportunity) |

## 8.2 Technology Comparison

| Technology | northstar | harbor |
| --- | ---: | ---: |
| Go, Kubernetes | ✓ | — |
| Python, Kafka | — | ✓ |

## 8.3 Strategic Differentiation

### northstar
Observed investment: internal platform engineering (`scale-internal-platform`).

### harbor
Observed investment: streaming data capability (`expand-streaming-data-capability`).

## 8.4 Comparative Inference

None offered — two companies with zero technology/capability overlap in a 2-opportunity sample isn't evidence of differing strategy; it's the expected result of a 1-posting-per-company sample. A real comparative claim needs enough postings per company that overlap or its absence is meaningful.

---

# 9. Change Over Time

## 9.1 / 9.2 Capability and Technology Trends

Not established for the northstar/harbor window above — `priorAggregates` was `[]`, so every pattern computed `NOT_ESTABLISHED` (§16 Rule 5).

## 9.3 Trend Interpretation — the mechanism, demonstrated on a separate window

A **different** fixture (`established-change-across-observation-windows`, organization `vector`, not part of the northstar/harbor data above) exists specifically to prove the `ESTABLISHED` path is real and reachable, not just theoretically possible:

| Subject | Prior window (2026-07) | Current window (2026-08) | Disposition |
| --- | --- | --- | --- |
| Rust | present (`aggregate-signal-technology-demand-Rust-2026-07`, supplied as `priorAggregates`) | present (`vector-301`) | **ESTABLISHED** |
| WebAssembly | absent from `priorAggregates` | present (`vector-301`) | NOT_ESTABLISHED |

Resulting `analystExperience.changeOverTime`: `{"disposition": "ESTABLISHED", "reason": "1 of 2 observed demand patterns are established across compared observation windows."}` — computed, not hardcoded; verified through the real SDA compiler, all three language targets, and the experience-closure proof (`OBSERVABLY_TRUE`).

This is presented separately, not blended into the executive summary above, because `vector` was never part of the same observation as `northstar`/`harbor` — merging them would fabricate a longitudinal relationship that doesn't exist.

---

# 10. Emerging Market Signals

Not populated for this window (no repeat observations yet). §9.3 is the demonstration that the mechanism exists.

---

# 11. Organizational Intent

## 11.1 Observed Intent Signals

| Organization | Intent Signal | Evidence Facts | Supporting Opportunities |
| --- | --- | ---: | ---: |
| northstar | scale-internal-platform | 1 | 1 |
| harbor | expand-streaming-data-capability | 1 | 1 |

## 11.2 Organizational Intent Analysis

Both intent values are copied directly from the admitted posting's `organizationalIntent` field (see §16 Rule 4 — this is not derived/classified by the system, it's carried through as stated by the source).

---

# 12. Go-to-Market Intelligence

Not populated. GTM whitespace analysis (`gtm-whitespace` in the query catalog) is declared, not implemented, and would need business-problem signals correlated across many more organizations than 2 to say anything about market whitespace.

---

# 13. Career Market Intelligence

Not populated — requires a separate admitted candidate-evidence authority, out of scope for this report (§13.3 of the template).

---

# 14. Market Inferences

## Inference: Kafka demand

**Inference ID:** `inference-aggregate-signal-technology-demand-Kafka`

### Conclusion
"Observed hiring demand references Kafka."

### Supporting Signals
* `signal-technology-demand-Kafka`

### Evidence Assessment
Disposition `NOT_ESTABLISHED` — single observation window, no prior data supplied. Retrieved live via the new query CLI (`sda-json-query-cli.v1`, `market-inference-evidence`):

```json
{"inference":{"inferenceId":"inference-aggregate-signal-technology-demand-Kafka","inferenceType":"observed-technology-demand","statement":"Observed hiring demand references Kafka.","supportingSignalIds":["signal-technology-demand-Kafka"],"disposition":"NOT_ESTABLISHED"},"supportingSignals":[{"signalId":"signal-technology-demand-Kafka","signalType":"technology-demand","subject":"Kafka","evidenceFactIds":["fact-harbor-202-technologies"],"dimensions":{"organizationIds":["harbor"],"opportunityCount":1},"observedWindow":{"from":"2026-07-01T00:00:00Z","to":"2026-07-31T23:59:59Z"}}]}
```

---

# 15. Evidence Drill-Down

## Market Signal: Kubernetes demand

**Signal ID:** `signal-technology-demand-Kubernetes`

Retrieved live via `sda-json-query-cli.v1`, query `market-signal-evidence`:

### Evidence Facts

| Fact ID | Opportunity | Fact Type | Value | Observed At |
| --- | --- | --- | --- | --- |
| `fact-northstar-101-technologies` | `northstar-101` | technology | `["Go","Kubernetes"]` | 2026-07-15T12:00:00Z |

### Source Evidence

| Opportunity | Source | Source Reference | Content SHA-256 |
| --- | --- | --- | --- |
| `northstar-101` | greenhouse | `https://boards.greenhouse.io/northstar/jobs/101` | `90868bde8c637c92422ca3c50e20f21cba20c483cbb380a260efb85c702f27db` |

This is the full chain, walked for real: signal → `evidenceFactIds` → fact → `sourceEvidence` → source reference + content digest. Nothing in this section is summarized from memory — it's the literal output of the query.

---

# 16. Evidence Governance

All intelligence in this report follows these boundaries:

1. **Observed facts remain distinct from derived market signals.**
2. **Market signals retain their `evidenceFactIds`.**
3. **Market inferences retain their supporting signal IDs.**
4. **Organizational intent is not presented as directly observed unless explicitly stated by source evidence.**
5. **Change over time is `ESTABLISHED` only when longitudinal evidence supports it; otherwise it is `NOT_ESTABLISHED`.**
6. **Unsupported conclusions must not be promoted into market intelligence.** — This is why §§2.1, 3.1, 6, 10, 12, 13 above say "not populated" instead of showing a ranking or trend that two data points can't support.
7. **Private or disallowed acquisition sources are rejected according to source acquisition authority.**

---

# 17. Methodology

## Observation

```text
Public Source
    ↓
External Observation      -- real, live, but not yet feeding this report (see Market Overview)
    ↓
Observed Representation
    ↓
Canonical Job Opportunity
```

## Fact Resolution — real

```text
Job Opportunity
    ↓
ObservedJobFact
```

## Signal Resolution — real (as of this edition)

Facts are grouped by distinct value across *all* admitted opportunities (not one signal per opportunity — see `docs/SCENARIO_CLASSIFICATION.md`), producing:

```text
evidenceFactIds[]        -- every fact that mentions this subject
dimensions.organizationIds[]
dimensions.opportunityCount
```

## Inference Resolution — real (as of this edition)

```text
MarketSignals (this window)
    ↓ compared against
priorAggregates (caller-supplied, previous window)
    ↓
disposition: ESTABLISHED | NOT_ESTABLISHED
```

---

# 18. Observation Limitations

This edition's specific limitations, in addition to the general list below:

* Two opportunities total. Every ranking, trend, and comparison section above that would normally rank or compare is marked "not populated" or "not ranked" rather than computed on a sample too small to support it.
* The observation/acquisition circuit and this analysis circuit are not yet bridged — this report's input is fixture-shaped, not fetched live.
* Compensation is not yet correlated to capability/technology signals (§6).
* Only technology, competency, and business-problem facts feed signal derivation. Compensation and organizational-intent facts do not yet produce their own signals.
* 7 of 10 declared queries (`contracts/query-catalog.contract.json`) are not implemented.

General limitations:

* incomplete source coverage;
* organizations using unobserved recruiting systems;
* removed or short-lived postings;
* duplicated postings;
* geographic compensation differences;
* incomplete compensation disclosure;
* differences between advertised requirements and actual organizational practice;
* insufficient historical observations for trend establishment.

Absence of observed evidence does not establish absence of market activity.

---

# 19. Intelligence Confidence

| Intelligence Claim | Evidence Coverage | Temporal Coverage | Disposition |
| --- | --- | --- | --- |
| northstar is investing in internal platform engineering | 1 opportunity, 1 fact per dimension | single window | Observed, not established as trend |
| harbor is investing in streaming data infrastructure | 1 opportunity, 1 fact per dimension | single window | Observed, not established as trend |
| Rust demand is an established pattern (vector, separate window) | 1 opportunity + 1 prior-window aggregate | 2 compared windows | **ESTABLISHED** (§9.3) |

---

# 20. Final Market Assessment

## What Organizations Are Funding
northstar: internal platform/reliability tooling. harbor: streaming data infrastructure. Two data points, stated plainly rather than generalized.

## What Capabilities Are Gaining Demand
Not answerable — "gaining" requires a trend, and §9 shows this window alone doesn't establish one.

## What Technologies Are Enabling That Demand
Go and Kubernetes (northstar); Python and Kafka (harbor) — observed, not ranked.

## What Business Problems Are Driving Investment
Developer productivity (northstar); real-time analytics (harbor).

## What This Suggests for Engineering Leaders
Nothing generalizable yet from n=2. What's demonstrated instead: the report now refuses to rank, trend, or compare when the evidence doesn't support it (§16 Rule 6), rather than filling these sections with confident-sounding prose.

## What This Suggests for Product & GTM Leaders
Same caveat as above.

## What This Suggests for Engineering Careers
Same caveat as above.

---

# Evidence Summary

```text
Organizations observed:     2
Sources observed:           2
Opportunities observed:     2
Observed facts admitted:    10
Market signals resolved:    10 (4 technology, 4 competency, 2 business-problem)
Market inferences resolved: 10
```

## Evidence Lineage

```text
External Public Source                    proven live (separate circuit; not yet bridged into this report)
        ↓
Observed Representation                   proven live (separate circuit)
        ↓
Job Opportunity                           real, fixture-shaped input this edition
        ↓
Observed Job Fact                         real -- 10 facts, 5 types
        ↓
Market Signal                             real -- cross-posting grouping, not 1:1 relabeling
        ↓
Market Inference                          real -- ESTABLISHED/NOT_ESTABLISHED computed against priorAggregates
        ↓
Query Interface                           real -- sda-json-query-cli.v1, 3 of 10 declared queries implemented
```

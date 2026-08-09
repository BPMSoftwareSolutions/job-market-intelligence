# Scenario Classification

Applies the test — *does this scenario's `Then` establish a genuinely new semantic
state that was not already true at its `Given`?* — to all 13 existing scenarios in
`features/job-market-intelligence.feature`, against their **actual transformation
expressions** in `semantic-authority/transformations.authority.json`, not their names.

## Finding that governs this whole classification

Reading the real expressions behind scenarios 2–12 (not just their Gherkin prose)
shows the pipeline is currently almost entirely reshaping, not derivation:

| Scenario | Name implies | Expression actually does |
| --- | --- | --- |
| discover-job-opportunity-references | discovering references | relabels `publicSourceObservations[]` the caller already supplied |
| acquire-job-posting | acquiring postings | repackages fields already present into a `sourceEvidence[]` shape |
| admit-job-opportunity | admitting/validating opportunities | field selection; no dedup/rejection logic in the expression |
| resolve-compensation (and the 4 siblings) | extracting facts | `value = opportunity.compensation` — a straight copy, already pre-supplied |
| resolve-market-signals | resolving signals | maps 1:1 over `technologyFacts` only; `evidenceFactIds` is always a single fact, never an aggregation |
| aggregate-market-observations | aggregating | `count: { "op": "literal", "value": 1 }` — hardcoded, not computed |
| detect-market-patterns | detecting patterns | `inferenceType` and `confidenceDisposition` are hardcoded literals; no comparison logic |
| project-market-intelligence | projecting intelligence | `changeOverTime.disposition` is hardcoded `"NOT_ESTABLISHED"`, always, regardless of input |

This matters directly for classification: several scenarios are structurally the
*right future shape* for real semantic work (signal derivation, longitudinal
comparison, pattern detection) but currently contain none. The table below
classifies them by their **intended obligation**, and flags where the current
implementation is a stub that needs real logic before the classification is fully
honest.

## Classification table

| # | Scenario | Given → Then (current) | Semantic obligation established | Classification | Reason | Proposed owner |
|---|---|---|---|---|---|---|
| 1 | Begin a bounded market observation | admitted scope → "one bounded observation state is produced" | None — `begin-market-observation.v1` is `{op:"path", from:"input"}`, pure identity | SEMANTIC_RESPONSIBILITY | Entry-point formality; zero transformation | Opening step of **Scenario A** |
| 2 | Discover public job opportunity references | bounded state → "reference set with source lineage" | None — relabels caller-supplied data | SEMANTIC_RESPONSIBILITY | Nothing is discovered; everything was already given | Folded into **Scenario A** |
| 3 | Acquire public job postings | references → "postings with content identity" | None — repackages already-present fields | SEMANTIC_RESPONSIBILITY | No real acquisition happens here (that capability exists for real, but only in the separate `public-job-market-observation.feature` circuit) | Folded into **Scenario A** |
| 4 | Admit canonical job opportunities | postings → "normalized opportunities retaining source evidence" | None computed — field selection only | SEMANTIC_RESPONSIBILITY | "Admission" here is shape conformance, not a computed decision | Folded into **Scenario A** |
| 5 | Resolve observed compensation facts | opportunities → "compensation facts" | None — `value` is a direct copy of `opportunity.compensation` | SEMANTIC_RESPONSIBILITY | Copies an already-present field into a Fact envelope | Folded into **Scenario A** |
| 6 | Resolve observed competency facts | — | None — same copy-through pattern | SEMANTIC_RESPONSIBILITY | Same as #5 | Folded into **Scenario A** |
| 7 | Resolve observed technology facts | — | None — same copy-through pattern | SEMANTIC_RESPONSIBILITY | Same as #5 | Folded into **Scenario A** |
| 8 | Resolve observed business problem facts | — | None — same copy-through pattern | SEMANTIC_RESPONSIBILITY | Same as #5 | Folded into **Scenario A** |
| 9 | Resolve bounded organizational intent | facts → "bounded intent facts" | None — "classified" is aspirational; `value = opportunity.organizationalIntent`, pre-supplied | SEMANTIC_RESPONSIBILITY | Same copy-through pattern | Folded into **Scenario A** |
| 10 | Resolve market signals | facts → "evidence-backed market signals" | **In principle, yes** — a signal spanning multiple postings is new meaning. **Today: no** — 1:1 map over `technologyFacts` only, one fact per signal | SEMANTIC_RESPONSIBILITY *(today)* — target KEEP_SCENARIO | Right future shape, stub implementation; a first-class ontology object (`market-signal.schema.json`) with its own identity, worth keeping addressable on its own | **Scenario B** |
| 11 | Aggregate market observations | signals → "longitudinal aggregates" | **In principle, yes** — cross-window consistency is new meaning. **Today: no** — `count` is a hardcoded literal `1` | SEMANTIC_RESPONSIBILITY *(today)* — target KEEP_SCENARIO | Stub; conceptually the first half of "is this pattern established" | Folded into **Scenario C** |
| 12 | Detect bounded market patterns | aggregates → "patterns retaining supporting signal identities" | **In principle, yes** — cross-signal convergence into a bounded inference. **Today: no** — `inferenceType`/`confidenceDisposition` are hardcoded literals | SEMANTIC_RESPONSIBILITY *(today)* — target KEEP_SCENARIO | Stub; conceptually the second half of "is this pattern established" — same obligation as #11 | Folded into **Scenario C** |
| 13 | Project market intelligence | patterns → "the analyst can inspect evidence-backed organizational investment and capability demand, including whether change over time is established" | **Yes.** This is the scenario whose outcome is the actual promised product boundary (`JobMarketIntelligenceProfile`, `analystExperience`) | **KEEP_SCENARIO** | Terminal, promise-bearing scenario — the one thing that genuinely becomes newly true. Projection-shaped in spirit, but it's the real product boundary, so it stays a Scenario rather than being demoted | **Scenario D** (terminal) |

## Derived scenario count: 4, not 13

The classification — not a target count — yields four `KEEP_SCENARIO`s for the
existing circuit:

| New scenario | Folds old # | Given (human) | Then (human) |
|---|---|---|---|
| **A — Understand what a company is hiring for** | 1–9 | The companies and hiring period I want to study | I can see the compensation, capabilities, technologies, business problems, and intent represented in their observed hiring activity |
| **B — Resolve evidence-backed market signals** | 10 | Observed job facts across postings | I have evidence-backed signals of market demand, each traceable to the facts behind it |
| **C — Determine whether market demand patterns are established** | 11, 12 | Signals from one or more observation windows | I can see which demand patterns are established by the evidence, and which aren't yet |
| **D — Project market intelligence** | 13 | Evidence-backed signals and patterns | I can inspect evidence-backed organizational investment and capability demand, including whether change over time is established |

**B and C stay separate scenarios**, not folded into A or D, specifically *because*
they're the two places flagged above as "right shape, stub implementation" — they
are where real derivation work (signal binding across postings, longitudinal
comparison) needs to eventually live, and collapsing them into A or D would bury
that obligation rather than making it addressable.

## Query surface (not scenarios)

These read already-established meaning from Scenario D's output
(`JobMarketIntelligenceProfile`) and belong on the existing, currently-unused
`query` interface (`contracts/query-catalog.contract.json`), per your test:

| Proposed query | Why it's a query, not a scenario |
|---|---|
| Rank capabilities by demand | Orders `capabilityDemand`, already established |
| Rank technologies by demand | Same — already established |
| Compare investment across companies | Groups/selects `organizationalInvestment`, already established |
| Show business problems receiving investment | Groups already-established facts |
| Compare compensation across capability areas | Groups already-established facts |
| Show demand changes marked `ESTABLISHED` | Filters an *already-computed* `changeOverTime.disposition` — the computing of that disposition is Scenario C's job, not this query's |
| Drill from a signal or inference to its evidence | Traverses already-established lineage (`supportingSignalIds` → `evidenceFactIds` → `sourceEvidence`) — no new lineage is created |

## Status: implemented

Scenarios A–D are live in `features/job-market-intelligence.feature`, with real
derivation behind B (cross-posting signal binding for technology, competency,
and business-problem facts) and C (longitudinal comparison against caller-supplied
`priorAggregates`, computing a genuine `ESTABLISHED`/`NOT_ESTABLISHED` disposition
instead of a hardcoded literal). Verified through the real SDA compiler for all
three active language targets (Node, C#, Python — `BEHAVIORALLY_EQUIVALENT`) and
the experience-closure proof (`OBSERVABLY_TRUE`). The query surface above is
wired for real via `sda-json-query-cli.v1` (a new generic kernel capability) for
3 of the 10 declared queries; the rest remain `"status": "DECLARED"`.

## Circuit A (`features/public-job-market-observation.feature`) classification

Applying the same test to the 5 observation-circuit scenarios:

| # | Scenario | Semantic obligation | Classification | Reason |
|---|---|---|---|---|
| 1 | Observe a bounded public job market (root) | None — identity transformation | SEMANTIC_RESPONSIBILITY | Same as the main circuit's old root: entry-point formality |
| 2 | Resolve admitted public job sources | Real (filters sourceIds, builds the discovery URL) but preparatory | SEMANTIC_RESPONSIBILITY | Gates and feeds the next real action; not independently valuable on its own |
| 3 | Discover public job references | **Yes** — a real HTTP GET, genuinely new content-addressed evidence | **KEEP_SCENARIO** | "I can review the public job openings found" is a real, standalone experience |
| 4 | Acquire a public job posting | **Yes** — a second real HTTP GET, genuinely new evidence | **KEEP_SCENARIO** | Same reasoning as #3, for the acquired posting itself |
| 5 | Admit observed public posting evidence | None new — pure field selection from #4's output | SEMANTIC_RESPONSIBILITY | Identical pattern to the main circuit's old `admit-canonical-opportunities.v1`: reshaping, not derivation |

Derived count: **2 scenarios**, not 5:

| New scenario | Folds old # | Then |
|---|---|---|
| **Collect current hiring activity for selected companies** | 1, 2, 3 | I can review the public job openings found within my observation scope |
| **Acquire and admit a public job posting as evidence** | 4, 5 | I can inspect one canonical, evidence-backed job posting, traceable to its source and content identity |

Implemented and re-verified live against Greenhouse's own board (see the build report).

**Explicitly not implemented** (would require new capability, not just reclassification):
"Respect source access policy" as its own observable governance moment (today,
private/disallowed sources are rejected only via contract/schema admission, not
a distinct scenario step), and "Recognize changed postings" (content-hash-based
change detection across multiple observations over time — no persistence
mechanism exists yet for Circuit A the way `priorAggregates` now exists for
Circuit B). Both are real, named gaps, not silently dropped.

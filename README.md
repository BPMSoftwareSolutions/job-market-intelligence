# Job Market Intelligence — SDA consumer workspace

This workspace is a projection-only Job Market Intelligence application for
Scenario-Driven Architecture (SDA). Public job postings are treated as
observable evidence. Acquisition, canonicalization, fact resolution, signal
formation, aggregation, bounded inference, and intelligence projection remain
declarative authority; executable mechanics are supplied by admitted SDA
platform capabilities.

## Three admitted workspaces

This directory holds three independently-compiled SDA consumer workspaces, each
with its own root, fixtures, and promised experience:

```text
job-market-intelligence/                          (this directory's own root capability)
  resolve-job-market-intelligence
    JobMarketObservationScope (caller-supplied publicSourceObservations)
      → resolve-job-market-intelligence   (ingest + resolve compensation/competency/
                                            technology/business-problem/intent facts)
      → resolve-market-signals            (real cross-posting signal derivation)
      → detect-established-market-patterns (real ESTABLISHED/NOT_ESTABLISHED vs.
                                             caller-supplied priorAggregates)
      → project-market-intelligence
      → JobMarketIntelligenceProfile

capabilities/observe-public-job-market/            (its own workspace, own compiler run)
  observe-public-job-market
    JobMarketObservationRequest (organizationIds, sourceIds, targetOpportunityId)
      → collect-current-hiring-activity    (real HTTP: discover + resolve sources)
      → acquire-and-admit-posting-evidence (real HTTP: acquire one live posting,
                                             admit title/organization/location/
                                             descriptionHtml as evidence)
      → ObservedJobPostingEvidence

capabilities/observe-and-resolve-job-market-intelligence/  (its own workspace)
  observe-and-resolve-job-market-intelligence
    JobMarketObservationRequest
      → invokes observe-public-job-market live (sda-projected-capability-invocation-port.v1)
      → wraps the real evidence into a JobMarketObservationScope -- facts this
        circuit cannot yet extract from live posting content (compensation,
        competencies, technologies, business problems, organizational intent)
        are carried through as null/empty, never fabricated
      → invokes resolve-job-market-intelligence live on that wrapped scope
      → JobMarketIntelligenceProfile (honestly empty signals until extraction exists)
```

The bridge is a fourth, thin orchestrating capability deliberately kept separate
from the other two -- neither's own root or fixtures changed to make it possible,
so both keep the exact conformance they had before the bridge existed. See
`docs/SCENARIO_CLASSIFICATION.md` for why the graph looks like this instead of a
literal transcription of the old 13-scenario pipeline.

Each node conforms to the kernel law:

```text
Scenario = Input + Event + Outcome
Data → Action → Experience
```

The graph contains 4 scenarios and 3 explicit transitions -- collapsed from an
earlier 13-scenario shape whose Gherkin described internal pipeline states
rather than analyst-observable outcomes; see docs/SCENARIO_CLASSIFICATION.md
for the classification each scenario boundary was derived from. Market signals
cite observed fact identities, and market inferences cite supporting signal
identities. Rankings, comparisons, and evidence drill-downs over an
already-projected profile are queries (contracts/query-catalog.contract.json),
not scenarios.

## Promised analyst experience

The terminal outcome is not treated as “JSON was returned.” The capability
promises that a market analyst can inspect evidence-backed organizational
investment and capability demand without a bounded observation being
misrepresented as change over time.

The projected profile therefore exposes an `analystExperience` view containing:

- organizational-investment signals with source and fact lineage;
- capability-demand signals with supporting fact identities;
- an explicit change-over-time disposition. A single observation window is
  reported as `NOT_ESTABLISHED`, rather than being presented as a trend.

Each observable condition is bound to runtime fixture assertions. The generated
experience-closure proof is admitted only when every promised condition is
observed in every canonical fixture.

## Projection-only boundary

Consumer-authored executable files are prohibited. The authored surface is
limited to Gherkin, JSON authority, JSON Schema, fixtures, projection profiles,
and documentation. The `projected/` directory is disposable and is generated
by SDA.

The active executable proof targets are Node, C#, and Python. All three are projected from
the same unchanged scenario, contract, fixture, ontology, and transformation
authority. Java remains a declared projection profile; activating it requires
its consumer projector to be admitted in SDA. No
consumer-side glue code is permitted as a workaround.

## Build and verify

From `C:\lab\repos\scenario-driven-architecture`:

```powershell
node tools\consumer-projection\projects-consumer-capability.js C:\lab\repos\job-market-intelligence --targets=node,csharp,python
node --test C:\lab\repos\job-market-intelligence\projected\node\capability.projected.test.mjs
dotnet run --project C:\lab\repos\job-market-intelligence\projected\csharp\ProjectedConsumer.generated.csproj -- --test
$env:PYTHONPATH='C:\lab\repos\scenario-driven-architecture\languages\python\src'
python C:\lab\repos\job-market-intelligence\projected\python\consumer.generated.py --test
node tools\consumer-projection\observes-consumer-projection-equivalence.js C:\lab\repos\job-market-intelligence --targets=node,csharp,python
node tools\consumer-projection\observes-consumer-experience-closure.js C:\lab\repos\job-market-intelligence --no-project
node tools\consumer-projection\observes-consumer-query-catalog.js C:\lab\repos\job-market-intelligence contracts/query-catalog.contract.json --no-project
```

The generated suite proves:

- all 4 scenarios execute through one root execution lineage;
- all required platform mechanics resolve to admitted SDA capabilities;
- the projected runtime passes mechanical-sterility inspection;
- Adobe and multi-company inputs produce different, schema-admitted profiles;
- signals preserve observed-fact lineage;
- inferences preserve supporting-signal lineage;
- no handwritten consumer executable is present;
- Node, C#, and Python produce canonical-equivalent terminal outcomes and preserve
  identical scenario lineage for all canonical fixtures.
- the promised analyst experience has disposition `OBSERVABLY_TRUE`, with every
  declared condition tied to actual runtime output.
- all 10 inspectable queries execute over projected output, including the seven
  previously missing orientations, with disposition
  `ALL_IMPLEMENTED_QUERIES_OBSERVED`.

The private-source rejection vector remains in
`fixtures/rejection-private-source.fixture.json` as acquisition-governance
authority. Current SDA execution-closure conformance requires a complete
five-step trace and therefore does not classify input-admission rejection as an
admitted successful circuit.

## Authority layout

- `features/` — canonical Gherkin scenario network.
- `capabilities/` — root capability and scenario authorities.
- `ontology/` — canonical market ontology and relationships.
- `sources/` — Adobe, Greenhouse, Lever, and Workday source authority.
- `schemas/` and `contracts/` — domain and runtime admission contracts.
- `semantic-authority/` — graph, execution, transformation, and interface authority.
- `fixtures/` — positive conformance and governance-rejection vectors.
- `governance/` — acquisition, zero-code, lineage, and inference policy.
- `projections/` — C#, Node, Python, and Java projection declarations.
- `projected/` — disposable SDA-generated runtime, tests, telemetry, and evidence.

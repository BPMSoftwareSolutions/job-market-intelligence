# Buildout and admission status

## Admitted first slice

- [x] Workspace authority resolves against `consumer-workspace-authority.v1`.
- [x] Canonical Gherkin projects 13 scenarios and 12 explicit transitions.
- [x] Every scenario preserves Input + Event + Outcome.
- [x] All scenario events resolve to owned execution authority.
- [x] All executable events bind to admitted SDA transformation mechanics.
- [x] Input, intermediate state, signal, and final profile contracts are schema-admitted.
- [x] Adobe public-source fixture executes through the full circuit.
- [x] Multi-company fixture proves input-dependent projection.
- [x] Observed facts retain source URL, content digest, and observation time.
- [x] Market signals cite observed fact identities.
- [x] Market inferences cite supporting signal identities.
- [x] Generated projection passes mechanical-sterility inspection.
- [x] Workspace executable-origin disposition is `PROJECTED_ONLY`.
- [x] Generated Node conformance tests pass.
- [x] The unchanged authority projects into an admitted C# consumer application.
- [x] Generated C# conformance proof passes both canonical fixtures.
- [x] The unchanged authority projects into an admitted Python consumer application.
- [x] Generated Python conformance proof passes 13 scenarios and both canonical fixtures.
- [x] Node, C#, and Python terminal outcomes and scenario lineages are equivalent.
- [x] Cross-language equivalence is recorded as `consumer-projection-equivalence.v1`.
- [x] The capability declares its promised analyst experience separately from its data contract.
- [x] Organizational investment is visible in the terminal analyst experience.
- [x] Capability demand and supporting fact lineage are inspectable.
- [x] Single-window observations explicitly report change over time as `NOT_ESTABLISHED`.
- [x] Runtime-observed experience closure is `OBSERVABLY_TRUE` for both canonical fixtures.

## Governance authority retained

- [x] Adobe, Greenhouse, Lever, and Workday source authorities.
- [x] Public-source access, robots, rate-limit, and terms policy.
- [x] Private/authenticated-source rejection vector.
- [x] Evidence-lineage and bounded-inference policy.
- [x] SQL/storage projection contract and inspectable query catalog.
- [x] Career, GTM, competitive, investment, and trend projection contracts.
- [x] CLI, HTTP, MCP, scheduled-observation, and query interface family authority.
- [x] C#, Node, Python, and Java projection profile declarations.

## Current platform boundary

The current SDA consumer compiler projects executable Node, C#, and Python
consumers and admits their JSON CLI delivery capabilities. HTTP, MCP, scheduled
observation, SQL delivery, and the Java consumer projector remain declared
downstream authorities, not falsely claimed as active implementations.

They become admitted only when SDA supplies matching platform capabilities and
projectors. Projection-only law forbids filling those gaps with handwritten
consumer adapters.

## Admission command

Run from `C:\lab\repos\scenario-driven-architecture`:

```powershell
node tools\consumer-projection\projects-consumer-capability.js C:\lab\repos\job-market-intelligence --targets=node,csharp,python
node --test C:\lab\repos\job-market-intelligence\projected\node\capability.projected.test.mjs
dotnet run --project C:\lab\repos\job-market-intelligence\projected\csharp\ProjectedConsumer.generated.csproj -- --test
$env:PYTHONPATH='C:\lab\repos\scenario-driven-architecture\languages\python\src'
python C:\lab\repos\job-market-intelligence\projected\python\consumer.generated.py --test
node tools\consumer-projection\observes-consumer-projection-equivalence.js C:\lab\repos\job-market-intelligence --targets=node,csharp,python
node tools\consumer-projection\observes-consumer-experience-closure.js C:\lab\repos\job-market-intelligence --no-project
```

Expected result: 13 scenarios, 12 transitions, Node, C#, and Python mechanic
resolution, all generated tests passing, `BEHAVIORALLY_EQUIVALENT` outcomes,
and an `OBSERVABLY_TRUE` promised-experience closure.

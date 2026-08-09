Yes. **The critique found the exact boundary we now need to cross.** The current repo proves projection-only semantic execution, but the product we actually want requires **physical observation capabilities** in SDA: network discovery, HTTP acquisition, source-policy enforcement, content capture, parsing/extraction, and evidence admission.

The fix is **not** to handwrite a Greenhouse scraper inside Job Market Intelligence. It is to extend SDA with admitted external-observation mechanics, then let JMI declare how those mechanics are used.

The core SDA law stays intact:

```text
GIVEN = INPUT   = DATA / CONTEXT
WHEN  = EVENT   = ACTION / EXECUTION
THEN  = OUTCOME = EXPERIENCE
```

The resulting HTTP response, posting document, extracted facts, hashes, and lineage are **evidence that the outcome became true**, not the outcome itself. That distinction is now part of the revised SDA mental model. 

# What we actually need to build

The application should become two cooperating capability planes:

```text
                   JOB MARKET INTELLIGENCE
                           │
          ┌────────────────┴────────────────┐
          │                                 │
          ▼                                 ▼
 PUBLIC MARKET OBSERVATION           MARKET INTELLIGENCE
          │                                 │
          │ produces admitted               │ consumes admitted
          │ observations                    │ observations
          ▼                                 ▼
 JobMarketObservationSet ─────────→ Existing analysis circuit
```

Today we have the **right-hand side**.

We need to build the **left-hand side**.

That is the missing product.

---

# 1. Stop requiring `publicSourceObservations` from the user

The current root input contract requires the caller to provide the information that the product was supposed to discover.

That should become an **internal boundary contract**, not the public product input.

The real root request should look conceptually like:

```json
{
  "observationId": "market-watch-2026-08-09",
  "organizationIds": [
    "adobe"
  ],
  "sourceIds": [
    "adobe-careers",
    "greenhouse"
  ],
  "observedFrom": "2026-08-01T00:00:00Z",
  "observedTo": "2026-08-09T23:59:59Z",
  "maxResultsPerSource": 100
}
```

No pre-extracted:

```text
compensation
competencies
technologies
businessProblems
organizationalIntent
```

Those become **observable outcomes of downstream scenarios**.

The existing `publicSourceObservations` structure can remain useful as the handoff between acquisition and analysis:

```text
Observation Request
        ↓
LIVE ACQUISITION
        ↓
publicSourceObservations
        ↓
EXISTING INTELLIGENCE PIPELINE
```

So we preserve the working 13-scenario semantic analysis rather than destroying it.

---

# 2. Introduce an SDA external-observation capability family

This belongs primarily in `scenario-driven-architecture`, because accessing an external resource is a generic platform concern.

Right now the JMI ports are transformation ports:

```text
sda-authority-transformation-port.v1
```

That's correct for:

```text
map
filter
classify
bind
compare
aggregate
format
```

It is **not** sufficient for:

```text
GET https://...
receive HTTP representation
follow pagination
observe response metadata
capture bytes
```

Those are effects.

I would introduce something generically named along the lines of:

```text
sda-external-observation-port.v1
```

Not:

```text
sda-web-scraper-port
sda-greenhouse-port
sda-job-board-port
```

Those would leak domain semantics into the platform.

The semantic distinction becomes:

```text
Transformation Port
    supplied state → derived state
    no external observation

External Observation Port
    admitted external reference
        ↓
    physical interaction
        ↓
    observed external evidence
```

This follows the existing kernel principle that physical transport should remain outside domain semantics and be resolved through bindings rather than hard-coded into the kernel. 

---

# 3. Establish the generic physical mechanics once

SDA should provide admitted platform mechanics such as:

```text
resolve-external-reference
execute-http-request
observe-http-response
follow-declared-pagination
capture-representation
compute-content-digest
observe-content-type
observe-response-status
observe-retrieval-time
decode-admitted-representation
```

Possibly later:

```text
render-browser-document
observe-dynamic-document
execute-source-api-request
```

But **start with HTTP/JSON/HTML**, because Greenhouse, Lever and many careers pages can be handled without a browser.

Each language embodiment implements these generic platform mechanics.

So eventually:

```text
External observation authority
            │
   ┌────────┼────────┬────────┐
   ▼        ▼        ▼        ▼
 Node      C#     Python    Java
 HTTP      HTTP     HTTP      HTTP
```

No JMI-specific source code.

---

# 4. Source authorities become real executable policy

The existing flat files:

```text
sources/
├── adobe.authority.json
├── greenhouse.authority.json
├── lever.authority.json
└── workday.authority.json
```

should remain.

But they need to become strong enough to tell generic SDA mechanics **how a source may be observed**.

For example, conceptually:

```json
{
  "sourceId": "greenhouse",
  "sourceType": "public-job-source",
  "access": {
    "classification": "PUBLIC",
    "allowed": true
  },
  "discovery": {
    "strategy": "declared-endpoint",
    "referenceTemplateAuthorityId": "greenhouse-board-reference.v1"
  },
  "acquisition": {
    "method": "GET",
    "representation": "application/json"
  },
  "pagination": {
    "strategy": "source-declared"
  }
}
```

The important point is:

> **Source authority contains meaning and policy; the generic SDA provider contains mechanics.**

No:

```text
GreenhouseClient.cs
lever_scraper.py
workdayCrawler.js
```

inside the consumer.

---

# 5. Build the actual observation scenario circuit

This should itself be SDA.

## Root observation scenario

```gherkin
@scenario:observe-public-job-market
@input:job-market-observation-request
@event:observe-public-job-market
@outcome:public-job-market-observed

Scenario: Observe a bounded public job market
  Given a bounded public job market observation request
  When the requested public market is observed
  Then the requested public job market is observably represented
```

The experience is:

> **The requested public hiring surface has been observed within the declared scope.**

The evidence is:

```text
PublicSourceObservationSet
```

---

## Scenario: Resolve public sources

```gherkin
Scenario: Resolve admitted public job sources
  Given a bounded market observation request
  When applicable public job sources are resolved
  Then the permitted sources for the observation are known
```

Evidence:

```text
ResolvedPublicSources[]
```

This is where private/restricted sources fail closed.

---

## Scenario: Discover job references

```gherkin
Scenario: Discover public job references
  Given an admitted public job source and organization scope
  When public job opportunities are discovered
  Then the observable job references within scope are known
```

Evidence:

```text
ObservedJobReference[]
```

Not the jobs themselves yet.

---

## Scenario: Acquire one posting

```gherkin
Scenario: Acquire a public job posting
  Given an admitted public job reference
  When the public posting is observed
  Then the referenced public job posting is observably available
```

Evidence:

```text
ObservedExternalRepresentation
├── sourceId
├── sourceReference
├── response status
├── observedAt
├── mediaType
├── content
└── contentSha256
```

This is where the generic external-observation port actually fires.

---

## Scenario: Admit posting evidence

```gherkin
Scenario: Admit observed public posting evidence
  Given an observed external job representation
  When the representation is admitted as job evidence
  Then one canonical observed job posting is available
```

Evidence:

```text
ObservedJobPosting
```

Now we're back inside deterministic semantic execution.

---

# 6. Extraction becomes another scenario family

The existing product docs expected the system to derive facts. That is legitimate—it just isn't currently implemented.

So after acquisition:

```text
ObservedJobPosting
       ↓
extract structured evidence
       ↓
ObservedJobFacts
```

I would **keep the generic fact shape the critique identified as real**:

```json
{
  "factId": "...",
  "opportunityId": "...",
  "factType": "...",
  "value": "...",
  "sourceEvidence": [],
  "observedAt": "..."
}
```

Do **not** invent twenty bespoke fact schemas unless the ontology genuinely requires them.

Extraction scenarios can produce facts such as:

```text
COMPENSATION
COMPETENCY
TECHNOLOGY
BUSINESS_PROBLEM
ORGANIZATIONAL_INTENT
ROLE
LOCATION
SENIORITY
```

through the same generic shape.

That is cleaner.

---

# 7. Structured sources first, unstructured sources second

There are really two acquisition/extraction strategies.

### Structured source

Greenhouse / Lever / source APIs:

```text
JSON response
   ↓
authority mappings
   ↓
canonical posting
   ↓
observed facts
```

This can be almost entirely deterministic.

### Unstructured source

Ordinary careers HTML:

```text
HTML representation
   ↓
document structure extraction
   ↓
semantic classification
   ↓
canonical posting
   ↓
observed facts
```

We should **not** lead with LLM parsing.

First use:

```text
JSON-LD
structured HTML
schema.org JobPosting
declared selectors
canonical source mappings
```

Then use bounded inference only for genuinely semantic extraction like:

```text
organizational intent
business problem classification
capability grouping
```

That protects evidence integrity.

---

# 8. The full real application becomes two monotonic circuits

```text
CIRCUIT A — OBSERVATION

Observation Scope
    ↓
Resolve Sources
    ↓
Discover References
    ↓
Acquire Representations
    ↓
Admit Postings
    ↓
Extract Observed Facts
    ↓
PublicSourceObservations
```

Then:

```text
CIRCUIT B — INTELLIGENCE

PublicSourceObservations
    ↓
Canonical Opportunities
    ↓
Observed Facts
    ↓
Market Signals
    ↓
Patterns
    ↓
Inferences
    ↓
Job Market Intelligence Profile
```

This is much cleaner than pretending the existing transformations scrape the web.

And because SDA scenarios are definition-level authority while executions are separate runtime instances, repeated crawling/observation naturally creates new testimony without redefining the scenarios. 

---

# 9. Evidence lineage must begin at the HTTP observation

Right now lineage begins too late.

It should become:

```text
External Source
    ↓
HTTP observation
    ↓
Observed representation
    ↓
contentSha256
    ↓
ObservedJobPosting
    ↓
ObservedJobFact
    ↓
MarketSignal
    ↓
MarketInference
    ↓
Intelligence Profile
```

So if the system says:

> Adobe appears to be increasing investment in AI-enabled small-business capabilities.

we can walk backward:

```text
Inference
    ↓ supportingSignalIds
Signals
    ↓ evidenceFactIds
Facts
    ↓ sourceEvidence
Posting
    ↓ representation digest
External source reference
```

That is **real evidence lineage**.

---

# 10. Distinguish observation from inference aggressively

The critique is right that the docs fabricated richer facts than the contracts actually contain.

Going forward:

```text
Observed evidence
≠
Derived signal
≠
Inference
```

Make it impossible to confuse them.

```text
OBSERVATION
"Posting says: ..."

FACT
technology = Kubernetes

SIGNAL
Kubernetes appears in 18 admitted opportunities

INFERENCE
Kubernetes demand is material within observed platform-engineering hiring
```

Every layer retains IDs from the layer beneath it.

This aligns with the revised SDA concept that the final `Then` describes the experience, while observable state and evidence establish that the experience has actually occurred. 

---

# 11. Fix the CLI by projecting a real product interface

The current CLI is a compiler test interface:

```text
<JSON string>
```

That's okay internally.

But the actual product interface should be its own scenario binding.

Eventually:

```bash
jmi observe \
  --organization adobe \
  --source adobe-careers \
  --max-results 100
```

or:

```bash
jmi analyze \
  --organization adobe
```

The CLI parser itself is projection mechanics.

It should produce the canonical input contract:

```text
CLI arguments
    ↓
interface projection
    ↓
JobMarketObservationRequest
```

The existing JSON-string CLI can remain a low-level canonical interface for conformance testing.

We should not confuse:

```text
canonical execution CLI
```

with:

```text
human product CLI
```

---

# 12. Persistence becomes important now

A one-shot crawler won't give you the market intelligence we actually wanted.

We need longitudinal observation.

The canonical durable entities should include roughly:

```text
ObservationRun
ExternalRepresentation
JobOpportunity
ObservedJobFact
MarketSignal
MarketInference
```

With temporal identity:

```text
firstObservedAt
lastObservedAt
observedAt
sourceIdentity
contentSha256
```

Then we can distinguish:

```text
new posting
unchanged posting
changed posting
removed/unobserved posting
```

without fabricating meaning.

SQL can become one **projection/storage embodiment** later; it doesn't need to contaminate the semantic authority.

---

# 13. `changeOverTime` should remain exactly what the schema says

The critique found this important drift.

Keep:

```text
ESTABLISHED
NOT_ESTABLISHED
```

Do not invent:

```text
OBSERVABLY_TRUE
CONTRADICTED
```

for `changeOverTime`.

If there isn't enough longitudinal evidence:

```text
NOT_ESTABLISHED
```

Period.

Only after sufficient observations support the temporal claim:

```text
ESTABLISHED
```

That's exactly the kind of conservative semantic boundary we want.

---

# 14. Build a real proof corpus

The current fixtures prove transformations.

Now add physical capability conformance fixtures.

I would create at least:

```text
public-http-source.fixture
    → permitted source
    → observed representation

private-source.fixture
    → rejected before network execution

greenhouse-board.fixture
    → discover references
    → acquire postings
    → canonical postings

content-digest.fixture
    → same representation
    → same SHA-256

changed-posting.fixture
    → changed bytes
    → new observation identity/state

structured-job-posting.fixture
    → posting
    → expected observed facts

end-to-end-adobe.fixture
    → scope
    → acquisition
    → facts
    → signals
    → intelligence
```

And tests should again be projections of those authorities, consistent with the SDA development law that the proof surface should be projected from scenario + fixture authority rather than independently authored. 

---

# 15. Platform obligations vs JMI obligations

This separation needs to be ruthless.

### SDA owns

```text
external observation port contract
HTTP mechanics
response observation
content capture
digesting
representation decoding
pagination primitive
rate-control mechanics
scenario invocation
contract admission
projection
execution testimony
```

### Job Market Intelligence owns

```text
what counts as a job source
which sources are permitted
how Greenhouse is addressed
how Lever is addressed
what constitutes a job opportunity
job fact taxonomy
market-signal semantics
inference semantics
evidence policy
market-analysis scenarios
```

### Source authority owns

```text
source endpoint patterns
discovery semantics
representation characteristics
source-specific mappings
public-access classification
```

That preserves the architectural rule:

> **Language/platform mechanics embody generic execution; domain meaning remains authority.**

That has been foundational to the language-neutral kernel model from the beginning. 

---

# 16. I would make the implementation sequence deliberately RED

The platform work queue should emerge automatically.

**Phase 1 — Canonical observation contracts.** Add `job-market-observation-request`, `observed-job-reference`, `observed-external-representation`, and the observation scenario authorities. Existing analysis remains untouched.

**Phase 2 — SDA external-observation mechanics.** Declare the generic port/provider obligations. Every active language should go RED until required physical providers are present, following the existing rule that declarations create implementation obligations rather than aspirational status. 

**Phase 3 — Node first physical provider.** Project the real JMI observation capability through Node. Prove one HTTP source.

**Phase 4 — Greenhouse end-to-end.** Company identity → board discovery → postings → canonical observations → existing 13-scenario intelligence circuit.

**Phase 5 — Lever and Adobe.** Add authority, not separate applications.

**Phase 6 — Longitudinal storage.** Admit observation history and temporal comparison.

**Phase 7 — C# physical parity.** Same observation authority, same fixtures, equivalent canonical observations. Then Python and Java.

---

# The target end state

This is what we actually wanted from day one:

```text
INPUT

{
  organizations: ["adobe"]
}
            │
            ▼
SDA PROJECTED OBSERVATION CAPABILITY
            │
            ├── discover public sources
            ├── discover postings
            ├── acquire postings
            ├── capture evidence
            └── extract canonical facts
            │
            ▼
ADMITTED PUBLIC MARKET OBSERVATIONS
            │
            ▼
EXISTING SDA INTELLIGENCE CAPABILITY
            │
            ├── signals
            ├── patterns
            ├── comparisons
            └── bounded inference
            │
            ▼
OUTCOME / EXPERIENCE

"The analyst can inspect an evidence-backed
market intelligence profile for Adobe."
```

And underneath that experience:

```text
profile
signals
facts
postings
source evidence
content hashes
observation testimony
```

prove that it became true.

## The key correction

The documentation audit should therefore become a **build specification**, not merely a docs cleanup:

> **The present Job Market Intelligence repository is a valid projection-only analysis core. The next capability increment is public market observation: admitted physical source discovery and acquisition supplied by generic SDA external-observation mechanics. The existing domain ontology, evidence policies, signal model, and intelligence circuit remain authoritative and become consumers of those observations.**

Once that is implemented, the aspirational documentation stops being aspirational.

**We won't rewrite the docs to say the crawler doesn't exist. We'll build the missing SDA capability so the product the docs were trying to describe actually exists—without breaking the zero-handwritten-consumer-code law.**

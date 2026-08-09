# Engineering Market Intelligence Report — Template

> Field-level template for the flagship report this system is meant to produce once
> the public-observation circuit (`docs/CAPABILITY_PLANES.md`) is bridged into the
> existing 13-scenario intelligence circuit. Every `{{placeholder}}` resolves from
> admitted evidence: `ObservedJobFact.sourceEvidence`, `MarketSignal.evidenceFactIds`,
> and `MarketInference.supportingSignalIds`. Nothing in this template is populated —
> it is the target shape, not a sample report. `ESTABLISHED` / `NOT_ESTABLISHED` are
> the only valid values for change-over-time dispositions anywhere in this document.

**Reporting Period:** {{observedFrom}} — {{observedTo}}
**Generated:** {{generatedAt}}
**Observation Scope:** {{observationScope}}
**Organizations Observed:** {{organizationCount}}
**Public Sources Observed:** {{sourceCount}}
**Job Opportunities Observed:** {{opportunityCount}}
**Observed Facts:** {{observedFactCount}}
**Market Signals:** {{marketSignalCount}}
**Market Inferences:** {{marketInferenceCount}}

---

# Executive Summary

## Market Overview

{{executiveMarketSummary}}

During the observation period, public hiring activity provided observable evidence of organizational investment across engineering capabilities, technologies, business problems, market segments, and seniority levels.

The strongest observed areas of investment were:

1. **{{topCapability1}}** — {{topCapability1Summary}}
2. **{{topCapability2}}** — {{topCapability2Summary}}
3. **{{topCapability3}}** — {{topCapability3Summary}}
4. **{{topCapability4}}** — {{topCapability4Summary}}
5. **{{topCapability5}}** — {{topCapability5Summary}}

## Key Market Signals

| Signal      | Observation        |   Evidence Strength | Change Over Time                   |
| ----------- | ------------------ | ------------------: | ---------------------------------- |
| {{signal1}} | {{signal1Summary}} | {{signal1Strength}} | {{ESTABLISHED_OR_NOT_ESTABLISHED}} |
| {{signal2}} | {{signal2Summary}} | {{signal2Strength}} | {{ESTABLISHED_OR_NOT_ESTABLISHED}} |
| {{signal3}} | {{signal3Summary}} | {{signal3Strength}} | {{ESTABLISHED_OR_NOT_ESTABLISHED}} |
| {{signal4}} | {{signal4Summary}} | {{signal4Strength}} | {{ESTABLISHED_OR_NOT_ESTABLISHED}} |
| {{signal5}} | {{signal5Summary}} | {{signal5Strength}} | {{ESTABLISHED_OR_NOT_ESTABLISHED}} |

## Executive Interpretation

{{executiveInterpretation}}

**Evidence boundary:** Interpretations in this report are derived from admitted market signals. They are not treated as observed facts. Every inference must retain references to its supporting signal identities.

---

# 1. Observation Coverage

## 1.1 Observation Scope

| Dimension          | Value                             |
| ------------------- | ---------------------------------- |
| Observation period | {{observedFrom}} — {{observedTo}} |
| Organizations      | {{organizationCount}}             |
| Sources            | {{sourceCount}}                   |
| Opportunities      | {{opportunityCount}}              |
| Observed facts     | {{observedFactCount}}             |
| Market signals     | {{marketSignalCount}}             |
| Inferences         | {{marketInferenceCount}}          |

## 1.2 Organizations Observed

| Organization     | Opportunities |         Facts |         Signals | First Observed    | Last Observed    |
| ----------------- | ------------: | ------------: | --------------: | ------------------ | ----------------- |
| {{organization}} |     {{count}} | {{factCount}} | {{signalCount}} | {{firstObserved}} | {{lastObserved}} |

## 1.3 Source Coverage

| Source       | Organization     | Opportunities | Observation Status |
| ------------ | ----------------- | ------------: | ------------------- |
| {{sourceId}} | {{organization}} |     {{count}} | {{status}}          |

---

# 2. Organizational Investment Intelligence

## 2.1 Highest Observed Investment Areas

| Rank | Capability     |     Organizations |     Opportunities | Senior/Principal Roles | Compensation Evidence   |
| ---: | -------------- | -----------------: | -----------------: | ----------------------: | ------------------------ |
|    1 | {{capability}} | {{organizations}} | {{opportunities}} |        {{seniorRoles}} | {{compensationSummary}} |
|    2 | {{capability}} | {{organizations}} | {{opportunities}} |        {{seniorRoles}} | {{compensationSummary}} |
|    3 | {{capability}} | {{organizations}} | {{opportunities}} |        {{seniorRoles}} | {{compensationSummary}} |

## 2.2 Investment Interpretation

{{organizationalInvestmentInterpretation}}

## 2.3 Investment by Organization

### {{organizationName}}

**Observed opportunities:** {{count}}
**Observed compensation evidence:** {{compensationSummary}}
**Primary capabilities:** {{capabilities}}
**Primary technologies:** {{technologies}}
**Primary business problems:** {{businessProblems}}

#### Strongest Signals

| Signal     |        Evidence Facts | Interpretation     |
| ---------- | ----------------------: | ------------------- |
| {{signal}} | {{evidenceFactCount}} | {{interpretation}} |

#### Organizational Investment Assessment

{{organizationInvestmentAssessment}}

**Supporting signal IDs:**
`{{signalId1}}`, `{{signalId2}}`, `{{signalId3}}`

---

# 3. Capability Demand

## 3.1 Most Frequently Observed Capabilities

| Rank | Capability     | Opportunities |     Organizations | Seniority Concentration | Change Over Time |
| ---: | -------------- | ------------: | -----------------: | ------------------------- | ------------------ |
|    1 | {{capability}} |     {{count}} | {{organizations}} | {{seniority}}             | {{disposition}}    |
|    2 | {{capability}} |     {{count}} | {{organizations}} | {{seniority}}             | {{disposition}}    |
|    3 | {{capability}} |     {{count}} | {{organizations}} | {{seniority}}             | {{disposition}}    |

## 3.2 Capability Demand Analysis

{{capabilityDemandAnalysis}}

## 3.3 Emerging Capabilities

| Capability     | Current Evidence | Historical Evidence | Disposition                        | Supporting Signals |
| -------------- | -----------------: | ---------------------: | ------------------------------------ | -------------------- |
| {{capability}} |      {{current}} |      {{historical}} | {{ESTABLISHED_OR_NOT_ESTABLISHED}} | {{signalIds}}      |

## 3.4 Capability Co-Occurrence

| Primary Capability | Frequently Associated Capability | Observed Co-Occurrences |
| -------------------- | ---------------------------------- | -------------------------: |
| {{capabilityA}}    | {{capabilityB}}                  |               {{count}} |

---

# 4. Technology Demand

## 4.1 Most Frequently Observed Technologies

| Rank | Technology     | Opportunities |         Organizations | Associated Capabilities |
| ---: | -------------- | ------------: | ----------------------: | ------------------------- |
|    1 | {{technology}} |     {{count}} | {{organizationCount}} | {{capabilities}}        |
|    2 | {{technology}} |     {{count}} | {{organizationCount}} | {{capabilities}}        |
|    3 | {{technology}} |     {{count}} | {{organizationCount}} | {{capabilities}}        |

## 4.2 Technology Demand Analysis

{{technologyDemandAnalysis}}

## 4.3 Technology → Capability Relationships

### {{technologyName}}

Observed primarily in connection with:

* {{capability1}}
* {{capability2}}
* {{capability3}}

**Observed opportunities:** {{count}}
**Organizations:** {{organizationCount}}
**Supporting fact IDs:** {{factIds}}

### Interpretation

{{technologyCapabilityInterpretation}}

---

# 5. Business Problem Intelligence

## 5.1 Most Frequently Funded Business Problems

| Rank | Business Problem    |     Organizations |     Opportunities | Associated Capabilities |
| ---: | -------------------- | -------------------: | -------------------: | ------------------------- |
|    1 | {{businessProblem}} | {{organizations}} | {{opportunities}} | {{capabilities}}        |
|    2 | {{businessProblem}} | {{organizations}} | {{opportunities}} | {{capabilities}}        |
|    3 | {{businessProblem}} | {{organizations}} | {{opportunities}} | {{capabilities}}        |

## 5.2 Business Problem Analysis

{{businessProblemAnalysis}}

## 5.3 Problem → Capability → Technology

### {{businessProblem}}

**Observed need**

{{observedNeed}}

**Capabilities being hired**

* {{capability}}
* {{capability}}
* {{capability}}

**Technologies associated with the hiring**

* {{technology}}
* {{technology}}
* {{technology}}

**Organizations exhibiting the signal**

{{organizations}}

**Supporting signal IDs:** {{signalIds}}

---

# 6. Compensation Intelligence

## 6.1 Compensation by Capability

| Capability     | Observations | Lower Range | Upper Range | Seniority     |
| -------------- | -------------: | ------------: | ------------: | -------------- |
| {{capability}} |    {{count}} |   {{lower}} |   {{upper}} | {{seniority}} |

## 6.2 Compensation by Role Family

| Role Family    | Opportunities | Compensation Evidence | Primary Capabilities |
| -------------- | ------------: | ----------------------- | ---------------------- |
| {{roleFamily}} |     {{count}} | {{compensation}}      | {{capabilities}}     |

## 6.3 Highest-Value Capability Signals

{{compensationInterpretation}}

The compensation evidence indicates where observed organizations are willing to allocate significant payroll toward acquiring engineering capability.

Compensation is treated as **one investment dimension**, not independent proof of strategic importance.

---

# 7. Seniority & Organizational Commitment

## 7.1 Hiring by Seniority

| Seniority | Opportunities | Share of Observed Hiring | Primary Capabilities |
| --------- | -------------: | --------------------------: | ---------------------- |
| Principal |     {{count}} |                {{share}} | {{capabilities}}     |
| Staff     |     {{count}} |                {{share}} | {{capabilities}}     |
| Senior    |     {{count}} |                {{share}} | {{capabilities}}     |
| Mid-level |     {{count}} |                {{share}} | {{capabilities}}     |

## 7.2 Senior-Level Investment Signals

{{seniorityInterpretation}}

Repeated Staff/Principal-level hiring may provide stronger evidence of organizational commitment than isolated lower-level openings, but strategic intent is reported only when supported by admitted signals.

---

# 8. Company Comparison

## 8.1 Capability Comparison

| Capability      | {{companyA}} | {{companyB}} | {{companyC}} |
| ----------------- | -------------: | -------------: | -------------: |
| {{capability1}} |    {{value}} |    {{value}} |    {{value}} |
| {{capability2}} |    {{value}} |    {{value}} |    {{value}} |
| {{capability3}} |    {{value}} |    {{value}} |    {{value}} |

## 8.2 Technology Comparison

| Technology      | {{companyA}} | {{companyB}} | {{companyC}} |
| ----------------- | -------------: | -------------: | -------------: |
| {{technology1}} |    {{value}} |    {{value}} |    {{value}} |
| {{technology2}} |    {{value}} |    {{value}} |    {{value}} |

## 8.3 Strategic Differentiation

### {{companyA}}

{{companyAInterpretation}}

### {{companyB}}

{{companyBInterpretation}}

### {{companyC}}

{{companyCInterpretation}}

## 8.4 Comparative Inference

{{comparativeInference}}

**Supporting signal IDs:** {{supportingSignalIds}}

---

# 9. Change Over Time

## 9.1 Capability Trends

| Capability     | Prior Period | Current Period |     Change | Disposition                        |
| -------------- | -------------: | ----------------: | -----------: | ------------------------------------ |
| {{capability}} |    {{prior}} |    {{current}} | {{change}} | {{ESTABLISHED_OR_NOT_ESTABLISHED}} |

## 9.2 Technology Trends

| Technology     | Prior Period | Current Period |     Change | Disposition                        |
| -------------- | -------------: | ----------------: | -----------: | ------------------------------------ |
| {{technology}} |    {{prior}} |    {{current}} | {{change}} | {{ESTABLISHED_OR_NOT_ESTABLISHED}} |

## 9.3 Trend Interpretation

{{trendInterpretation}}

A change is reported as **ESTABLISHED** only when admitted longitudinal observations support the conclusion.

Otherwise:

**NOT_ESTABLISHED**

---

# 10. Emerging Market Signals

## Signal: {{signalName}}

**Signal ID:** `{{signalId}}`
**Signal type:** {{signalType}}
**Organizations represented:** {{organizationCount}}
**Observed facts:** {{factCount}}
**Evidence fact IDs:** {{evidenceFactIds}}

### Observation

{{signalObservation}}

### Interpretation

{{signalInterpretation}}

### Change Over Time

**{{ESTABLISHED_OR_NOT_ESTABLISHED}}**

---

# 11. Organizational Intent

## 11.1 Observed Intent Signals

| Organization     | Intent Signal | Evidence Facts | Supporting Opportunities |
| ----------------- | -------------- | ----------------: | --------------------------: |
| {{organization}} | {{intent}}    |  {{factCount}} |     {{opportunityCount}} |

## 11.2 Organizational Intent Analysis

{{organizationalIntentAnalysis}}

Organizational intent is a **derived interpretation** and must not be represented as an observed fact unless the source itself explicitly states that intent.

---

# 12. Go-to-Market Intelligence

## 12.1 Market Problems Receiving Engineering Investment

| Problem     |     Organizations |   Hiring Evidence | Relevant Offering Category |
| ----------- | -------------------: | -------------------: | ----------------------------- |
| {{problem}} | {{organizations}} | {{opportunities}} | {{offeringCategory}}       |

## 12.2 Build-vs-Buy Pressure

{{buildVsBuyAnalysis}}

Potential indicators include:

* repeated hiring across organizations;
* expensive specialist positions;
* senior/principal hiring;
* recurring capability combinations;
* persistent business problems;
* scarce technical expertise.

These indicators establish **observable hiring pressure**, not independently proven purchasing intent.

## 12.3 Potential GTM Opportunities

### {{opportunityName}}

**Observed market problem:**
{{marketProblem}}

**Organizations exhibiting evidence:**
{{organizations}}

**Capabilities currently being hired:**
{{capabilities}}

**Potential offering category:**
{{offeringCategory}}

**Market inference:**
{{gtmInference}}

**Supporting signal IDs:** {{signalIds}}

---

# 13. Career Market Intelligence

## 13.1 Highest-Demand Capability Areas

| Capability     |     Opportunities |     Organizations | Compensation Evidence | Trend           |
| -------------- | -------------------: | -------------------: | ------------------------ | ----------------- |
| {{capability}} | {{opportunities}} | {{organizations}} | {{compensation}}      | {{disposition}} |

## 13.2 High-Value Skill Combinations

| Skill / Capability Combination | Observed Opportunities |     Organizations |
| --------------------------------- | -------------------------: | -------------------: |
| {{combination}}                |              {{count}} | {{organizations}} |

## 13.3 Career Opportunity Interpretation

{{careerOpportunityInterpretation}}

> Candidate-specific alignment requires a separate admitted candidate-evidence authority. Market observations alone do not establish that any individual possesses these capabilities.

---

# 14. Market Inferences

## Inference: {{inferenceTitle}}

**Inference ID:** `{{inferenceId}}`

### Conclusion

{{inference}}

### Supporting Signals

* `{{signalId1}}`
* `{{signalId2}}`
* `{{signalId3}}`

### Evidence Chain

```text
MarketInference
    ↓
supportingSignalIds
    ↓
MarketSignals
    ↓
evidenceFactIds
    ↓
ObservedJobFacts
    ↓
sourceEvidence
    ↓
ObservedJobPosting
    ↓
Observed External Representation
    ↓
contentSha256
```

### Evidence Assessment

{{evidenceAssessment}}

---

# 15. Evidence Drill-Down

## Market Signal

**Signal ID:** `{{signalId}}`

**Signal:**
{{signalDescription}}

### Evidence Facts

| Fact ID      | Opportunity         | Fact Type    | Value     | Observed At    |
| ------------- | --------------------- | ------------- | ---------- | ---------------- |
| `{{factId}}` | `{{opportunityId}}` | {{factType}} | {{value}} | {{observedAt}} |

### Source Evidence

| Opportunity         | Source       | Source Reference    | Content SHA-256     |
| --------------------- | ------------ | --------------------- | --------------------- |
| `{{opportunityId}}` | {{sourceId}} | {{sourceReference}} | `{{contentSha256}}` |

This chain provides the inspectable evidence supporting the market signal.

---

# 16. Evidence Governance

All intelligence in this report follows these boundaries:

1. **Observed facts remain distinct from derived market signals.**
2. **Market signals retain their `evidenceFactIds`.**
3. **Market inferences retain their supporting signal IDs.**
4. **Organizational intent is not presented as directly observed unless explicitly stated by source evidence.**
5. **Change over time is `ESTABLISHED` only when longitudinal evidence supports it; otherwise it is `NOT_ESTABLISHED`.**
6. **Unsupported conclusions must not be promoted into market intelligence.**
7. **Private or disallowed acquisition sources are rejected according to source acquisition authority.**

---

# 17. Methodology

## Observation

Public job-market evidence is observed within the bounded reporting scope.

```text
Public Source
    ↓
External Observation
    ↓
Observed Representation
    ↓
Canonical Job Opportunity
```

## Fact Resolution

Observed representations produce canonical job facts.

```text
Job Opportunity
    ↓
ObservedJobFact
```

Canonical fact shape:

```text
factId
opportunityId
factType
value
sourceEvidence
observedAt
```

## Signal Resolution

Related facts are classified, bound, compared, and aggregated into market signals.

```text
ObservedJobFacts
    ↓
MarketSignals
```

Each signal retains:

```text
evidenceFactIds[]
```

## Inference Resolution

Bounded intelligence is derived only from admitted market signals.

```text
MarketSignals
    ↓
MarketInference
```

Each inference retains:

```text
supportingSignalIds[]
```

---

# 18. Observation Limitations

This report describes the **observed market**, not the entire labor market.

Potential limitations include:

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

| Intelligence Claim | Evidence Coverage | Temporal Coverage    | Disposition     |
| --------------------- | -------------------- | ----------------------- | ----------------- |
| {{claim}}          | {{coverage}}      | {{temporalCoverage}} | {{disposition}} |

---

# 20. Final Market Assessment

## What Organizations Are Funding

{{fundingAssessment}}

## What Capabilities Are Gaining Demand

{{capabilityAssessment}}

## What Technologies Are Enabling That Demand

{{technologyAssessment}}

## What Business Problems Are Driving Investment

{{businessProblemAssessment}}

## What This Suggests for Engineering Leaders

{{engineeringLeaderAssessment}}

## What This Suggests for Product & GTM Leaders

{{gtmAssessment}}

## What This Suggests for Engineering Careers

{{careerAssessment}}

---

# Evidence Summary

```text
Organizations observed:     {{organizationCount}}
Sources observed:           {{sourceCount}}
Opportunities observed:     {{opportunityCount}}
Observed facts admitted:    {{observedFactCount}}
Market signals resolved:    {{marketSignalCount}}
Market inferences resolved: {{marketInferenceCount}}
```

## Evidence Lineage

```text
External Public Source
        ↓
Observed Representation
        ↓
Job Opportunity
        ↓
Observed Job Fact
        ↓
Market Signal
        ↓
Market Inference
        ↓
```

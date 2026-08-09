@capability:resolve-job-market-intelligence
@root-scenario:resolve-job-market-intelligence
Feature: Resolve job market intelligence from public hiring activity

  Public job postings are admitted as evidence before any market signal or
  inference is produced. Every scenario remains exactly Input + Event + Outcome,
  and every Then states what becomes newly true -- not which internal state
  object was emitted. Rankings, comparisons, and evidence drill-downs over an
  already-projected profile are queries (contracts/query-catalog.contract.json),
  not scenarios -- see docs/SCENARIO_CLASSIFICATION.md for the classification
  this feature was rebuilt from.

  @scenario:resolve-job-market-intelligence
  @input:job-market-observation-scope
  @input-contract:job-market-observation-scope.v1
  @event:resolve-market-intelligence
  @event-authority:resolve-market-intelligence.v1
  @outcome:company-hiring-activity-understood
  @outcome-contract:job-market-intelligence-state.v1
  Scenario: Understand what a company is hiring for
    Given the companies and hiring period I want to study
    When I analyze their public hiring activity
    Then I can see the compensation, capabilities, technologies, business problems, and organizational intent represented in their observed hiring activity

  @scenario:resolve-market-signals
  @input:company-hiring-activity-understood
  @input-contract:job-market-intelligence-state.v1
  @event:resolve-market-signals
  @event-authority:resolve-market-signals.v1
  @outcome:market-signals-resolved
  @outcome-contract:job-market-intelligence-state.v1
  Scenario: Resolve evidence-backed market signals
    Given a company's observed hiring activity, broken down into facts
    When I resolve market signals from that activity
    Then I can see signals for the capabilities and technologies represented across postings, each backed by the specific facts behind it

  @scenario:detect-established-market-patterns
  @input:market-signals-resolved
  @input-contract:job-market-intelligence-state.v1
  @event:detect-established-market-patterns
  @event-authority:detect-established-market-patterns.v1
  @outcome:market-patterns-determined
  @outcome-contract:job-market-intelligence-state.v1
  Scenario: Determine whether market demand patterns are established
    Given evidence-backed market signals and any prior observation windows to compare them against
    When I compare demand across the available observation windows
    Then I can see which demand patterns are established by the evidence, and which are not yet

  @scenario:project-market-intelligence
  @input:market-patterns-determined
  @input-contract:job-market-intelligence-state.v1
  @event:project-market-intelligence
  @event-authority:project-market-intelligence.v1
  @outcome:job-market-intelligence-profile
  @outcome-contract:job-market-intelligence-profile.v1
  @outcome-terminal
  Scenario: Project market intelligence
    Given evidence-backed market signals and patterns
    When canonical market intelligence is projected
    Then the analyst can inspect evidence-backed organizational investment and capability demand, including whether change over time is established

@capability:resolve-job-market-intelligence
@root-scenario:resolve-job-market-intelligence
Feature: Resolve job market intelligence from public hiring activity

  Public job postings are admitted as evidence before any market signal or
  inference is produced. Every scenario remains exactly Input + Event + Outcome.

  @scenario:resolve-job-market-intelligence
  @input:job-market-observation-scope
  @input-contract:job-market-observation-scope.v1
  @event:resolve-market-intelligence
  @event-authority:resolve-market-intelligence.v1
  @outcome:bounded-observation-state
  @outcome-contract:job-market-intelligence-state.v1
  Scenario: Begin a bounded market observation
    Given an admitted public-source observation scope
    When market-intelligence resolution begins
    Then one bounded observation state is produced

  @scenario:discover-job-opportunity-references
  @input:bounded-observation-state
  @input-contract:job-market-intelligence-state.v1
  @event:discover-job-opportunity-references
  @event-authority:discover-job-opportunity-references.v1
  @outcome:discovered-reference-state
  @outcome-contract:job-market-intelligence-state.v1
  Scenario: Discover public job opportunity references
    Given one bounded observation state
    When public job opportunity references are discovered
    Then a bounded reference set with source lineage is produced

  @scenario:acquire-job-posting
  @input:discovered-reference-state
  @input-contract:job-market-intelligence-state.v1
  @event:acquire-job-posting
  @event-authority:acquire-job-posting.v1
  @outcome:observed-posting-state
  @outcome-contract:job-market-intelligence-state.v1
  Scenario: Acquire public job postings
    Given admitted public job opportunity references
    When their public posting documents are acquired
    Then observed postings with content identity are produced

  @scenario:admit-job-opportunity
  @input:observed-posting-state
  @input-contract:job-market-intelligence-state.v1
  @event:admit-job-opportunity
  @event-authority:admit-job-opportunity.v1
  @outcome:canonical-opportunity-state
  @outcome-contract:job-market-intelligence-state.v1
  Scenario: Admit canonical job opportunities
    Given observed public job postings
    When canonical job opportunities are admitted
    Then normalized opportunities retaining source evidence are produced

  @scenario:resolve-compensation
  @input:canonical-opportunity-state
  @input-contract:job-market-intelligence-state.v1
  @event:resolve-compensation
  @event-authority:resolve-compensation.v1
  @outcome:compensation-fact-state
  @outcome-contract:job-market-intelligence-state.v1
  Scenario: Resolve observed compensation facts
    Given canonical job opportunities
    When compensation evidence is resolved
    Then compensation facts retaining opportunity evidence are produced

  @scenario:resolve-required-competencies
  @input:compensation-fact-state
  @input-contract:job-market-intelligence-state.v1
  @event:resolve-required-competencies
  @event-authority:resolve-required-competencies.v1
  @outcome:competency-fact-state
  @outcome-contract:job-market-intelligence-state.v1
  Scenario: Resolve observed competency facts
    Given opportunities with admitted compensation facts
    When required competencies are resolved
    Then competency facts retaining opportunity evidence are produced

  @scenario:resolve-technologies
  @input:competency-fact-state
  @input-contract:job-market-intelligence-state.v1
  @event:resolve-technologies
  @event-authority:resolve-technologies.v1
  @outcome:technology-fact-state
  @outcome-contract:job-market-intelligence-state.v1
  Scenario: Resolve observed technology facts
    Given opportunities with admitted competency facts
    When named technologies are resolved
    Then technology facts retaining opportunity evidence are produced

  @scenario:resolve-business-problems
  @input:technology-fact-state
  @input-contract:job-market-intelligence-state.v1
  @event:resolve-business-problems
  @event-authority:resolve-business-problems.v1
  @outcome:business-problem-fact-state
  @outcome-contract:job-market-intelligence-state.v1
  Scenario: Resolve observed business problem facts
    Given opportunities with admitted technology facts
    When stated business problems are resolved
    Then business-problem facts retaining opportunity evidence are produced

  @scenario:resolve-organizational-intent
  @input:business-problem-fact-state
  @input-contract:job-market-intelligence-state.v1
  @event:resolve-organizational-intent
  @event-authority:resolve-organizational-intent.v1
  @outcome:organizational-intent-fact-state
  @outcome-contract:job-market-intelligence-state.v1
  Scenario: Resolve bounded organizational intent
    Given admitted observed job facts
    When organizational intent is classified
    Then bounded intent facts retaining opportunity evidence are produced

  @scenario:resolve-market-signals
  @input:organizational-intent-fact-state
  @input-contract:job-market-intelligence-state.v1
  @event:resolve-market-signals
  @event-authority:resolve-market-signals.v1
  @outcome:evidence-backed-signal-state
  @outcome-contract:job-market-intelligence-state.v1
  Scenario: Resolve market signals
    Given admitted observed job facts
    When market signals are resolved
    Then evidence-backed market signals are produced

  @scenario:aggregate-market-observations
  @input:evidence-backed-signal-state
  @input-contract:job-market-intelligence-state.v1
  @event:aggregate-market-observations
  @event-authority:aggregate-market-observations.v1
  @outcome:longitudinal-aggregate-state
  @outcome-contract:job-market-intelligence-state.v1
  Scenario: Aggregate market observations
    Given evidence-backed market signals
    When equivalent observation dimensions are aggregated
    Then longitudinal aggregates preserving signal identities are produced

  @scenario:detect-market-patterns
  @input:longitudinal-aggregate-state
  @input-contract:job-market-intelligence-state.v1
  @event:detect-market-patterns
  @event-authority:detect-market-patterns.v1
  @outcome:evidence-backed-pattern-state
  @outcome-contract:job-market-intelligence-state.v1
  Scenario: Detect bounded market patterns
    Given longitudinal market aggregates
    When comparable dimensions are classified
    Then patterns retaining supporting signal identities are produced

  @scenario:project-market-intelligence
  @input:evidence-backed-pattern-state
  @input-contract:job-market-intelligence-state.v1
  @event:project-market-intelligence
  @event-authority:project-market-intelligence.v1
  @outcome:job-market-intelligence-profile
  @outcome-contract:job-market-intelligence-profile.v1
  @outcome-terminal
  Scenario: Project market intelligence
    Given evidence-backed market patterns
    When canonical market intelligence is projected
    Then the analyst can inspect evidence-backed organizational investment and capability demand, including whether change over time is established

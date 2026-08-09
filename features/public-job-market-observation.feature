@capability:observe-public-job-market
@root-scenario:collect-current-hiring-activity
Feature: Observe public hiring activity

  Public market observation is a physical capability, distinct from semantic
  analysis. It resolves admitted public sources, discovers job references,
  acquires posting representations, and admits them as evidence -- before any
  fact extraction or market inference occurs. This circuit produces observed
  evidence; it does not yet extract compensation, competency, technology, or
  business-problem facts -- that remains a distinct, later scenario family so
  this circuit never fabricates facts it has not actually observed. See
  docs/SCENARIO_CLASSIFICATION.md for the classification this feature was
  rebuilt from -- reshaping/relabeling steps (an identity pass-through and a
  pure field-selection admission step) were folded into the two scenarios
  below rather than kept as standalone scenarios of their own.

  @scenario:collect-current-hiring-activity
  @input:job-market-observation-request
  @input-contract:job-market-observation-request.v1
  @event:collect-current-hiring-activity
  @event-authority:collect-current-hiring-activity.v1
  @outcome:current-hiring-activity-collected
  @outcome-contract:public-job-market-observation-state.v1
  Scenario: Collect current hiring activity for selected companies
    Given the companies I want to observe
    When their permitted public job sources are checked and current openings are observed
    Then I can review the public job openings found within my observation scope

  @scenario:acquire-and-admit-posting-evidence
  @input:current-hiring-activity-collected
  @input-contract:public-job-market-observation-state.v1
  @event:acquire-and-admit-posting-evidence
  @event-authority:acquire-and-admit-posting-evidence.v1
  @outcome:posting-evidence-admitted
  @outcome-contract:observed-job-posting-evidence.v1
  @outcome-terminal
  Scenario: Acquire and admit a public job posting as evidence
    Given an observed public job reference
    When the referenced posting is retrieved and admitted as evidence
    Then I can inspect one canonical, evidence-backed job posting, traceable to its source and content identity

@capability:observe-and-resolve-job-market-intelligence
@root-scenario:observe-and-resolve-job-market-intelligence
Feature: Observe and resolve job market intelligence from one live posting

  Orchestrates two independently-admitted capabilities -- observe-public-job-market
  (features/public-job-market-observation.feature) and resolve-job-market-intelligence
  (features/job-market-intelligence.feature) -- via sda-projected-capability-invocation-port.v1,
  so a single request produces a real, live-observed posting projected through the
  full market-intelligence pipeline. Neither existing capability's own root or
  fixtures is touched by this orchestration -- this is the bridge, kept separate
  from both so their already-proven behavior stays untouched. Facts this circuit
  cannot yet extract from live posting content (compensation, competencies,
  technologies, business problems, organizational intent) are carried through
  as null/empty, never fabricated.

  @scenario:observe-and-resolve-job-market-intelligence
  @input:live-market-observation-request
  @input-contract:job-market-observation-request.v1
  @event:observe-and-resolve-job-market-intelligence
  @event-authority:observe-and-resolve-job-market-intelligence.v1
  @outcome:live-job-market-intelligence-profile
  @outcome-contract:job-market-intelligence-profile.v1
  @outcome-terminal
  Scenario: Observe one live posting and resolve it into market intelligence
    Given the company and specific live posting I want analyzed
    When the posting is observed and projected through the market-intelligence pipeline
    Then I can inspect an evidence-backed intelligence profile for that posting, honestly marked wherever facts have not yet been extracted

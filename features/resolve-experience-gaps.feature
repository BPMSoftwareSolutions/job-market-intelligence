@capability:resolve-experience-gaps
@root-scenario:resolve-experience-gaps
Feature: Resolve demonstrable experience gaps against market evidence

  Composes independently admitted market-intelligence and candidate-evidence
  capabilities through projected invocation v2. Each invocation receives only
  its declared request branch, while its governed outcome is bound into the
  preserved parent carrier for an explicit fan-out/fan-in comparison.

  @scenario:resolve-experience-gaps
  @input:experience-gap-resolution-scope
  @input-contract:experience-gap-resolution-scope.v1
  @event:resolve-experience-gaps
  @event-authority:resolve-experience-gaps.v1
  @outcome:experience-acquisition-opportunity-profile
  @outcome-contract:experience-acquisition-opportunity-profile.v1
  @outcome-terminal
  Scenario: See market-relevant experience I cannot yet demonstrate
    Given a declared market-intelligence request and candidate-experience authority
    When their independently admitted evidence is compared
    Then I can see market-relevant experience I cannot yet demonstrate

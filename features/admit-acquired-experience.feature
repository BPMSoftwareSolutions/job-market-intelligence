@capability:admit-acquired-experience
@root-scenario:admit-acquired-experience
Feature: Admit acquired experience evidence into the candidate's experience log

  Completing a projected mission is not automatically professional experience.
  Execution testimony for a mission is admitted as experience evidence only
  when it demonstrates every scenario obligation the mission required and its
  proof passed. Incomplete or unproven testimony is rejected rather than
  partially admitted, and a mission that was never projected admits nothing.

  @scenario:admit-acquired-experience
  @input:experience-admission-scope
  @input-contract:experience-admission-scope.v1
  @event:admit-acquired-experience
  @event-authority:admit-acquired-experience.v1
  @outcome:experience-admission-profile
  @outcome-contract:experience-admission-profile.v1
  @outcome-terminal
  Scenario: Admit evidence only for a fully demonstrated, proven mission
    Given a projected experience mission and execution testimony for it
    When the testimony is checked against every scenario obligation the mission required
    Then I have new inspectable experience evidence only when every obligation was demonstrated and proven

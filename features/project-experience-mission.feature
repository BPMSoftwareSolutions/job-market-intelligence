@capability:project-experience-mission
@root-scenario:project-experience-mission
Feature: Project a scenario-driven mission to close an experience gap

  Turns a chosen experience acquisition opportunity into a bounded,
  scenario-obligated mission. The declared mission catalog is authority: a
  target capability with no matching catalog entry never receives fabricated
  scenario obligations, a preferred embodiment, or an evidence-maturity target.

  @scenario:project-experience-mission
  @input:experience-mission-planning-scope
  @input-contract:experience-mission-planning-scope.v1
  @event:project-experience-mission
  @event-authority:project-experience-mission.v1
  @outcome:experience-mission-profile
  @outcome-contract:experience-mission-profile.v1
  @outcome-terminal
  Scenario: See the mission that would close my chosen experience gap
    Given an experience acquisition opportunity I am prepared to close
    When a scenario-driven mission is projected for that opportunity
    Then I can see the scenario obligations, preferred embodiment, and target evidence maturity required to close it

@capability:acquire-market-driven-experience
@root-scenario:acquire-market-driven-experience
Feature: Acquire market-driven experience end to end

  Composes the three independently admitted experience-acquisition
  capabilities through projected invocation v2, each receiving only its own
  declared request branch while its governed outcome is bound back into the
  preserved parent carrier: resolve-experience-gaps identifies which market
  signal the candidate cannot yet demonstrate, project-experience-mission
  turns the chosen gap into a bounded mission, and admit-acquired-experience
  admits execution testimony for that mission as experience evidence only
  when every obligation was demonstrated and proven. A final projection turns
  admitted evidence into a candidate-experience-authority-compatible log
  entry -- the artifact that would close the loop by becoming supporting
  evidence on the next resolve-experience-gaps run -- using a caller-supplied
  experience window rather than fabricating dates the circuit has no way of
  knowing. Nothing is projected when the evidence was not admitted.

  @scenario:acquire-market-driven-experience
  @input:market-driven-experience-acquisition-scope
  @input-contract:market-driven-experience-acquisition-scope.v1
  @event:acquire-market-driven-experience
  @event-authority:acquire-market-driven-experience.v1
  @outcome:market-driven-experience-acquisition-profile
  @outcome-contract:market-driven-experience-acquisition-profile.v1
  @outcome-terminal
  Scenario: Close a chosen market-relevant experience gap end to end
    Given market intelligence, admitted candidate evidence, a chosen target capability, and execution testimony for it
    When the gap is resolved, a mission is projected for the chosen capability, and the testimony is admitted against that mission
    Then I can inspect the full lineage from market signal to admitted experience evidence and a log entry ready to close the loop

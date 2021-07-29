@automation
Feature: Parcel for you-Redelivery Options

  Background: User has submitted original address for parcel

    Given User has tracking number "8963063455001801AKL004AS"
    And User is on redelivery options page

  Scenario: Redelivery to same address
    And User has selected redeliver to same address
    When User submit option
    Then User should be shown contact details page

  Scenario: Redelivery to different address
    And User has selected redeliver to different address
    When User submit option
    Then User should be shown new delivery address option

  Scenario: Redeliver to collection point
    And User has selected redeliver to collection point
    When User submit option
    Then User should be shown parcel collect redelivery

  Scenario: Previous button
    When User submit previous
    Then User should be shown original delivery address
@automation
Feature: Parcel for you-DateTime

  Background: User has submitted contact details
    Given User has tracking number "8963063455001801AKL004AS"
    And User is on date time page


  Scenario: Date Time Picker
    And User select date and time
    When User submit date and time
    Then User should see redelivery instructions page


  Scenario Outline: No date and time selected
    When User submit date and time
    Then User should be shown a message "<message>"

    Examples:
      | message                          |
      | Please select a redelivery date. |

  Scenario: Redeliver to same address - Date time previous button
    When User submit previous
    Then User should be shown contact details page

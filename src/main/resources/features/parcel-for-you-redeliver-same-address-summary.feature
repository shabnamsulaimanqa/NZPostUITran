@automation
Feature: Parcel for you-Summary Page

  Background: User has submitted leave my parcel option
    Given User has tracking number "8963063455001801AKL004AS"
    And User is on summary page


  Scenario: Summary of information provided-Tracking Number
    When User view information
    Then User should be shown tracking number information


  Scenario: Summary of information provided - Redeliver to same address
    When User view information
    Then User should be shown redeliver same address information


  Scenario: Summary of information provided - Contact details
    When User view information
    Then User should be shown contact details information


  Scenario: Summary of information provided - Redelivery Date Time
    When User view information
    Then User should be shown redeliver date time information


  Scenario: Summary of information provided - Redelivery Instructions
    When User view information
    Then User should be shown redelivery instructions information

  Scenario: Edit redeliver to same address - Redelivery Instructions
    When User click on edit on original delivery address
    Then User should be shown original delivery address

  Scenario: Edit contact details - Redelivery Instructions
    When User click on edit on contact details
    Then User should be shown contact details page

  Scenario: Edit date time  - Redelivery Instructions
    When User click on edit on date time
    Then User should see date and time page

  Scenario: Edit redelivery instructions - Redelivery Instructions
    When User click on edit on redelivery instructions
    Then User should see redelivery instructions page

  Scenario Outline: Summary notification
    When User submit summary
    Then User should be shown a message "<message>"

    Examples:

      | message                                 |
      | Please accept the terms and conditions. |

  Scenario: Redelivery - Terms and condition
    When User click on redelivery terms and conditions
    Then User should be redirected to card to call link

  Scenario: Parcel redelivery - Terms and condition
    When User click on parcel redelivery terms and conditions
    Then User should be redirected to parcel card link

  Scenario: Submit page
    And User check terms and conditions
    When User submit summary
    Then User should see success page

  Scenario: Redeliver to same address - Summary Previous button
    When User submit previous
    Then User should see redelivery instructions page
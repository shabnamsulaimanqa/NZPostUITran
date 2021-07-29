@automation
Feature: Parcel for you- Redeliver to collection point

  Background: User has submitted original address for parcel
    Given User has tracking number "8963063455001801AKL004AS"
    And  User is on summary review page with collection point address


  Scenario: Selecting a collection location from the list provided
    When User view information
    Then User should be shown redeliver collection point
    And User should be shown different summary cards for parcel collection

  Scenario Outline: Display notification
    When User submit summary
    Then User should be shown a message "<message>"

    Examples:
      | message                                                  |
      | Please select a collection point from the list provided. |

  Scenario: Collection Point - Previous button
    When User submit previous
    Then User should be shown contact details page

  Scenario: Submit page
    And User click on redelivery terms and conditions
    When User submit summary
    Then User should see success page for parcel collection

  Scenario: Collection point - Terms and condition
    When User click on redelivery terms and conditions
    Then User should be redirected to card to call link
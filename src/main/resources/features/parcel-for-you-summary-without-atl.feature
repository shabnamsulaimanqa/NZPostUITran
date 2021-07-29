@automation
Feature: Parcel for you-Summary Page without ATL

  Background: User has submitted leave my parcel option
    Given User has tracking number "8963063455001800AKL004AS"


  Scenario: Redeliver same address - Summary cards without atl
    And User is on summary page without atl
    When User view information
    Then User should be shown redeliver to the same address information
    And User should be shown different cards

  Scenario: Redelivery online card to link - Terms and condition
    And User is on summary page without atl
    When User click on redelivery terms and conditions
    Then User should be redirected to card to call link

  Scenario: Submit page
    And User is on summary page without atl
    And User check terms and conditions
    When User submit summary
    Then User should see success page

  Scenario: Redeliver to different address - Summary Page without atl
    Given User is on summary review page without atl
    When User view information
    Then User should be shown redeliver different address information
    And User should be shown different cards
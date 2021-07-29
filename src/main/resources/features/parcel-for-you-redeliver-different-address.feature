@automation
Feature: Parcel For You - Redeliver to different address

  Background: User has selected redelivery to different address
    Given User has tracking number "8963063455001801AKL004AS"


  Scenario Outline: Selecting a date and time for redelivery
    Given User is on contact page
    And User has contact details "<contact details>"
    When User submits the contact details form
    Then User should see date and time page

    Examples:
      | contact details  |
      | valid-company    |
      | valid-no-company |

  Scenario: Redeliver to different address - Previous button
    And User is on contact page
    When User submit previous
    Then User should be shown new delivery address option

  Scenario: Redeliver to different address date time picker
    Given User is on date time picker page
    And User select date and time
    When User submit date and time
    Then User should see redelivery instructions page


  Scenario Outline: Redeliver to different address - Redelivery Instructions
    Given User is on authorised page
    And User select leave my parcel option "<leave parcel>"
    When User submit leave my parcel
    Then User should see summary page

    Examples:
      | leave parcel                    |
      | No, thanks                      |
      | Leave on the front porch / deck |
      | Leave on the back porch / deck  |
      | Leave by the front door         |
      | Leave by the back door          |
      | Leave in the mailbox            |

  Scenario: Redeliver to different address - Summary Page with atl
    Given User is on summary review page
    When User view information
    Then User should be shown redeliver different address information
    And User should be shown different summary cards

  Scenario: Edit redeliver to different address - Redelivery Instructions
    And User is on summary review page
    When User click on edit on different address
    Then User should be shown new delivery address option


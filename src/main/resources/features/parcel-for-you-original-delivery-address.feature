@automation
Feature: Parcel for you-Original delivery address

  Background: User has parcel which is eligible for redelivery
    Given User has tracking number "8963063455001801AKL004AS"
    And User is on original delivery address page


  Scenario Outline: Redelivery options with partial address "<partial address>" - select "<address>" from suggestion list
    And User has address "<partial address>"
    And User selects "<address>" from available addresses suggestion list
    When User submit address using button
    Then User should be shown redelivery options available for parcel
    And redeliver to same address option should be selected

    Examples:
      | partial address | address                                          |
      | 14 iwi          | 14 Iwinuku Crescent, Wattle Downs, Auckland 2103 |

  Scenario Outline: Invalid address "<address>"
    And User enters address "<address>"
    When User submit address
    Then User should be shown a message "<message>"

    Examples:
      | address | message                                                                                                 |
      | ABCD    | Please enter the original delivery address for this parcel and select an option from the provided list. |
      |         | Please enter the original delivery address for this parcel and select an option from the provided list. |


  Scenario Outline: Invalid address "<address>"
    And User enters address "<address>"
    When User submit address using button
    Then User should be shown a message "<message>"

    Examples:
      | address | message                                                                                                 |
      | ABCD    | Please enter the original delivery address for this parcel and select an option from the provided list. |
      |         | Please enter the original delivery address for this parcel and select an option from the provided list. |
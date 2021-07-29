@automation
Feature: Parcel for you-New delivery address

  Background: User has selected redeliver to new address option for parcel
    Given User is on new delivery address page

  Scenario Outline: New delivery address with partial address "<partial address>" - select "<address>" from suggestion list
    And User has address "<partial address>"
    And User selects "<address>" from available addresses suggestion list
    When User submit new address using button
    Then User should be shown contact details page

    Examples:
      | partial address | address                                          |
      | 14 iwi          | 14 Iwinuku Crescent, Wattle Downs, Auckland 2103 |

  Scenario Outline: New delivery address with partial address "<partial address>" - select "<address>" from suggestion list
    And User has address "<partial address>"
    And User selects "<address>" from available addresses suggestion list
    When User submit address
    Then User should be shown contact details page

    Examples:
      | partial address | address                                          |
      | 14 iwi          | 14 Iwinuku Crescent, Wattle Downs, Auckland 2103 |

  Scenario Outline: Enter Invalid address "<address>"
    And User enters address "<address>"
    When User submit address
    Then User should be shown a message "<message>"

    Examples:
      | address | message                                                                                            |
      | ABCD    | Please enter the new delivery address for this parcel and select an option from the provided list. |
      |         | Please enter the new delivery address for this parcel and select an option from the provided list. |

  Scenario Outline: Invalid address "<address>"
    And User enters address "<address>"
    When User submit new address using button
    Then User should be shown a message "<message>"

    Examples:
      | address | message                                                                                            |
      | ABCD    | Please enter the new delivery address for this parcel and select an option from the provided list. |
      |         | Please enter the new delivery address for this parcel and select an option from the provided list. |

  Scenario Outline: Entering an address outside 75km of original delivery address
    And User has address "<address>"
    And User selects "<address>" from available addresses suggestion list
    When User submit new address using button
    Then User should be shown a message "<message>"

    Examples:
      | address                                     | message                                                                           |
      | 2 Kerwyn Avenue, East Tamaki, Auckland 2013 | Sorry, this address is not within 75km of the original address. Please try again. |

  Scenario: Previous button
    When User submit previous
    Then User should be shown redelivery option page

  Scenario Outline: Entering same original and new address
    And User has address "<address>"
    And User selects "<address>" from available addresses suggestion list
    When User submit new address using button
    Then User should be shown a message "<message>"

    Examples:
      | address                                        | message                                                                                                                                                                                       |
      | PO Box 201227, Auckland Airport, Auckland 2150 | When redelivering to another address, the redelivery address needs to be different. Please select “Redeliver to the same address” if you would like the parcel delivered to the same address. |
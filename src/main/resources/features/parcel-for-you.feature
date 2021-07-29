@automation
Feature: Parcel for you

  Background: User is on parcel for you page
    Given User is on parcel for you page

  Scenario Outline: Using a Valid CTC or Tracking number "<tracking number>"
    Given User has tracking/CTC number "<tracking number>"
    When User submit tracking number
    Then User should see tracking number is eligible for redelivery

    Examples:
      | tracking number                |
      | 8963063449013905AKL004AS       |
      | 1234567890                     |
      | CTC13529460                    |
      | ABC1234567                     |
      | XX123123123YY                  |
      | 12345678901234567890           |
      | 1234567890ABCDEFGHIJ           |
      | A121234567                     |
      | ABCDE1234567                   |
      | 123451234567                   |
      | ABC1234567ABCDEFGHIJK          |
      | 123123456712345678901          |
      | 123456789012345678901234       |
      | ABCDEFGHIJKLMNOPQRSTUVWX       |
      | 123456789012ABCDEFGIJKL        |
      | 123456789012                   |
      | 098765432109                   |
      | CPWSAV123456789                |
      | CPWSAV234567890                |
      | SUN1234567890                  |
      | SUN0987654321                  |
      | RMA1234567890                  |
      | RMC1234567890                  |
      | RMP1234567890                  |
      | TPW1234567890                  |
      | TPW0987654321                  |
      | 123456789012345678901234567890 |
      | 098765432109876543210987654321 |
      | 23456789012                    |
      | ABC12345678                    |
      | XYZ09876543                    |
      | AB12345678901                  |
      | XY09876543210                  |
      | ABC1234567890                  |
      | XYZ0987654321                  |
      | AB12345678                     |
      | XY09876543                     |
      | ABC12345678901                 |
      | XYZ09876543211                 |
      | MFB01149326012115501AN         |

  Scenario Outline: Using a Valid CTC or Tracking number "<tracking number>"
    Given User has tracking/CTC number "<tracking number>"
    When User submit tracking number using button
    Then User should see tracking number is eligible for redelivery

    Examples:
      | tracking number          |
      | 8963063449013905AKL004AS |
      | 1234567890               |
      | CTC13529460              |

  Scenario Outline: Invalid CTC or tracking number "<tracking number>"
    Given User has tracking/CTC number "<tracking number>"
    When User submit tracking number
    Then User should see message "<message>"

    Examples:
      | tracking number | message                                                                                                           |
      | 123             | Sorry, you have supplied an invalid tracking number. Your tracking number should be between 9-24 characters long. |
      | 12345           | Sorry, you have supplied an invalid tracking number. Your tracking number should be between 9-24 characters long. |
      | CTC12345@       | Sorry, you have supplied an invalid tracking number. Your tracking number should be between 9-24 characters long. |

  Scenario Outline: Using a tracking number "<tracking number>" that is not eligible for redelivery
    Given User has tracking/CTC number "<tracking number>"
    When User submit tracking number
    Then User should see a message "<message>" not available for redelivery

    Examples:
      | tracking number          | message                                                                                      |
      | 8963063449013903AKL004AS | Sorry, the provided tracking number is not available for redelivery. Please try again later. |
Feature: User should be able to mark receipt as 'cooked'

  Background:
    Given signed in user
    And receipt "Pepsi"

  Scenario: User add receipt to cooked list
    When visit "Pepsi" receipt page
    And click "I cooked this"
    And visit "Cooked receipts" page
    Then see "Pepsi" receipt

  Scenario: User should not see 'I cooked this' button if receipt is already in cooked list
    When visit "Pepsi" receipt page
    And click "I cooked this"
    Then visit "Pepsi" receipt page
    And not see "I cooked this" button
    But see "You cooked this recipe"

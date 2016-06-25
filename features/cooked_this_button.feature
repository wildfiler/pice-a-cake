Feature: User should be able to mark recipe as 'cooked'

  Background:
    Given signed in user
    And recipe "Pepsi"

  Scenario: User add recipe to cooked list
    When visit "Pepsi" recipe page
    And click "I cooked this"
    And visit "Cooked recipes" page
    Then see "Pepsi" recipe

  Scenario: User should not see 'I cooked this' button if recipe is already in cooked list
    When visit "Pepsi" recipe page
    And click "I cooked this"
    Then visit "Pepsi" recipe page
    And not see "I cooked this" button
    But see "You cooked this recipe"

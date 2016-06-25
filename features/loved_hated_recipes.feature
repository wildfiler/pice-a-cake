Feature: User can add ingredient to loved/hated lists

  Background:
    Given signed in user
    And recipe "Yummy potato"

  Scenario: User add recipe to loved list
    When visit "Yummy potato" recipe page
    And click "I love this"
    And visit "my loved recipes" page
    Then see "Yummy potato" recipe

  Scenario: User add recipe to hated list
    When visit "Yummy potato" recipe page
    And click "I hate this"
    And visit "my hated recipes" page
    Then see "Yummy potato" recipe

Feature: User can add ingredient to loved/hated lists

  Background:
    Given signed in user
    And receipt "Yummy potato"

  Scenario: User add receipt to loved list
    When visit "Yummy potato" receipt page
    And click "I love this"
    And visit "my loved receipts" page
    Then see "Yummy potato" receipt

  Scenario: User add receipt to hated list
    When visit "Yummy potato" receipt page
    And click "I hate this"
    And visit "my hated receipts" page
    Then see "Yummy potato" receipt

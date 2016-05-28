@wip
Feature: User can add ingredient to loved/hated lists

  Background:
    Given signed in user
    And ingredient "Yummy potato"

  Scenario: User add ingredient to loved list
    When visit "Yummy potato" ingredient page
    And click "I love this"
    And visit "my loved ingredients" page
    Then see "Yummy potato" ingredient

  Scenario: User add ingredient to hated list
    When visit "Yummy potato" ingredient page
    And click "I hate this"
    And visit "my hated ingredients" page
    Then see "Yummy potato" ingredient

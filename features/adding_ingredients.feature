Feature: Adding ingredients

  Background:
    Given signed in user

  Scenario: Add simple ingredient
    When visit "add ingredient" page
    And fill "name" with "Carrot"
    And check "vegetarian" checkbox
    And click "Save"
    And visit "Ingredient list" page
    Then see "Carrot" ingredient

  Scenario: Add child ingredient
    Given ingredient "Flour"
    When on "add ingredient" page
    And fill "name" with "Rice flour"
    And select "parent" as "Flour"
    Then visit "Ingredient list" page
    And see "Flour" ingredient
    Then visit "Rice flour" ingredient page
    And see "Parent: Flour"


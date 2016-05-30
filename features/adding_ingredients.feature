Feature: Adding ingredients

  Background:
    Given signed in user

  Scenario: Add simple ingredient
    When visit "add ingredient" page
    And fill "Name" with "Carrot"
    And check "Vegetarian" checkbox
    And click "Save"
    And visit "Ingredients list" page
    Then see "Carrot" ingredient

  Scenario: Add child ingredient
    Given ingredient "Flour"
    When visit "add ingredient" page
    And fill "Name" with "Rice flour"
    And select "Parent" as "Flour"
    And click "Save"
    Then visit "Ingredients list" page
    And see "Rice flour" ingredient
    Then visit "Rice flour" ingredient page
    And see "Parent: Flour"

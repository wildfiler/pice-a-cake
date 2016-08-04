Feature: Adding Recipes

  Background:
    Given signed in user
    And 5 ingredients

  @javascript
  Scenario: Add simple recipe with multiple ingredients
    When visit "Add recipe" page
    And fill recipe form
    And click "Create Recipe"
    Then I expect to be on added recipe page
    And I expect to see recipt components
  @javascript
  Scenario: Add recipe with multiple steps
    When visit "Add recipe" page
    And fill recipe form
    And fill five steps for recipe
    And click "Create Recipe"
    Then I expect to be on added recipe page
    And see recipe steps

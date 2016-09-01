@future
Feature: Editing existing recipe

  Background:
    Given signed in user
    And recipe with components and steps
    When visit existing recipe edit page

  Scenario: Edit some steps of recipe
    When change one component of recipe
    And change one step of recipe
    And click "Save Recipe"
    Then I expect to be on existing recipe page
    And I expect to see that changes

  Scenario: Add steps to recipe
    When add one step to recipe
    And click "Save Recipe"
    Then I expect to be on existing recipe page
    And I expect to see that step

  Scenario: Add component to recipe
    When add one component to recipe
    And click "Save Recipe"
    Then I expect to be on existing recipe page
    And I expect to see that component

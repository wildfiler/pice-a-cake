@future
Feature: FAQ page section

  Scenario: Create Question and Answer
    Given signed in user
    When visit "FAQ" page
    And click "Add new"
    And fill question with answer info
    Then on "FAQ" page
    And I see question on the page

  Scenario: User visits FAQ page
    Given two questions exists
    When visit "FAQ" page
    Then I see two questions with answers

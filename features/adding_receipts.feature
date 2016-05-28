@wip
Feature: Adding Receipts

  Scenario: Add simple receipt with multiple ingredients
    Given signed in user
    And ingredients
      | name      |
      | Grechka   |
      | Water     |
      | Salt      |
      | Green tea |
    When visit "Add receipt" page
    And fill "title" with "Grechka Tea"
    And add ingredients
      | name      | quantity | unit |
      | Grechka   | 100      | kg   |
      | Water     | 5000     | l    |
      | Salt      | 30       | kg   |
      | Green tea | 1        | t    |
    And fill "description" with "Traditional Idiots tea"
    And click "Save"
    Then on "Grechka Tea" receipt page

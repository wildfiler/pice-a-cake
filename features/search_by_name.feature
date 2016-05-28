@wip
Feature: Search by receipt name

  Scenario: Search by partial name
    Given receipts
      | name           |
      | Cupcake        |
      | Poopcake       |
      | Fry Strawberry |
    When visit "home" page
    And fill "search_query" with "cake"
    And click "Search"
    Then see "Cupcake" receipt
    And see "Poopcake" receipt
    But not see "Fry Strawberry" receipt

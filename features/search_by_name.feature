Feature: Search by recipe name

  Scenario: Search by partial name
    Given recipes
      | name           |
      | Cupcake        |
      | Poopcake       |
      | Fry Strawberry |
    When visit "home" page
    And fill "Enter recipe name" with "cake"
    And click "Search"
    Then see "Cupcake" recipe
    And see "Poopcake" recipe
    But not see "Fry Strawberry" recipe

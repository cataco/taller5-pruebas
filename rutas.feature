Feature: Search Routes

  Scenario: As a user I want to be able to search a Transmilenio Route
    Given I press "Rutas"               
    When I press "Transmilenio"
    And I scroll down
    Then I should see the text containing "Concejo de Bogotá"
  
  Scenario: As a user I want to be able to search a Complementario Route
    Given I press "Rutas"               
    When I swipe Right
    And I swipe Right
    Then I should see "4A"
    And I should see "7'

  Scenario: As a user I want to be able to search a Alimentador Route
    Given I press "Rutas"               
    When I swipe Right
    And I swipe Right
    And I swipe Right
    And I swipe Right
    And I swipe Right
    And I scroll down
    And I scroll down
    And I scroll down
    And I scroll down
    Then I should see the text containing "Mirandela"

  
Feature: I want to create a new session
  As user
  I want to create a new session
  so that I go to the home page as a logged user

  Scenario: Create Session
    Given I am on the home page
    When I click on "Accedi"
    Given I filled the form for signing in
    When I click on "Accedi"
    Then I should be on the home page as "Dante Alighieri"

Feature: I want to create a new user
  I want to create a new user
  so that I go to the home page as a logged user

  Scenario: Create User
    Given I am on the home page
    When I click on "Registrati"
    Given I filled the form for signing up
    When I click on "Registrati"
    Then I should be on the home page as "Esempio"

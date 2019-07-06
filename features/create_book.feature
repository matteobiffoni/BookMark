Feature: I want to create a new book
  As writer
  I want to create a new book
  so that I go to the book page

  Scenario: Create Book
    Given I am on the home page as an authenticated writer
    When I click on "Continua come Dante Alighieri"
    And I click on "Aggiungi un libro"
    Given I filled the form for adding a book
    When I click on "Carica"
    Then I should be on the page of the book

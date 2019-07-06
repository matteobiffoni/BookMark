Feature: I want to add a book to my favs
  As reader or writer
  I want to add a book to my favs
  so that I can go to my profile page and see that book in favourites tab

  Scenario: Add Book to Favs
    Given I am on the home page as an authenticated reader or writer
    When I click on "Continua come Dante Alighieri"
    And I visit a book page
    And I click on "Aggiungi ai preferiti"
    When I go to my profile
    Then I should be able to see "Il Decamerone" in favourites tab

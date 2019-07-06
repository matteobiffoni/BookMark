Given("I am on the home page as an authenticated reader or writer") do
  visit 'https://bookmark-lassi.herokuapp.com/users/sign_in'
  fill_in "Email", :with => "alighieri@email.it"
  fill_in "Password", :with => "123456"
  click_on("Accedi")
end

When("I visit a book page") do
  visit 'https://bookmark-lassi.herokuapp.com/books/2'
end

When("I go to my profile") do
  visit 'https://bookmark-lassi.herokuapp.com/users/2'
end

Then("I should be able to see {string} in favourites tab") do |string|
  page.has_content?("#{string}")
end

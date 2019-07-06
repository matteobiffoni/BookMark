Given("I am on the home page") do
  visit 'https://bookmark-lassi.herokuapp.com/'
end

When("I click on {string}") do |string|
  click_on(string)
end


Given("I filled the form for signing in") do
  fill_in "Email", :with => "alighieri@email.it"
  fill_in "Password", :with => "123456"
end

Then("I should be on the home page as {string}") do |string|
  page.has_content?("Continua come #{string}")
end

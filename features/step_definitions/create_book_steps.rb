Given("I am on the home page as an authenticated writer") do
  visit 'https://bookmark-lassi.herokuapp.com/users/sign_in'
  fill_in "Email", :with => "alighieri@email.it"
  fill_in "Password", :with => "123456"
  click_on("Accedi")
end

Given("I filled the form for adding a book") do
  fill_in "Titolo", :with => "Libro di prova"
  fill_in "Genere", :with => "Genere di prova"
  fill_in "Link Amazon", :with => "https://amazon.com"
  fill_in "Trama", :with => "Trama di prova"
  fill_in "Anno di pubblicazione", :with => "2019"
  sleep(2)
end

Then("I should be on the page of the book") do
  page.has_content?("Libro di prova")
  page.has_content?("Modifica")
  page.has_content?("Vai a LIBRI")
end

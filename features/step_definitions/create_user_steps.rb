Given("I filled the form for signing up") do
  fill_in "Nome", :with => "Esempio"
  fill_in "Email", :with => "esempio@email.it"
  select "Lettore/Lettrice", :from => "Ruolo"
  fill_in "Password", :with => "123456"
  fill_in "Conferma password", :with => "123456"
end

When("eu clico no link chamado Motoristas") do
  click_link 'Motoristas'
end

When("estou na pagina que lista motoristas") do
  expect(page).to have_content("Motoristas")
end

When("eu clico em Novo Motorista") do
  click_link 'Novo Motorista'
end

When("estou na pagina de adicionar um motorista") do
  expect(page).to have_content("Novo Motorista")
end

When("eu preencho os campos CPF com {string}, nome com {string}, numero de horas com {string} e telefone {string}") do |cpf, nome, numeroDeHoras, telefone|
  fill_in 'motorista[cpf]', :with => cpf
  fill_in 'motorista[nome]', :with => nome
  fill_in 'motorista[numeroDeHoras]', :with => numeroDeHoras
  fill_in 'motorista[telefone]', :with => telefone
end

When("eu clico em Create Motorista") do
  click_button 'Create Motorista'
end

Then("eu devo ver que o motorista com nome {string} foi adicionado corretamente") do |nome|
  visit '/motorista'
  expect(page).to have_selector(:link_or_button, nome)
end

When("eu vejo um motorista com nome {string} ja existente") do |nome|
  click_link 'Novo Motorista'
  fill_in 'motorista[cpf]', :with => '70526991410'
  fill_in 'motorista[nome]', :with => nome
  fill_in 'motorista[numeroDeHoras]', :with => '50'
  fill_in 'motorista[telefone]', :with => '99836613'
  click_button 'Create Motorista'
  visit '/motorista'
  expect(page).to have_selector(:link_or_button, nome)
end

Then("eu devo ver que o motorista com nome {string} foi removido corretamente") do |nome|
  expect(page).not_to have_selector(:link_or_button, nome)
end

When("eu clico no botao com o nome {string} referente ao motorista") do |nome|
  click_link nome
end

When("eu clico no botao Update Motorista") do
  click_button 'Update Motorista'
end

Then("eu devo ver que o motorista agora tem o CPF {string}, nome {string}, numero de horas {string} e telefone {string}") do |cpf, nome, numeroDeHoras, telefone|
  expect(page).to have_content(cpf)
  expect(page).to have_content(nome)
  expect(page).to have_content(numeroDeHoras)
  expect(page).to have_content(telefone)
end

Then("eu devo ver que o motorista com nome {string} tem as informacoes corretas") do |nome|
  expect(page).to have_content(nome)
  expect(page).to have_content('70526991410')
  expect(page).to have_content('50')
  expect(page).to have_content('99836613')
end
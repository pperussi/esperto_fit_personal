require 'rails_helper'
#Corrigir a rota(mudar de Appointment p/ Schedule)
feature 'Customer can see Personal schedules' do
  before(:each) do
    list_gyms
  end

  scenario 'Successfully' do
    #Arrange
    unit = create(:unit)
    personal = create(:personal, email: 'teste@email.com', password: '123456')
    personal_profile = create(:profile, account: personal, first_name: 'Patricia')
    customer = create(:customer, unit: unit)
    customer_profile = create(:profile, account: customer)

    create(:schedule, date: '2019-10-09', start: 10, finish: 18, price: "50", personal: personal, unit: unit)

    #Act
    login_as(customer, scope: :account)
    visit root_path
    click_on 'Unidades Disponíveis'
    click_on unit.name
    click_on "Personals na #{unit.name}"

    #Assert
    expect(page).to have_css('th', text: "Patricia")
    expect(page).to have_css('td', text: "09/10/2019")
    expect(page).to have_css('td', text: "#{unit.schedules[0].start} às #{unit.schedules[0].finish}")
    expect(page).to have_css('td', text: "#{unit.schedules[0].price}")
  end

  scenario 'and there are no schedules in his unit' do
    unit = create(:unit)
    customer = create(:customer, unit: unit)
    customer_profile = create(:profile, account: customer)

    login_as(customer, scope: :account)
    visit root_path
    click_on 'Unidades Disponíveis'
    click_on unit.name
    click_on "Personals na #{unit.name}"

    expect(page).to have_content('Até o momento não há aulas de Personal disponível nesta unidade.')
  end
end

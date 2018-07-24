require 'rails_helper'

describe 'user navigation' do
  before do
    visit new_user_registration_path
  end

  describe 'creation' do
    it 'can reach the sign up page' do
      expect(page.status_code).to eq(200)
    end
    it 'has a registration form and it can be filled' do
      fill_in 'user[email]', with: "test@test.com"
      fill_in 'user[password]', with: "asdfasdf"
      fill_in 'user[password_confirmation]', with: "asdfasdf"
      fill_in 'user[first_name]', with: "Fernando"
      fill_in 'user[last_name]', with: "Garcia"
      fill_in 'user[maternal_surname]', with: "Acosta"
      fill_in 'user[telephone]', with: "4921509646"
      fill_in 'user[street]', with: "Villa del nogal"
      fill_in 'user[number]', with: "49"
      fill_in 'user[city]', with: "Zacatecas"
      fill_in 'user[mun]', with: "Zacatecas"
      fill_in 'user[country]', with: "Mexico"
      fill_in 'user[tittle]', with: "LN"
      fill_in 'user[suburb]', with: "Centro"
      fill_in 'user[cp]', with: "98000"
      click_on "Enviar"
      expect(page).to have_content("Fernando")
    end

  end
end

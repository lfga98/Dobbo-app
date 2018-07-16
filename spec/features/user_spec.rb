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
      fill_in 'user[telephone]', with: "Adios"
      click_on "Sign up"
      expect(page).to have_content("Welcome")
    end

  end
end

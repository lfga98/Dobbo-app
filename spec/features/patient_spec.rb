require 'rails_helper'

describe 'navigate' do

  before do
    user = User.create(email: "test@test.com",password: "asdfasdf",password_confirmation: "asdfasdf", first_name: "Luis", last_name: "Garcia", maternal_surname: "Acosta",telephone:"1234567890")
    login_as(user, :scope => :user)
  end

  describe 'index' do
    it 'can be reached successfully' do
      visit patients_path
      expect(page).to have_content("Informacion")
    end

    it 'has de information of the patient' do
      visit patients_path
      expect(page).to have_content("Leonardo")
    end
    it 'a patient can be created from a page' do
      visit new_patient_path
      expect(page.status_code).to eq(200)
    end

  end
end

require 'rails_helper'

describe 'navigate' do

  before do
    user = User.create(email: "test@test.com",password: "asdfasdf",password_confirmation: "asdfasdf", first_name: "Luis", last_name: "Garcia", maternal_surname: "Acosta",telephone:"1234567890")
    login_as(user, :scope => :user)

    @patient=Patient.create(first_name:"Leonardo",last_name: "Garcia", maternal_surname: "Acosta",age:10,date_birth: Date.today)
  end

  describe 'index' do
    it 'can be reached successfully' do
      visit patients_path
      expect(page).to have_content("Informacion")
    end
    it 'has de information of the patient' do
      visit patients_path
      expect(page).to have_content(@patient.first_name)
    end

  end

  describe 'creation' do
    before do
      visit new_patient_path
    end

    it 'has a new page for creation' do
      expect(page.status_code).to eq(200)
    end

    it 'has a creation form' do
      fill_in 'patient[first_name]', with:  'Jacqueline'
      fill_in 'patient[last_name]', with:  'Garcia'
      fill_in 'patient[maternal_surname]', with:  'Acosta'
      fill_in 'patient[age]', with: 12
      fill_in 'patient[date_birth]', with: Date.today

      expect { click_on "Guardar" }.to change(Patient, :count).by(1)
    end



  end




end

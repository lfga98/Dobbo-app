require 'rails_helper'

describe 'navigate' do


  before do
    @user = FactoryBot.create(:user)
    @appointment = FactoryBot.create(:appointment)
    login_as(@user, :scope => :user)
  end

  describe 'index' do
    it 'can be reached successfully' do
      visit appointments_path
      expect(page).to have_content("Todas las citas ")
    end

    xit 'has the information of the patient' do
      visit appointments_path
      expect(page).to have_content(@appointment.patient.name)
    end
  end

  describe 'creation' do
    before do
      visit new_patient_path
    end

    it 'has a new page for creation' do
      expect(page.status_code).to eq(200)
    end

  end




end

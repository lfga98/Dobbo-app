require 'rails_helper'

describe 'navigate' do

  
  before do
    @user = User.create(email: "test@test.com",password: "asdfasdf",password_confirmation: "asdfasdf", first_name: "Luis", last_name: "Garcia", maternal_surname: "Acosta",telephone:"1234567890",street:"Villa del nogal",number:12,city:"Zacatecas",mun:"Guadalupe",country:"México",tittle:"Licenciado en Nutrición",suburb:"Villas de Guadalupe",cp:98612)

    login_as(@user, :scope => :user)

    @patient=Patient.create(
      first_name:"Leonardo",
      last_name: "Garcia",
      maternal_surname: "Acosta",
      age:16,
      date_birth: Date.today,
      gender: "Hombre",
      civil_status:"Soltero",
      scholarship:"Primaria" ,
      occupation: "Constructor",
      street: "Villa del nogal",
      suburb: "Villas de guadalupe",
      city: "Guadalupe",
      mun: "Guadalupe",
      county: "Zacatecas",
      telephone: "4921783456",
      email: "Leonardo@gmail.com",
      reason_desc:"Adios",
      number:12,
      user_id:@user.id)
  end

  describe 'index' do
    it 'can be reached successfully' do
      visit patients_path
      expect(page).to have_content("pacientes")
    end

    it 'has the information of the patient' do
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
      fill_in 'patient[scholarship]', with: "Preparatoria"
      fill_in 'patient[occupation]', with: "Estudiante"
      fill_in 'patient[street]', with: "Villa del nogal"
      fill_in 'patient[suburb]', with: "Villas de Guadalupe"
      fill_in 'patient[city]', with: "Guadalupe"
      fill_in 'patient[mun]', with: "Guadalupe"
      fill_in 'patient[county]', with: "Zacatecas"
      fill_in 'patient[telephone]', with: "4926784538"
      expect { click_on "Guardar" }.to change(Patient, :count).by(1)
    end
    it 'will have a user associated it' do
      fill_in 'patient[first_name]', with:  "Rosa Nelly"
      fill_in 'patient[last_name]', with:  'Acosta'
      fill_in 'patient[maternal_surname]', with:  'Becerra'
      fill_in 'patient[age]', with: 24
      fill_in 'patient[date_birth]', with: Date.today
      fill_in 'patient[scholarship]', with: "Preparatoria"
      fill_in 'patient[occupation]', with: "Estudiante"
      fill_in 'patient[street]', with: "Villa del nogal"
      fill_in 'patient[suburb]', with: "Villas de Guadalupe"
      fill_in 'patient[city]', with: "Guadalupe"
      fill_in 'patient[mun]', with: "Guadalupe"
      fill_in 'patient[county]', with: "Zacatecas"
      fill_in 'patient[telephone]', with: "4926784538"
      click_on "Guardar"
      expect(User.last.patients.last.first_name).to eq("Rosa Nelly")
    end
  end

  describe "Modification" do
    before do
      visit edit_patient_path(@patient)
    end

    it 'has an edit page for patient' do
      expect(page.status_code).to eq(200)
    end
    it 'has an edit form' do
        fill_in 'patient[first_name]', with: "Calixto"
        click_on "Guardar"
        expect(User.last.patients.last.first_name).to eq("Calixto")
    end
  end




end

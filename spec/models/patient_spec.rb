require 'rails_helper'

RSpec.describe Patient, type: :model do

  let(:patient) do
      Patient.create(
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
        reason_desc:"Adios")
  end

  describe "creation" do

    it "can be created" do
      expect(patient).to be_valid
    end
  end

  describe "validations" do
    it "has to have a first name" do
      patient.first_name = nil
      expect(patient).to_not be_valid
    end
    it "has to have a maternal surname" do
      patient.maternal_surname = nil
      expect(patient).to_not be_valid
    end

    it 'has to have a telephone' do
      patient.telephone=nil
      expect(patient).to_not be_valid
    end
    it 'telephone has only 10 digits' do
      patient.telephone="12345678901"
      expect(patient).to_not be_valid
    end
    it 'telephone has only numbers' do
      patient.telephone="asdfghjklñ"
      expect(patient).to_not be_valid
    end
  end

end

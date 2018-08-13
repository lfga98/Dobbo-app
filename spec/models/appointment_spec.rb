require 'rails_helper'

RSpec.describe Appointment, type: :model do
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
  let(:appointment) do
      Appointment.create(
        start_date: "5-07-2018 10:00:00",
        end_date: "5-07-2018 15:00:00",
        observation: "Juanito",
        patient_id: patient.id
      )
  end

  describe "creation" do
    it "can be created" do
      expect(appointment).to be_valid
    end
  end

  describe "validations" do
    it 'has a start date' do
      appointment.start_date=nil
      expect(appointment).to_not be_valid
    end
    it 'has an end date' do
      appointment.end_date=nil
      expect(appointment).to_not be_valid
    end


  end



end

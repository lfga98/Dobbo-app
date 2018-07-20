require 'rails_helper'

RSpec.describe Patient, type: :model do

  let(:patient) do
    Patient.create(first_name:"Leonardo",last_name: "Garcia", maternal_surname: "Acosta",age:16,date_birth: Date.today)
  end

  describe "creation" do
    before do

    end
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
    it "has to have an age " do
      patient.age = nil
      expect(patient).to_not be_valid
    end
    it "has to have a date of birth" do
      patient.date_birth = nil
      expect(patient).to_not be_valid
    end
  end

end

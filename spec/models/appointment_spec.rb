require 'rails_helper'

RSpec.describe Appointment, type: :model do
  let(:appointment) do
      Appointment.create(
        start_date: Date.today+"10:00:00",
        end_date: Date.today+"15:00:00",
        name: "Juanito",
        patient_id: 1
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

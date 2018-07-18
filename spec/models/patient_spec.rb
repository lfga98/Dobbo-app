require 'rails_helper'

RSpec.describe Patient, type: :model do

  describe "creation" do
    before do
      @patient = Patient.create(first_name:"Leonardo",last_name: "Garcia", maternal_surname: "Acosta",age:16,date_birth: Date.today)
    end
    it "can be created" do
      expect(@patient).to be_valid
    end
  end


end

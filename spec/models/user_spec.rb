require 'rails_helper'

RSpec.describe User, type: :model do
  describe "creation" do
    before do
      @user = User.create(email: "test@test.com",password: "asdfasdf",password_confirmation: "asdfasdf", first_name: "Luis", last_name: "Garcia", maternal_surname: "Acosta")
    end

    it "can be created" do
      expect(@user).to be_valid
    end
    it "has to contain a first name" do
      @user.first_name=nil
      expect(@user).to_not be_valid
    end
    it "has to contain a last name" do
      @user.last_name=nil
      expect(@user).to_not be_valid
    end
    it "has to contain a martenal surname" do
      @user.maternal_surname=nil
      expect(@user).to_not be_valid
    end

  end
end

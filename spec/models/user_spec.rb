require 'rails_helper'

RSpec.describe User, type: :model do

  describe "creation" do
    before do
        @user = User.create(email: "test@test.com",password: "asdfasdf",password_confirmation: "asdfasdf", first_name: "Luis", last_name: "Garcia", maternal_surname: "Acosta",telephone:"1234567890",street:"Villa del nogal",number:12,city:"Zacatecas",mun:"Guadalupe",country:"México",tittle:"Licenciado en Nutrición",suburb:"Villas de Guadalupe",cp:98612)
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
    it "has to contain a maternal surname" do
      @user.maternal_surname=nil
      expect(@user).to_not be_valid
    end
    it "has to contain a telephone number" do
      @user.telephone=nil
      expect(@user).to_not be_valid
    end

    it "phone number has to be a number" do
      @user.telephone="abcdefghij"
      expect(@user).to_not be_valid
    end

    it "phone number has to be a 10 digits" do
      @user.telephone="12345678901"
      expect(@user).to_not be_valid
    end

    it "has to contain a stret" do
      @user.street=nil
      expect(@user).to_not be_valid
    end

    it "has to contain a number" do
      @user.number=nil
      expect(@user).to_not be_valid
    end

    it "number only numeric values" do
      @user.number="asdf"
      expect(@user).to_not be_valid
    end

    it "has to contain a city" do
      @user.city=nil
      expect(@user).to_not be_valid
    end

    it "has to contain a county" do
      @user.country=nil
      expect(@user).to_not be_valid
    end

    it "has to contain a suburb" do
      @user.suburb=nil
      expect(@user).to_not be_valid
    end

    it "has to contain a cp" do
      @user.cp=nil
      expect(@user).to_not be_valid
    end

    it "cp are only numeric values" do
      @user.cp="asdfasdf"
      expect(@user).to_not be_valid
    end

  end

end

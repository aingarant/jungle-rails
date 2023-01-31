require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    before(:each) do
      @user = User.new(first_name: "Aingaran", last_name: "Thirunadarajah", email: "email@aingaran.com", password: "password", password_confirmation: "password")
    end
    
    it "saves when password is confirmed." do 
      @user.save
      expect(@user).to be_valid
    end

    it "doesn't saver when password isn't confirmed" do 
      @user.password_confirmation = "not_password"
      @user.save
      expect(@user).not_to be_valid

    end

    it "it doesn't create a user if a email already exists in the database" do 
      @user1 = User.new(first_name: "first_name", last_name: "last_name", email: "test@test.com", password: "password", password_confirmation:"password")
      @user1.save
      expect(User.all.count).to eq(1)

      @user2 = User.new(first_name: "first_name", last_name: "last_name", email: "test@test.com", password: "password", password_confirmation:"password")
      @user2.save
  
      expect(@user2).to_not be_valid
      expect(@user2.errors.full_messages).to include "Email has already been taken"
    end

    it "it requires an email to create a user" do 
      @user.email = nil
      @user.save
      expect(@user).not_to be_valid
    end

    it "it requires a first name to create a user" do 
      @user.first_name = nil
      @user.save
      expect(@user).not_to be_valid
    end

    it "it requires a last name to create a user" do 
      @user.last_name = nil
      @user.save
      expect(@user).not_to be_valid
    end

    it "it requires the password to have a minimum length of 8 characters to create a user" do 
      @user.password = "1234"
      @user.password_confirmation = "1234"
      @user.save
      expect(@user).not_to be_valid
    end

  end

  describe '.authenticate_with_credentials' do
    before(:each) do
      @user = User.new(first_name: "Aingaran", last_name: "Thirunadarajah", email: "email@aingaran.com", password: "password", password_confirmation: "password")
    end
    
    it "it requires email and password authentication to log in" do 
      @user.save
      expect(@user).to be_valid
      expect(@user.authenticate_with_credentials("email@aingaran.com", "password")).to be_truthy 
    end

    it "it should allow a user to log in with spaces before the email address" do 
      @user.save
      expect(@user).to be_valid
      expect(@user.authenticate_with_credentials("  email@aingaran.com", "password")).to be_truthy
    
    end

    it "it should allow a user to log in if the email address has the wrong case" do 
      @user.save
      expect(@user).to be_valid
      expect(@user.authenticate_with_credentials("email@AINGARAN.com", "password")).to be_truthy
    
    end
  end
end
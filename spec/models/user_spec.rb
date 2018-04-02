require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do

    before :each do
      @user = User.new({
        first_name: "Gerald",
        last_name: "Smith",
        email: "geraldsmith@email.com",
        password: "secretpass",
        password_confirmation: "secretpass"
      })
    end

    it 'should validate the presence of password' do
      @user.password = nil
      @user.save
      expect(@user.errors.full_messages.length).not_to eql(0)
    end

    it 'should validate the presence of password_confirmation' do
      @user.password_confirmation = nil
      @user.save
      expect(@user.errors.full_messages.length).not_to eql(0)
    end

    it 'should validate the presence of email' do
      @user.email = nil
      @user.save
      expect(@user.errors.full_messages.length).not_to eql(0)
    end

    it 'should validate the presence of first_name' do
      @user.first_name = nil
      @user.save
      expect(@user.errors.full_messages.length).not_to eql(0)
    end

    it 'should validate the presence of last_name' do
      @user.last_name = nil
      @user.save
      expect(@user.errors.full_messages.length).not_to eql(0)
    end

    it 'should ensure password and password_confirmation are the same' do
      @user.password = "differentpass"
      @user.save
      expect(@user.errors.full_messages.length).not_to eql(0)
    end

    it 'should ensure the signup email is unique (has not been used before)' do
      @user.save
      @user2 = User.new({
        first_name: "Joe",
        last_name: "Shmo",
        email: "GERALDSMITH@email.com",
        password: "diffpass",
        password_confirmation: "diffpass"
      })
      @user2.save
      expect(@user2.errors.full_messages.length).not_to eql(0)
    end

    it 'should ensure the password is at least the required minimum length' do
      @user.password = "123"
      @user.password_confirmation = "123"
      @user.save
      expect(@user.errors.full_messages.length).not_to eql(0)
    end

  end

  describe '.authenticate_with_credentials' do

    before :each do
      @user = User.new({
        first_name: "Gerald",
        last_name: "Smith",
        email: "geraldsmith@email.com",
        password: "secretpass",
        password_confirmation: "secretpass"
      })
      @user.save
    end

    it 'should validate email and password to see if user exists and info is correct' do
      @result = User.authenticate_with_credentials("geraldsmith@email.com", "secretpass" )
      expect(@result.class).to eql(User)
    end

    it 'should return nil if username and password do not match that of created user' do
      @result = User.authenticate_with_credentials("geraldsmith@email.com", "difpass")
      expect(@result).to eql(nil)
    end

    it 'should validate if email is correct but there is unintentional white space before or after' do
      @result = User.authenticate_with_credentials("  geraldsmith@email.com", "secretpass")
      expect(@result.class).to eql(User)
    end

    it 'should validate if email is correct but printed in the wrong case' do
      @result = User.authenticate_with_credentials("GERALDsmith@EMAIL.com", "secretpass")
      expect(@result.class).to eql(User)
    end

  end

end

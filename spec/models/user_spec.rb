require 'rails_helper'

require 'pp'

RSpec.describe User, type: :model do
  
  describe 'Validations' do

    describe 'first name' do
      it "should exist" do
        @user = User.new(first_name: 'Lars', last_name: 'Ulrich', email: 'metallica@metallica.com', password: 'ridethelightning', password_confirmation: 'ridethelightning')
        expect(@user.first_name).to be_present
      end
    end

    describe 'last_name' do
      it "should exist" do
        @user = User.new(first_name: 'Lars', last_name: 'Ulrich', email: 'metallica@metallica.com', password: 'ridethelightning', password_confirmation: 'ridethelightning')
        expect(@user.last_name).to be_present
      end
    end

    describe 'email' do
      it "should exist" do
        @user = User.new(first_name: 'Lars', last_name: 'Ulrich', email: 'metallica@metallica.com', password: 'ridethelightning', password_confirmation: 'ridethelightning')
        expect(@user.email).to be_present
      end
    end

    describe 'Password' do
      it "should exist" do
        @user = User.new(first_name: 'Lars', last_name: 'Ulrich', email: 'metallica@metallica.com', password: 'ridethelightning', password_confirmation: 'ridethelightning')
        expect(@user.password).to be_present
      end
    end

    describe 'Password Length' do
      it "should be" do
        @user = User.new(first_name: 'Lars', last_name: 'Ulrich', email: 'metallica@metallica.com', password: 'ridethelightning', password_confirmation: 'ridethelightning')
        
        expect(@user.password.length()).to be > 10
      end
    end

  end

  describe '.authenticate_with_credentials' do

    it "should be a valid user" do
      @user = User.new(first_name: 'Lars', last_name: 'Ulrich', email: 'METALLICA@METALLICA.com', password: 'ridethelightning', password_confirmation: 'ridethelightning')
      @user.email = @user.email.downcase().strip()
      @user.save
      expect(@user.authenticate_with_credentials(@user.email, @user.password)).to eq(@user)
    end

  end 

end

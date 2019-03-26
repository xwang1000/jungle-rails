require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'returns false when saving a user with different password and password confirmation' do
      @user = User.new(first_name: 'nancy1234', last_name: 'Boba', email: 'boba@example.com', password: 'nancy1234', password_confirmation: 'bandfaecy')
      expect(@user.save).to eq false
    end

    it 'returns true when saving a user with the password and password confirmation' do
      @user = User.new(first_name: 'nancy1234', last_name: 'Boba', email: 'boba@example.com', password: 'nancy1234', password_confirmation: 'nancy1234')
      expect(@user.save).to eq true
    end

    it 'returns false when saving users with the same email' do
      @user1 = User.new(first_name: 'nancy1234', last_name: 'Boba', email: 'boba@example.com', password: 'nancy1234', password_confirmation: 'nancy1234')
      @user2 = User.new(first_name: 'nancy1234', last_name: 'Boba', email: 'boba@example.com', password: 'nancy1234', password_confirmation: 'nancy1234')
      @user1.save
      expect(@user2.save).to eq false
    end

    it 'returns false when saving users with the same email but different cases' do
      @user1 = User.new(first_name: 'nancy1234', last_name: 'Boba', email: 'BOBA@example.COM', password: 'nancy1234', password_confirmation: 'nancy1234')
      @user2 = User.new(first_name: 'nancy1234', last_name: 'Boba', email: 'boba@example.com', password: 'nancy1234', password_confirmation: 'nancy1234')
      expect(@user1.save && @user2.save).to eq false
    end

    it 'returns false when saving users without first name, last name, or email' do
      @user1 = User.new(first_name: nil, last_name: 'Boba', email: 'nancy1234@example.COM', password: 'nancy1234', password_confirmation: 'nancy1234')
      @user2 = User.new(first_name: 'Tom', last_name: nil, email: 'tom@example.com', password: 'nancy1234', password_confirmation: 'nancy1234')
      @user3 = User.new(first_name: 'Shmancy', last_name: 'Baboa', email: nil, password: 'nancy1234', password_confirmation: 'nancy1234')

      @user1.save
      expect(@user1.save && @user2.save && @user3.save).to eq false
    end

    it 'returns false when saving users with a password less than 7 characters' do
      @user = User.new(first_name: 'nancy1234', last_name: 'Shmancy', email: 'nancy1234@shmancy.com', password: 'nancy', password_confirmation: 'nancy')
      expect(@user.save).to eq false
    end
  end
end

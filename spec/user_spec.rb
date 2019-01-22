require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    # user = User.new(
    #     first_name: 'Nik',
    #     last_name: 'Smith',
    #     email: 'example@example.com',
    #     password: 'hello',
    #     password_confirmation: 'hello')

    it "is not valid without a first name" do
      user = User.new(
        first_name: nil,
        last_name: 'Smith',
        email: 'example@example.com',
        password: 'hellohello',
        password_confirmation: 'hellohello')
      expect(user).to_not be_valid
    end

    it "is not valid without a last name" do
      user = User.new(
        first_name: 'Nik',
        last_name: nil,
        email: 'example@example.com',
        password: 'hellohello',
        password_confirmation: 'hellohello')
      expect(user).to_not be_valid
    end

    it "is not valid without an email" do
      user = User.new(
        first_name: 'Nik',
        last_name: 'Smith',
        email: nil,
        password: 'hellohello',
        password_confirmation: 'hellohello')
      expect(user).to_not be_valid
    end

    it "email must be unique" do
      user1 = User.new(
        first_name: 'Nik',
        last_name: 'Smith',
        email: 'example@example.com',
        password: 'hellohello',
        password_confirmation: 'hellohello')
      user1.save

      user2 = User.new(
        first_name: 'Mike',
        last_name: 'Jordan',
        email: 'example@example.com',
        password: 'hihello',
        password_confirmation: 'hihello')
      user2.save
      expect(user2.errors.get(:email)).to eq(["has already been taken"])
    end

    it "password should be equal to password_confirmation" do
      user = User.new(
        first_name: 'Nik',
        last_name: 'Smith',
        email: 'example2@example.com',
        password: 'hellohello',
        password_confirmation: 'hellohello')
      expect(user).to be_valid
    end

  end


  describe '.authenticate_with_credentials' do
    it "successful login" do
      User.create!(
        first_name: 'Nik',
        last_name: 'Smith',
        email: 'example@example.com',
        password: 'hellohello',
        password_confirmation: 'hellohello')
      user = User.authenticate_with_credentials('example@example.com', 'hellohello')
      expect(user).to_not be_nil
    end
  end
end
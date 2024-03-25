require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do

    it 'validates that a newly created user can be saved' do
      user = User.create({
        first_name: "John",
        last_name: "Doe",
        email: "JohnDoe@test.com",
        password: "qwerty123",
        password_confirmation: "qwerty123"
      })
      expect(user.save).to eq(true)
    end

    it 'validates that a newly created password length is >= 5' do
      user = User.create({
        first_name: "John",
        last_name: "Doe",
        email: "JohnDoe@test.com",
        password: "1234",
        password_confirmation: "1234"
      })
      expect(user.save).to eq(false)
      expect(user.errors.full_messages).to include("Password is too short (minimum is 5 characters)")
    end
    
    it 'validates that a new user has a password/confirmation match' do
      user = User.create({
        first_name: "John",
        last_name: "Doe",
        email: "JohnDoe@test.com",
        password: "qwerty123",
        password_confirmation: "qwerty12345"
      })
      expect(user.save).to eq(false)
      expect(user.errors.full_messages).to include ("Password confirmation doesn't match Password")
    end
    
    it 'validates that a newly created user has a Unique email not in DB' do
      user = User.create({
        first_name: "John",
        last_name: "Doe",
        email: "JohnDoeCool@test.com",
        password: "qwerty123",
        password_confirmation: "qwerty123"
      })

      user2 = User.create({
        first_name: "Hulk",
        last_name: "Hogan",
        email: "JohnDoeCool@test.com",
        password: "qwerty123",
        password_confirmation: "qwerty123"
      })

      expect(user2.save).to eq(false)
      expect(user2.errors.full_messages).to include ("Email has already been taken")
    end
    
    it 'validates that a new user has a first and last name and email' do
      user = User.create({
        password: "qwerty123",
        password_confirmation: "qwerty123"
      })
      expect(user.save).to eq(false)
      expect(user.errors.full_messages).to include ("First name can't be blank")
      expect(user.errors.full_messages).to include ("Last name can't be blank")
      expect(user.errors.full_messages).to include ("Email can't be blank")
    end

  end

  describe '.authenticate_with_credentials' do

    it 'Confirms that character case is not relevant' do
      # create a user
      user = User.create({
        first_name: "John",
        last_name: "Doe",
        email: "normalEmail@test.com",
        password: "qwerty123",
        password_confirmation: "qwerty123"
      })

      # login/authenticate
      blunderedEmail = "normalemail@tEsT.CoM"
      authenticated_user = User.authenticate_with_credentials(blunderedEmail, user.password)

      expect(user.save).to eq(true)
      expect(authenticated_user).to eq(user)
    end

    it 'allows white spaces before/after in email input' do
      # create a user
      user = User.create({
        first_name: "John",
        last_name: "Doe",
        email: "coolguy@test.com",
        password: "qwerty123",
        password_confirmation: "qwerty123"
      })

      whiteSpaceEmail = "  coolguy@test.com  "

      # login/authenticate

      authenticated_user = User.authenticate_with_credentials(whiteSpaceEmail, user.password)

      expect(user.save).to eq(true)
      expect(authenticated_user).to eq(user)
    end

  end
  
end

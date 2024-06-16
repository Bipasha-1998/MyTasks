require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    let(:valid_attributes) do
      {
        name: 'John Doe',
        email: 'john@example.com',
        password: 'password'
      }
    end

    it 'is valid with valid attributes' do
      user = User.new(valid_attributes)
      expect(user).to be_valid
    end

    it 'is not valid without a name' do
      user = User.new(valid_attributes.merge(name: ''))
      expect(user).not_to be_valid
      expect(user.errors[:name]).to include("can't be blank")
    end

    it 'is not valid with a name less than 3 characters' do
      user = User.new(valid_attributes.merge(name: 'Jo'))
      expect(user).not_to be_valid
      expect(user.errors[:name]).to include("is too short (minimum is 3 characters)")
    end

    it 'is not valid with a name longer than 50 characters' do
      user = User.new(valid_attributes.merge(name: 'a' * 51))
      expect(user).not_to be_valid
      expect(user.errors[:name]).to include("is too long (maximum is 50 characters)")
    end

    it 'is not valid without an email' do
      user = User.new(valid_attributes.merge(email: ''))
      expect(user).not_to be_valid
      expect(user.errors[:email]).to include("can't be blank")
    end

    it 'is not valid with an invalid email format' do
      user = User.new(valid_attributes.merge(email: 'invalid_email'))
      expect(user).not_to be_valid
      expect(user.errors[:email]).to include("is invalid")
    end

    it 'is not valid with a duplicate email' do
      User.create(valid_attributes)
      user = User.new(valid_attributes)
      expect(user).not_to be_valid
      expect(user.errors[:email]).to include("has already been taken")
    end

    it 'is not valid with a password shorter than 6 characters' do
      user = User.new(valid_attributes.merge(password: 'short'))
      expect(user).not_to be_valid
      expect(user.errors[:password]).to include("is too short (minimum is 6 characters)")
    end
  end
end

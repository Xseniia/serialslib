require 'rails_helper'

RSpec.describe User, type: :model do
  before(:all) do
    @user1 = create(:user)
  end

  after(:all) do
    DatabaseCleaner.clean
  end

  # validations check

  describe 'validations' do
    context 'with valid attributes' do
      it 'creates user.' do
        expect(@user1).to be_valid
      end
    end

    context 'without valid attributes' do
      it 'does not create user. - invalid email' do
        user2 = build(:user, email: 'kindofemail')
        expect(user2).not_to be_valid
      end

      it 'does not create user. - no password.' do
        user2 = build(:user, password: nil)
        expect(user2).not_to be_valid
      end

      it 'does not create user. - no email.' do
        user2 = build(:user, email: nil)
        expect(user2).not_to be_valid
      end

      it 'does not create user. - incorrect date of birth.' do
        user2 = build(:user, date_of_birth: Date.today + 1.month)
        expect(user2).not_to be_valid
      end
    end

    it 'has a unique email.' do
      user2 = build(:user)
      expect(user2).not_to be_valid
    end

    it 'expects password to be 6 or more characters long.' do
      user2 = build(:user, email: 'anotheremail@gmail.com', password: '123456789')
      expect(user2).to be_valid
    end

    it 'expects password to be 6 or more characters long.' do
      user2 = build(:user, email: 'onemoreemail@gmail.com', password: '123')
      expect(user2).not_to be_valid
    end
  end
end

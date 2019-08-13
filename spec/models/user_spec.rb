require 'rails_helper'
require 'user.rb'

RSpec.describe User, type: :model do

  before(:all) do
    @user1 = create(:user)
  end

  after(:all) do
    DatabaseCleaner.clean
  end

  it 'creates user with valid email and password.' do
    expect(@user1).to be_valid
  end

  it 'creates user with valid email and password.' do
    user2 = build(:user, email: 'kindofemail')
    expect(user2).not_to be_valid
  end

  it 'has a unique email.' do
    user2 = build(:user)
    expect(user2).not_to be_valid
  end

  it 'is not valid without a password.' do
    user2 = build(:user, password: nil)
    expect(user2).not_to be_valid
  end

  it 'is not valid without an email.' do
    user2 = build(:user, email: nil)
    expect(user2).not_to be_valid
  end
end

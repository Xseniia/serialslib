require 'rails_helper'

RSpec.describe Serial, type: :model do
  before(:all) do
    @episode = create(:episode)
    @serial = @episode.season.serial
    @user = create(:user, email: 'qwerty@asdfg.com')
  end

  # validations check

  describe 'validations' do
    context 'with valid attributes' do
      it 'creates serial.' do
        expect(@serial).to be_valid
      end

      it 'creates serial. - with correct associations(serial-countries)' do
        country2 = create(:country, id: 2, country_name: 'Austria', shortcut: 'AT')
        country3 = create(:country, id: 3, country_name: 'Afghanistan', shortcut: 'AF')
        serial2 = build(:serial, country_id: 2)
        expect(serial2.country).to eq(country2)
        expect(serial2.country).not_to eq(country3)
      end
    end

    context 'with invalid attributes' do
      it 'does not create serial. - without serial title' do
        serial2 = build(:serial, title: nil)
        expect(serial2).not_to be_valid
      end

      it 'does not create serial. - with incorrect year of premiere' do
        serial2 = build(:serial, year_of_premiere: 3021)
        expect(serial2).not_to be_valid
      end

      it 'does not create serial. - with incorrect year of premiere' do
        serial2 = build(:serial, year_of_premiere: 1024)
        expect(serial2).not_to be_valid
      end

      it 'does not create serial. - without serial description' do
        serial2 = build(:serial, description: nil)
        expect(serial2).not_to be_valid
      end
    end
  end

  # ability to add comments check

  it 'creates comments on episodes.' do
    comment = @episode.comments.create(user_id: @user.id, content: 'nice one')
    expect(@episode.reload.comments).to eq([comment])
  end

  # ability to add comments on comments check

  it 'creates comments on comments.' do
    comment1 = @episode.comments.create(user_id: @user.id, content: 'first comment')
    comment2 = comment1.comments.create(user_id: @user.id, episode_id: comment1.episode_id, content: 'comment on comment')
    expect(comment1.reload.comments).to eq([comment2])
  end

  # check rating

  describe 'rating' do
    context 'with valid attributes' do
      it 'can be added to serial.' do
        rating = Rating.new(serial_id: @serial.id, user_id: @user.id, value: 3)
        expect(rating).to be_valid
      end
    end

    context 'with invalid attributes' do
      it ' to serial. - no value' do
        rating = Rating.new(serial_id: @serial.id, user_id: @user.id)
        expect(rating).not_to be_valid
      end

      it 'can not be added to serial. - no known serial id or user id' do
        rating = Rating.new(user_id: @user.id, value: 3)
        expect(rating).not_to be_valid

        rating = Rating.new(serial_id: @serial.id, value: 3)
        expect(rating).not_to be_valid
      end
    end
  end

  it 'can calculate average rating of serial.' do
    Rating.create(serial_id: @serial.id, user_id: @user.id, value: 3)
    Rating.create(serial_id: @serial.id, user_id: create(:user, email: '2@example.com').id, value: 4)
    Rating.create(serial_id: @serial.id, user_id: create(:user, email: '3@example.com').id, value: 5)
    Rating.create(serial_id: @serial.id, user_id: create(:user, email: '4@example.com').id, value: 3)

    rating_count = Rating.all.count
    expect(rating_count).to eq(4)

    average_rating = Rating.pluck(:value).inject(0.0) { |result, element| result + element } / rating_count
    expect(average_rating).to eq(3.75)
  end

   # check favourites

   it 'can add serial to favourites.' do
     @user.serials_fav << @serial
     expect(Favourite.where(serial_id: @serial.id, user_id: @user.id).length).to eq(1)
   end
end

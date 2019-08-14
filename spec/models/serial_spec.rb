require 'rails_helper'

RSpec.describe Serial, type: :model do
  before(:all) do
    @serial1 = create(:serial)
  end

  it 'creates serial with correct parameters.' do
    expect(@serial1).to be_valid
  end

  it 'does not create serial without serial title.' do
    serial2 = build(:serial, title: nil)
    expect(serial2).not_to be_valid
  end

  it 'does not create serial with incorrect year of premiere.' do
    serial2 = build(:serial, year_of_premiere: 3021)
    expect(serial2).not_to be_valid
  end

  it 'does not create serial with incorrect year of premiere.' do
    serial2 = build(:serial, year_of_premiere: 1024)
    expect(serial2).not_to be_valid
  end

  it 'does not create serial without serial description.' do
    serial2 = build(:serial, description: nil)
    expect(serial2).not_to be_valid
  end

  it 'creates serial with correct associations(with countries).' do
    country2 = create(:country, id: 2, country_name: 'Austria', shortcut: 'AT')
    country3 = create(:country, id: 3, country_name: 'Afghanistan', shortcut: 'AF')
    serial2 = build(:serial, country_id: 2)
    expect(serial2.country).to eq(country2)
    expect(serial2.country).not_to eq(country3)
  end
end

class Country < ApplicationRecord
  has_many :users
  has_many :serials
end

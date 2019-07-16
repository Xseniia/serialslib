class Serial < ApplicationRecord
  require 'date'

  has_many :seasons, dependent: :destroy

  has_many :favourites
  has_many :users, through: :favourites

  validates :title, presence: { message: 'must be filled.' }
  validates :year_of_premiere, length: { is: 4, message: 'can be only 4 digits long.' }, numericality: { only_integer: true, greater_than_or_equal_to: 1933, less_than_or_equal_to: Date.current.year }
  validates :description, presence: { message: 'must be added.' }
end

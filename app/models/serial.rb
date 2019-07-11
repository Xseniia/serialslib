class Serial < ApplicationRecord
  require 'date'
  DATE = Date.current.year

  validates :title, presence: { message: 'must be filled.' }
  validates :since, length: { is: 4, message: 'can be only 4 digits long.' }, numericality: { only_integer: true, greater_than_or_equal_to: 1933, less_than_or_equal_to: DATE }


end

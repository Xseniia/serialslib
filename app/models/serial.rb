# frozen_string_literal: true

class Serial < ApplicationRecord # :nodoc:
  require 'date'

  has_many :seasons, dependent: :destroy

  has_many :favourites
  has_many :users, through: :favourites

  belongs_to :country

  validates :title, presence: { message: 'must be filled.' }
  validates :year_of_premiere, length: { is: 4, message: 'can be only 4 digits long.' }, numericality: { only_integer: true, greater_than_or_equal_to: 1933, less_than_or_equal_to: Date.current.year }
  validates :description, presence: { message: 'must be added.' }

  scope :order_by_year, -> { order(year_of_premiere, asc) }
  scope :order_by_title, -> { order(title, asc) }
  scope :search_by_country, ->(id) { where country_id: id }
end

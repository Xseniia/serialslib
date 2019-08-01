# frozen_string_literal: true

class Serial < ApplicationRecord # :nodoc:
  require 'date'

  mount_uploader :image, SerialImageUploader

  has_many :seasons, dependent: :destroy
  has_many :episodes, through: :seasons

  has_many :favourites
  has_many :users, through: :favourites

  has_many :serial_genres
  has_many :genres, through: :serial_genres

  has_many :serial_actors
  has_many :actors, through: :serial_actors

  has_many :ratings
  has_many :users, through: :ratings

  belongs_to :country

  validates :title, presence: { message: 'must be filled.' }
  validates :year_of_premiere, length: { is: 4, message: 'can be only 4 digits long.' }, numericality: { only_integer: true, greater_than_or_equal_to: 1933, less_than_or_equal_to: Date.current.year }
  validates :description, presence: { message: 'must be added.' }

  scope :order_by_year, -> { order(year_of_premiere, asc) }
  scope :order_by_title, -> { order(title, asc) }
  scope :search_by_country, ->(id) { where country_id: id }

  def filled_stars
    grades = Rating.where(serial_id: id)
    sum = 0
    counter = 0
    grades.each do |mark|
      sum += mark.value
      counter += 1
    end

    counter.zero? ? 0 : sum / counter
  end

  def empty_stars
    5 - filled_stars
  end

  def current_user_stars(user)
    mark = Rating.where(serial_id: id, user_id: user.id)[0]
    mark.nil? ? 0 : mark.value
  end

  def current_user_empty_stars(user)
    5 - current_user_stars(user)
  end
end

# frozen_string_literal: true

require 'elasticsearch/model'

class Serial < ApplicationRecord # :nodoc:
  # requirements

  require 'date'

  # image uploader

  mount_uploader :image, SerialImageUploader

  # connecting elasticsearch

  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  # elasticsearch settings

  settings do
    mappings dynamic: false do
      indexes :title, type: :string, analyzer: :english
      indexes :description, type: :text, analyzer: :english
    end
  end

  index_name([Rails.env, base_class.to_s.pluralize.underscore].join('_'))

  # associations

  has_many :seasons, dependent: :destroy

  has_many :favourites
  has_many :users_fav, through: :favourites, source: :user

  has_many :ratings
  has_many :users_rating, through: :ratings, source: :user

  has_many :view_statuses
  has_many :users_status, through: :view_statuses, source: :user

  has_many :serial_genres
  has_many :genres, through: :serial_genres

  has_many :serial_actors
  has_many :actors, through: :serial_actors

  has_many :serial_tags
  has_many :tags, through: :serial_tags

  belongs_to :country

  # validations

  validates :title, presence: { message: 'must be filled.' }
  validates :year_of_premiere, length: { is: 4, message: 'can be only 4 digits long.' }, numericality: { only_integer: true, greater_than_or_equal_to: 1933, less_than_or_equal_to: Date.current.year }
  validates :description, presence: { message: 'must be added.' }

  # scopes

  scope :order_by_year, -> { order(year_of_premiere, asc) }
  scope :order_by_title, -> { order(title, asc) }
  scope :search_by_country, ->(id) { where country_id: id }

  # methods

  def filled_stars
    grades = Rating.where(serial_id: id).map(&:value)
    grades.empty? ? 0 : grades.inject(0) { |sum, grade| sum + grade } / grades.length
  end

  def empty_stars
    5 - filled_stars
  end

  def current_user_stars(user_id)
    mark = Rating.find_by(serial_id: id, user_id: user_id)
    mark.nil? ? 0 : mark.value
  end

  def current_user_empty_stars(user)
    5 - current_user_stars(user)
  end

  def self.tagged_with(name)
    Tag.find_by_tag_name(name).serials
  end

  def self.with_genre_filter(name)
    Genre.find_by_title(name).serials
  end

  # def is_favourite?(user)
  #   user.includes(:serials_fav).where(serial_id: id).present? true : false
  # end
end

# Serial.import

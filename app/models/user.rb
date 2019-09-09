# frozen_string_literal: true

class User < ApplicationRecord # :nodoc:
  acts_as_token_authenticatable

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  # connecting avatar uploader

  mount_uploader :avatar, AvatarUploader

  # associations declaration

  has_many :favourites
  has_many :serials_fav, through: :favourites, source: :serial, dependent: :destroy

  has_many :ratings
  has_many :serials_rating, through: :ratings, source: :serial, dependent: :destroy

  has_many :view_statuses
  has_many :serials_status, through: :view_statuses, source: :serial, dependent: :destroy

  has_many :comments
  has_many :episodes, through: :comments, dependent: :destroy

  belongs_to :countries, optional: true

  # devise settings

  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable, :omniauthable

  # requirements

  require 'date'

  # validations declaration

  validate :date_validation

  # validations functions

  def date_validation
    return unless date_of_birth && date_of_birth > Date.today

    errors.add(:date_of_birth, "Date of birth musn't be greater than the current date.")
  end

  # omniauth settings

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.first_name = auth.info.name
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = '123456'
    end
  end

  # scopes

  scope :admins, -> { where admin: true }

  scope :ordered_by_first_name, -> { order(first_name: :asc) }
  scope :ordered_by_last_name, -> { order(last_name: :asc) }

  # methods

  def user_serials(need)
    case need
    when 'will'
      Serial.joins(:view_statuses).where(view_statuses: { user_id: id, status: 'Will be watching' })
    when 'now'
      Serial.joins(:view_statuses).where(view_statuses: { user_id: id, status: 'Watching right now' })
    when 'done'
      Serial.joins(:view_statuses).where(view_statuses: { user_id: id, status: 'Finished watching' })
    else
      Serial.joins(:view_statuses).where(view_statuses: { user_id: id })
    end
  end
end

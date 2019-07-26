class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_many :favourites
  has_many :serials, through: :favourites

  has_many :comments
  has_many :episodes, through: :comments

  belongs_to :countries, :optional => true

  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable, :omniauthable
  require 'date'

  validates :gender, acceptance: { accept: ['Male', 'Female'], case_sensitive: false, message: "can only be 'Male' or 'Female'."  }
  validate :date_validation

  def date_validation
    if date_of_birth && date_of_birth > Date.today
      errors.add(:date_of_birth, "Date of birth musn't be greater than the current date.")
    end
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end

  scope :is_admin, -> { where admin: true }
  scope :is_user, -> { where admin: false }

  scope :ordered_by_first_name, -> { order(first_name: :asc) }
  scope :ordered_by_last_name, -> { order(last_name: :asc) }

end

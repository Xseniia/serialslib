class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_many :favourites
  has_many :serials, through: :favourites

  has_many :comments
  has_many :episodes, through: :comments

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  require 'date'

  validates :gender, acceptance: { accept: ['Male', 'Female', 'male', 'female'], case_sensitive: false, message: "can only be 'Male' or 'Female'."  }
  validate :date_validation

  def date_validation
    if date_of_birth > Date.today
      errors.add(:date_of_birth, "Date of birth musn't be greater than the current date.")
    end
  end
end

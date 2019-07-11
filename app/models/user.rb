class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
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

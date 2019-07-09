class User < ApplicationRecord
  validates :first_name, presence: { message: ' must be filled.' }
  validates :last_name, presence: { message: ' must be filled.' }
  validates :gender, acceptance: { accept: ['Male', 'Female', 'male', 'female'], case_sensitive: false, message: "can only be 'Male' or 'Female'."  }
end

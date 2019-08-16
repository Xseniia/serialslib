class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :serial

  validates :value, presence: { message: 'must be filled.' }
end

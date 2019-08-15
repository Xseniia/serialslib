class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :serial

  validates :value, presence: { message: 'must be filled.' }
  validate :unique

  def unique
    return unless Rating.where(user_id: user_id, serial_id: serial_id, value: value).any?

    errors.add(:serial_id, 'Serial is already in your favourites list.')
  end
end

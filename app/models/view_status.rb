class ViewStatus < ApplicationRecord
  belongs_to :user
  belongs_to :serial

  validate :unique

  def unique
    return unless ViewStatus.where(user_id: user_id, serial_id: serial_id).any?

    errors.add(:serial_id, 'Serial is already in your favourites list.')
  end
end

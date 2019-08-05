class SerialTag < ApplicationRecord
  belongs_to :serial
  belongs_to :tag

  validate :unique_pair

  def unique_pair
    return unless SerialTag.where(serial_id: serial_id, tag_id: tag_id).any?

    errors.add(:serial_id, 'You have already added this tag to this serial.')
  end
end

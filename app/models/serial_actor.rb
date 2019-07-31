# frozen_string_literal: true

class SerialActor < ApplicationRecord
  belongs_to :serial
  belongs_to :actor

  validate :unique_pair

  def unique_pair
    return unless SerialActor.where(serial_id: serial_id, actor_id: actor_id).any?

    errors.add(:serial_id, 'You have already added this ganre to this serial.')
  end
end

# frozen_string_literal: true

class SerialGenre < ApplicationRecord
  belongs_to :serial
  belongs_to :genre

  validate :unique_pair

  def unique_pair
    return unless SerialGenre.where(genre_id: genre_id, serial_id: serial_id).any?

    errors.add(:serial_id, 'You have already added this ganre to this serial.')
  end
end

# frozen_string_literal: true

class Favourite < ApplicationRecord # :nodoc:
  belongs_to :serial
  belongs_to :user

  validate :unique_pair

  def unique_pair
    return unless Favourite.where(user_id: user_id, serial_id: serial_id) != []

    errors.add(:serial_id, 'Serial is already in your favourites list.')
  end
end

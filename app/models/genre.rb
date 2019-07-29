# frozen_string_literal: true

class Genre < ApplicationRecord
  has_many :serial_genres
  has_many :serials, through: :serial_genres
end

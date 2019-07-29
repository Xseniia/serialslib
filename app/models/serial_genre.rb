# frozen_string_literal: true

class SerialGenre < ApplicationRecord
  belongs_to :serial
  belongs_to :genre
end

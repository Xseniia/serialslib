class Actor < ApplicationRecord
  has_many :serial_actors
  has_many :serials, through: :serial_actors
end

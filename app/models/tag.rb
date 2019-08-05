class Tag < ApplicationRecord
  has_many :serial_tags
  has_many :serials, through: :serial_tags
end

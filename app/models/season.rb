# frozen_string_literal: true

class Season < ApplicationRecord # :nodoc:
  belongs_to :serial
  has_many :episodes, dependent: :destroy

  scope :full, -> { where is_full: true }
  scope :ordered_by_count, -> { order(id: :asc) }

  def season_number
    num = id.to_s.remove(serial_id.to_s)
    num.empty? ? serial_id : num
  end
end

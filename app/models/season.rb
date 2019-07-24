class Season < ApplicationRecord
  belongs_to :serial
  has_many :episodes, dependent: :destroy

  scope :full, -> { where is_full: true }
  scope :ordered_by_count, -> { order(season_count: :asc) }
end

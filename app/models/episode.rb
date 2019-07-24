class Episode < ApplicationRecord
  belongs_to :season

  has_many :comments
  has_many :users, through: :comments

  scope :ordered_by_count, -> { order(count: :asc) }
end

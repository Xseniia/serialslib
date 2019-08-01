# frozen_string_literal: true

class Episode < ApplicationRecord # :nodoc:
  belongs_to :season
  belongs_to :serial

  has_many :comments
  has_many :users, through: :comments

  scope :ordered_by_count, -> { order(count: :asc) }
end

# frozen_string_literal: true

class Episode < ApplicationRecord # :nodoc:
  belongs_to :season

  has_many :comments
  has_many :users, through: :comments

  def episode_number
    num = id.to_s.remove(season_id.to_s)
    num.empty? ? season_id : num
  end
end

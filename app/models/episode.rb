class Episode < ApplicationRecord
  belongs_to :season

  has_many :comments
  has_many :users, through: :comments
end

# frozen_string_literal: true

class Comment < ApplicationRecord # :nodoc:
  belongs_to :user
  belongs_to :episode
  has_many :comments

  validates :content, presence: { message: "musn't be empty." }
end

# frozen_string_literal: true

class Comment < ApplicationRecord # :nodoc:
  belongs_to :user
  belongs_to :episode

  validates :content, presence: { message: "musn't be empty." }
end

# frozen_string_literal: true

class Comment < ApplicationRecord # :nodoc:
  belongs_to :user
  belongs_to :episode
  has_many :comments

  validates :content, presence: { message: "musn't be empty." }

  scope :episode_comments_list, ->(episode_id, comment_id) { where episode_id: episode_id, comment_id: comment_id }
end

# frozen_string_literal: true

json.partial! 'episodes/episode', episode: @episode
json.partial! 'episodes/comments/comment', comment: @comment

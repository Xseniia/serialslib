# frozen_string_literal: true

json.extract! comment, :user_id, :episode_id, :content, :comment_id, :created_at
json.url comment_url(comment, format: :json)

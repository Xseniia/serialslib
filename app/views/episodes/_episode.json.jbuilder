# frozen_string_literal: true

json.extract! episode, :id, :season_id, :count, :title, :likes, :dislikes
json.url episode_url(episode, format: :json)

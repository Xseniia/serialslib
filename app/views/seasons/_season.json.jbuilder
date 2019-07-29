# frozen_string_literal: true

json.extract! season, :id, :serial_id, :isfull
json.url season_url(season, format: :json)

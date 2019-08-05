# frozen_string_literal: true

json.extract! serial, :id, :title, :year_of_premiere, :description, :country_id
json.url serial_url(serial, format: :json)

json.extract! tag, :id, :tag_name
json.url tag_url(tag, format: :json)

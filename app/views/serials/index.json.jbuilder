# frozen_string_literal: true

json.array! @serials, partial: 'serials/serial', as: :serial
json.array! @tags, partial: 'serials/serial', as: :tags

# frozen_string_literal: true

json.extract! user, :id, :first_name, :last_name, :gender, :date_of_birth, :country_id, :email, :created_at, :updated_at, :avatar
json.url user_url(user, format: :json)

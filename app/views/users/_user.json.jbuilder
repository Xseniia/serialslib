json.extract! user, :id, :first_name, :last_name, :gender, :date_of_birth,, :country_id :email, :created_at, :updated_at
json.url user_url(user, format: :json)

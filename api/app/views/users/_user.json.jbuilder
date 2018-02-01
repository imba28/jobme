json.extract! user, :id, :name, :created_at, :updated_at, :email
json.url user_url(user, format: :json)
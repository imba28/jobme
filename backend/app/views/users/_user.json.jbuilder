json.extract! user, :id, :name, :avatar_url, :email, :created_at, :updated_at
if user.avatar_url.url
  json.avatar_url asset_url(user.avatar_url.to_s)
else
  json.icon nil
end
json.url user_url(user, format: :json)

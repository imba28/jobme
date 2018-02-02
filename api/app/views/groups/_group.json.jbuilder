json.extract! group, :id, :name, :created_at, :updated_at
json.admin do
    json.partial!  'users/user', user: group.admin
end
json.url group_url(group, format: :json)
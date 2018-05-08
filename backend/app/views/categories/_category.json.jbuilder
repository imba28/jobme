json.extract! category, :id, :name, :created_at, :updated_at
if category.icon.url
  json.icon asset_url(category.icon.to_s)
else
  json.icon nil
end
json.url category_url(category, format: :json)

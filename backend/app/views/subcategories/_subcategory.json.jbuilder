json.extract! subcategory, :id, :name, :icon, :created_at, :updated_at
if subcategory.icon.url
    json.icon asset_url(subcategory.icon.to_s)
else 
    json.icon nil
end

if subcategory.category
    json.category do |cat|
        cat.id subcategory.category.id
        cat.url category_url(subcategory.category, format: :json)
    end
else
    json.category = nil
end

json.url subcategory_url(subcategory, format: :json)

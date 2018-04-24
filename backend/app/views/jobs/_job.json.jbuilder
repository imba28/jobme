json.extract! job, :id, :name, :image_preview, :description, :created_at, :updated_at
if job.image.url
    json.image asset_url(job.image.to_s)
else 
    json.image nil
end

json.url job_url(job, format: :json)

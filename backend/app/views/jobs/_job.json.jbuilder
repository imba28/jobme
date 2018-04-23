json.extract! job, :id, :name, :gif_url, :description, :created_at, :updated_at
json.url job_url(job, format: :json)

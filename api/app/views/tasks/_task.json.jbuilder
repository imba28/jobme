json.extract! task, :id, :name, :description, :group_id, :user_id, :due_date, :created_at, :updated_at
json.url task_url(task, format: :json)

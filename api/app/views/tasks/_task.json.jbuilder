json.extract! task, :id, :name, :description, :group_id, :user_id, :done, :due_date, :share, :created_at, :updated_at, :user
json.url task_url(task, format: :json)
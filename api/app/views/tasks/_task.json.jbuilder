json.extract! task, :id, :name, :description, :group_id, :done, :due_date, :share, :created_at, :updated_at, :creator

json.user do
    json.partial!  'users/user', user: task.user
end
if json.creator then
    json.user do
        json.partial!  'users/user', user: task.creator
    end
end
json.url task_url(task, format: :json)
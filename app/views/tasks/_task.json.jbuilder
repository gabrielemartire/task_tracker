json.extract! task, :id, :title, :status, :due_date, :priority, :project_id, :created_at, :updated_at
json.url task_url(task, format: :json)

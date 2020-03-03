json.extract! todolist, :id, :item, :duedate, :created_at, :updated_at
json.url todolist_url(todolist, format: :json)

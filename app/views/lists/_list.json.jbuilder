json.extract! list, :id, :title, :body, :publish, :created_at, :updated_at
json.url list_url(list, format: :json)
json.body list.body.to_s

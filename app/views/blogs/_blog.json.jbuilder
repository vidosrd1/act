json.extract! blog, :id, :title, :body, :publish, :created_at, :updated_at
json.url blog_url(blog, format: :json)
json.body blog.body.to_s

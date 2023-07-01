json.extract! blog_post, :id, :title, :body, :publish, :created_at, :updated_at
json.url blog_post_url(blog_post, format: :json)
json.body blog_post.body.to_s

user = User.where(email: "vidosrd@gmail.com").first_or_initialize
user.update!(
  password: "Kriger1977",
  password_confirmation: "Kriger1977"
)

#100.times do |i|
12.times do |i|
  #Article.create title: "Article #{i}", body: "Hello world"
  #BlogPost.create title: "Blog #{i}",
  Blog.create title: "Webpack #{i}",
  body: "Hello world",
  publish: Time.current,
  category_id: 4
end

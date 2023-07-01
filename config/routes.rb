Rails.application.routes.draw do
  resources :tags
  #get '/articles', to: 'Articles#showall'
  resources :articles
  resources :arts
  resources :lists
  resources :categories
  resources :blogs
  #root "blog_posts#index"
  devise_for :users
  resources :blog_posts
  get 'home/index'
  # root "articles#index"
  root "home#index"
end

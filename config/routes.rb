Rails.application.routes.draw do

  root "posts#index"

  # get "/posts/new" => "posts#new"
  # post "/posts/new" => "posts#create", as: :posts

  # get "/posts/:id" => "posts#show", as: :post
  # patch "/posts/:id" => "posts#update"
  # delete "/posts/:id" => "posts#destroy"

  # get "/posts/edit/:id" => "posts#edit" , as: :edit_post

  resources :posts do
    resources :comments
  end

end

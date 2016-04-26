Rails.application.routes.draw do
  root to: "posts#index"

  resources :posts
  resources :comments

  get "/signup" => "users#new"
  post "/users" => "users#create"

  get  "/signin" => "sessions#new"
  post "/signin" => "sessions#create"
  get  "/signout" => "sessions#destroy"
  
end

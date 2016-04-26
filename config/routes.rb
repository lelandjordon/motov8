Rails.application.routes.draw do
  root to: "posts#index"

  resources :posts
  resources :comments

  get "/signup" => "authors#new"
  post "/authors" => "authors#create"

  get  "/signin" => "sessions#new"
  post "/signin" => "sessions#create"
  get  "/signout" => "sessions#destroy"

end

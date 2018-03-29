Rails.application.routes.draw do
  root to: "application#index"

  get "/signin" => "sessions#new", as: "new_session"
  post "/signin" => "sessions#create"
  get "/signout" => "sessions#destroy", as: "logout"
  
  resources :users
  resources :attractions
  resources :rides
end
Rails.application.routes.draw do
  resources :recipes

  get "/me", to: "users#show"
  post "/signup", to: "users#create"

  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  #recipes route
 get "/recipes", to: "recipes#index"
 post "/recipes", to: "recipes#create"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

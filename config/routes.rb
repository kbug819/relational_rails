Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "/", to: "welcome#index"
  get "/disaster_shelters", to: "disaster_shelters#index"
  get "/disaster_shelters/:id", to: "disaster_shelters#show"
  get "/residents", to: "residents#index"
end

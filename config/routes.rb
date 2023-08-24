Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "/", to: "welcome#index"
  get "/shelters", to: "shelters#index"
  get "/shelters/:id", to: "shelters#show"
  get "/residents", to: "residents#index"
  get "/residents/:id", to: "residents#show"
  get "/shelters/:id/residents", to: "shelters#resident_view"
end

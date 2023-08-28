Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "/", to: "welcome#index"
  get "/shelters", to: "shelters#index"
  get "/shelters/new", to: "shelters#new"
  post "/shelters", to: "shelters#create"
  get "/shelters/:id", to: "shelters#show"
  get "/shelters/:id/edit", to: "shelters#edit"
  patch "/shelters/:id", to: 'shelters#update'
  delete "/shelters/:id", to: 'shelters#destroy'
  
  get "/shelters/:id/residents", to: "shelter_residents#index"
  get "/shelters/:id/residents/new", to: "shelter_residents#new"
  post "/shelters/:id/new", to: "shelter_residents#create"

  get "/residents", to: "residents#index"
  get "/residents/:id", to: "residents#show"
  get "/residents/:id/edit", to: "residents#edit"
  patch "residents/:id/", to: 'residents#update'
  delete "/residents/:id", to: 'residents#destroy'
end

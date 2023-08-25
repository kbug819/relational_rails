Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "/", to: "welcome#index"
  get "/shelters", to: "shelters#index"
  get "/shelters/new", to: "shelters#new"
  get "/shelters/:id", to: "shelters#show"
  get "/residents", to: "residents#index"
  get "/residents/:id", to: "residents#show"
  get "/shelters/:id/residents", to: "shelter_residents#index"
  # get "/shelters/:id/residents", to: "shelters#resident_view"
  post "/shelters", to: "shelters#create"
  get "/shelters/:id/edit", to: "shelters#edit"
  patch "/shelters/:id", to: 'shelters#update'
  get "/shelters/:id/residents/new", to: "shelter_residents#new"
  post "/shelters/:id/new", to: "shelter_residents#create"
  get "/residents/:id/edit", to: "residents#edit"
  patch "residents/:id/", to: 'residents#update'
  get "/shelters/:id/residents/sorted_a", to: "shelter_residents#sorted_a"
  delete "/shelters/:id", to: 'shelters#destroy'
  delete "/residents/:id", to: 'residents#destroy'
  post "/shelters/:id/residents/by_family_view", to: 'shelter_residents#by_family_view'
end

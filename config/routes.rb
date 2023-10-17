Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/", to: "welcome#index"
  get "/movies", to: "movies#index"
  get "/movies/new", to: "movies#new"
  post "/movies", to: "movies#create" 
  get "/movies/:id", to: "movies#show"
  get "/movies/:id/edit", to: "movies#edit"
  patch '/movies/:id', to: 'movies#update'
  delete '/movies/:id', to: 'movies#destroy'

  get "/", to: "welcome#index"
  get "/blockbusters", to: "blockbusters#index"
  get "/blockbusters/new", to: "blockbusters#new"
  post "/blockbusters", to: "blockbusters#create" 
  get "/blockbusters/:id", to: "blockbusters#show"
  get "/blockbusters/:id/edit", to: "blockbusters#edit"
  patch '/blockbusters/:id', to: 'blockbusters#update'
  delete '/blockbusters/:id', to: 'blockbusters#destroy'

  get "/blockbusters/:id/movies", to: 'movies#index', as: :blockbuster_movies
end

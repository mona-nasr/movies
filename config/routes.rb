Rails.application.routes.draw do
  get 'actors/index'
  get 'movies/index'

  resources :movies
  resources :actors
  
  get "search", :to => "actors#search_actor"
end

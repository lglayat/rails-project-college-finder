Rails.application.routes.draw do
  resources :college_programs
  resources :programs
  resources :user_colleges
  resources :reviews
  resources :users
  resources :colleges
  # resources :sessions, only: [:delete]


  root to: 'home#index'
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/name_search', to: 'search#name_search'
  get '/user_search', to: 'search#user_search'
  get 'add_to_watchlist', to: 'users#add_to_watchlist'
  post 'add_to_watchlist', to: 'users#add_to_watchlist'
  delete '/delete_watchlist', to: 'users#delete_watchlist'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

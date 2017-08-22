Rails.application.routes.draw do
  resources :college_programs
  resources :programs
  resources :user_colleges
  resources :reviews
  resources :users
  resources :colleges

  root to: 'home#index'
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
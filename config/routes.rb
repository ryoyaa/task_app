Rails.application.routes.draw do
  get '/favorites', to: 'favorites#index'
  post '/favorites', to: 'favorites#create'

  devise_for :users
  resources :topics
  root 'topics#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end

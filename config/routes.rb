Rails.application.routes.draw do
  resources :consoles, only: [:index, :show]
  resources :games, only: [:index, :show, :new, :create]
  resources :genres, only: [:index]
  resources :user_games
  resources :users


  root 'application#hello'
   get '/login' => 'sessions#new'
   post '/login' => 'sessions#create'
   post '/logout' => 'sessions#destroy'

  resources :users, only: [:index, :show, :new, :create]
  resources :wishlist_games

  get 'users/:id/wishlist' => 'users#wishlist', as: :wishlist

  post '/games/:id/add_to_wishlist' => 'games#add_to_wishlist', as: :add_to_wishlist
  post '/games/:id/rate' => 'games#rate', as: :rate
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

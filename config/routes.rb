Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static#home'

  resources :users do
    resources :trips, only: [:show, :new, :edit]
  end

  resources :trips

  resources :countries

  get '/users/most_trips_taken' => 'users#most_trips_taken'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/auth/facebook/callback' => 'sessions#create'

end

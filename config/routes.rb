Rails.application.routes.draw do
  root  'sessions#home'
  get '/auth/:provider/callback', to: "sessions#fbcreate"
  get '/login',  to: 'sessions#new_seller'
  get '/login',  to: 'sessions#new_buyer'
  post '/login', to: 'sessions#create_seller'
  post '/login', to: 'sessions#create_buyer'
  delete '/logout' => 'sessions#destroy'
  get '/signup_buyers', to: 'buyers#new'
  get '/signup_sellers', to:  'sellers#new'
  get '/new_house', to: 'houses#new'
  resources :buyers
  resources :sellers  do
    resources :houses, only: [:show, :index, :new]
  end 
    resources :houses
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

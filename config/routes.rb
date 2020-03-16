Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/payment' => 'pages#payment'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :listings, except: [:destroy] do
    resources :bookings, only: [:create, :update]
  end
  resources :bookings, only: [:index, :show, :destroy] do
    resources :chatrooms, only: [:show, :create] # nested chatrooms inside bookings so a booking has a chat
  end
  resources :chatrooms, only: [:show] do
    resources :messages , only: :create
  end
  resources :reviews
  delete "bookings/:id", to: "bookings#destroy", as: :delete_booking
  delete "listings/:id", to: "listings#destroy", as: :delete
  get "dashboard", to: "users#dashboard", as: :dashboard # custom route - we have to create a users controller as well
  
end

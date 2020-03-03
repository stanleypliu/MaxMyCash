Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :listings, except: [:destroy] do
    resources :bookings, only: [:create]
  end
  resources :bookings, only: [:index, :show, :destroy]
  resources :reviews
  delete "listings/:id", to: "listings#destroy", as: :delete
  get "dashboard", to: "users#dashboard", as: :dashboard # custom route - we have to create a users controller as well
end

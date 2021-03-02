Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get "my_bookings", to: "sessions#my_bookings"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :sessions, only: [:index] do
    resources :bookings, only: [:create]
  end

  resources :bookings, only: [:destroy]

  get :my_bookings, to: "bookings#my_bookings"
  get :thank_you, to: "pages#thank_you"


end

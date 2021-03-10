Rails.application.routes.draw do
  resources :rooms
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  put "/sessions_update/:id", to: "sessions#update", as: :session_update
  delete "/sessions_delete/:id", to: "sessions#destroy", as: :session_delete

  devise_for :users, :controllers => { :registrations => :registrations }

  root to: 'pages#home'
  get "my_bookings", to: "sessions#my_bookings"
  get :thank_you, to: "pages#thank_you"
  get :my_profile, to: "pages#my_profile"

  resources :sessions, only: [:index, :edit] do
    # resources :bookings, only: [:create]
    resources :reviews, only: [:new, :create]
  end

  resources :bookings, only: [:destroy]
  patch "bookings/:id/missed", to: "bookings#missed", as: :missed

  resources :activities do
    resources :sessions, only: [:new, :create]
  end

  resources :users, only: [:show]

  resources :orders, only: [:show, :create]

  get '/create_booking' =>'bookings#create', :as => :booking_create

  get '/checkout' =>'orders#checkout', :as => :checkout

end

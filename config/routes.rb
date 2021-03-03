Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  devise_for :users
  root to: 'pages#home'
  get "my_bookings", to: "sessions#my_bookings"
  get :thank_you, to: "pages#thank_you"

  

  resources :sessions, only: [:index] do
    resources :bookings, only: [:create]
  end

  resources :bookings, only: [:destroy]

  resources :activities do
    resources :sessions, only: [:new, :create]
  end


  

  resources :activities, only: [:index]

end

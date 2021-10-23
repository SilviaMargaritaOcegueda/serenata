Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'pages#home'
  devise_for :users
  # resources :users
  resources :bookings, only: %i[create index]
  resources :services do
    collection do
      get :genre
    end
    resources :bookings, only: [:new]
  end
end

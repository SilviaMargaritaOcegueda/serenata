Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'pages#home'
  devise_for :users
  resources :users do
    resources :services, only: %i[new create edit update]
  end

  resources :services, only: %i[index show delete]
end

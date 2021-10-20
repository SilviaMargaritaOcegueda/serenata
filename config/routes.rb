Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'pages#home'
  devise_for :users
    resources :services, except: %i[index show delete]

  resources :services, only: %i[index show delete]
end

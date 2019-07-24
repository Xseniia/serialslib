Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users, controllers: { confirmations: 'confirmations' }
  resources :users

  resources :serials do
    resources :seasons
    resources :favourites, except: [:index]
    resources :serial_countries
  end

  resources :seasons, only: [:show] do
    resources :episodes
  end

  resources :episodes, only: [:show] do
    resources :comments
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

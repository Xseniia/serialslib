# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'serials#index'
  devise_for :users, controllers: { confirmations: 'confirmations', omniauth_callbacks: 'omniauth_callbacks' }
  resources :users

  resources :serials do
    resources :seasons
    resources :favourites, except: [:index]
    resources :serial_countries
    resources :serial_genres
  end

  resources :serials do
    member do
      patch :add_genre
      delete :delete_genre
    end
  end

  resources :seasons, only: [:show] do
    resources :episodes
  end

  resources :episodes, only: [:show] do
    resources :comments
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

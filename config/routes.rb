# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'serials#index'

  devise_for :users, controllers: { confirmations: 'confirmations', omniauth_callbacks: 'omniauth_callbacks' }
  resources :users do
    resources :ratings
    resources :view_statuses
  end

  resources :serials do
    resources :seasons
    resources :favourites, except: [:index]
    resources :serial_countries

    member do
      patch :add_genre
      delete :delete_genre

      patch :add_actor
      delete :delete_actor

      patch :add_tag

      patch :add_view_status
      patch :update_view_status
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

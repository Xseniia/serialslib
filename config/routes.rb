# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'pages#index'

  get 'serials', to: 'serials#index'
  get 'tags', to: 'tags#index'
  get 'genres', to: 'genres#index'
  
  match '*path', to: 'pages#index', via: :all

  

  get '/users/:user_id/ratings(.:format)', to: 'ratings#create'
  get 'tags/:tag', to: 'serials#index', as: 'tag'
  get 'genres/:genre', to: 'serials#index', as: 'genre'

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
      delete :delete_tag

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

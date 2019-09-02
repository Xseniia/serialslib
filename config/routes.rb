# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'pages#index'

  get 'serials', to: 'serials#index'
  get 'tags', to: 'tags#index'
  get 'genres', to: 'genres#index'
  get 'actors', to: 'actors#index'
  get 'serials/:id', to: 'serials#show'
  get 'seasons', to: 'seasons#get_serial_seasons'
  get 'season/:id', to: 'seasons#index'

  post 'serials/:id/add_genre', to: 'genres#add_genre'
  post 'serials/:id/add_tag', to: 'tags#add_tag'
  post 'serials/:id/add_actor', to: 'actors#add_actor'

  delete 'serials/:id/delete_genre', to: 'genres#delete_genre'
  delete 'serials/:id/delete_tag', to: 'tags#delete_tag'
  delete 'serials/:id/delete_actor', to: 'actors#delete_actor'

  namespace :user do
    resources :sessions, only: %i[index create]
    delete 'session', to: 'sessions#destroy'
  end

  # devise_for :users, controllers: { confirmations: 'confirmations', omniauth_callbacks: 'omniauth_callbacks' }

  match '*path', to: 'pages#index', via: :all


  get '/users/:user_id/ratings(.:format)', to: 'ratings#create'
  get 'tags/:tag', to: 'serials#index', as: 'tag'
  get 'genres/:genre', to: 'serials#index', as: 'genre'

  resources :users do
    resources :ratings
    resources :view_statuses
  end

  resources :seasons, only: [:show] do
    resources :episodes
  end

  resources :episodes, only: [:show] do
    resources :comments
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

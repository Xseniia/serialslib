# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'pages#index'

  namespace :user do
    resources :sessions, only: %i[index create]
    delete 'session', to: 'sessions#destroy'

    get 'all', to: 'users#index'
    get ':id', to: 'users#show'
    get ':id/serials_by_status', to: 'users#fetch_user_serials'
    patch 'edit', to: 'users#update'
    delete ':id/delete', to: 'users#destroy'
  end

  get 'serials', to: 'serials#index'

  get 'tags', to: 'tags#index'
  get 'genres', to: 'genres#index'
  get 'actors', to: 'actors#index'
  get 'countries', to: 'countries#index'
  get 'serials/:id', to: 'serials#show'
  get 'seasons', to: 'seasons#get_serial_seasons'
  get 'season/:id', to: 'seasons#index'
  get 'episode/:id', to: 'episodes#index'
  get 'episode/:id/comments', to: 'episodes#episode_comments'

  post 'serials/:id/add_genre', to: 'genres#add_genre'
  post 'serials/:id/add_tag', to: 'tags#add_tag'
  post 'serials/:id/add_actor', to: 'actors#add_actor'
  post 'serials/:id/change_rate', to: 'ratings#create'
  post 'serials/:id/add_to_favourite', to: 'favourites#create'
  post 'serials/:id/remove_from_favourite', to: 'favourites#destroy'
  post 'serials/:id/update_view_status', to: 'serials#add_view_status'
  post 'episode/:id/create_comment', to: 'comments#create'

  delete 'serials/:id/delete_genre', to: 'genres#delete_genre'
  delete 'serials/:id/delete_tag', to: 'tags#delete_tag'
  delete 'serials/:id/delete_actor', to: 'actors#delete_actor'


  devise_for :users,
    controllers: {
      registrations: 'user/registrations',
      passwords: 'user/passwords'
    },
    path_names: {
      registration: 'new'
    }

  match '*path', to: 'pages#index', via: :all
end

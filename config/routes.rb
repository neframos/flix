# frozen_string_literal: true

Rails.application.routes.draw do
  resources :genres
  resources :users
  root 'movies#index'

  resources :movies do
    resources :reviews
    resources :favorites, only: [:create, :destroy]
  end
  resource :session, only: %i[new create destroy]
  get 'signup' => 'users#new'
  get 'signin' => 'sessions#new'
  get 'movies/filter/:filter' => 'movies#index'
  get 'movies/filter/:filter' => 'movies#index', as: :filtered_movies
end

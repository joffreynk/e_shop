# frozen_string_literal: true

Rails.application.routes.draw do
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    confirmations: 'users/confirmations'
  }

  get "categories/new", to: "categories#new"
  post "categories/create", to: "categories#create"
  get "/", to: 'categories#index'
  get "categories/:id/shopinglists", to: "shoping_lists#index"
  get "/categories/:id/shoping_lists/new", to: "shoping_lists#new"
  post "/categories/:id/shoping_lists/create", to: "shoping_lists#create"

  # root to: 'categories#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

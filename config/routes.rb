Rails.application.routes.draw do
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  root to: "users#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

end

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resource :session, only: %i[new create destroy]
  resources :users, only: %i[show new create]
  resources :bands
end

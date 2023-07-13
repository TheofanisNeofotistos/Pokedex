Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api, defaults: { format: :json } do
    get '/pokemon/types', :to => 'pokemon#types'
    resources :items, only: [:update, :destroy]
    resources :pokemon, only: [:show, :update, :create, :index] do
      resources :items, only: [:index, :create]
      # resources :types #:only => [:types]
    end
    
  end
  resolve("types") {[:types]}
end

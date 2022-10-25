Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: "lists#index"
  # Defines the root path route ("/")
  # root "articles#index"
  resources :lists, only: [:create, :index, :show, :new] do
    resources :bookmarks, only: [:new, :create]
  end
  resources :bookmarks, only: [:destroy]
end

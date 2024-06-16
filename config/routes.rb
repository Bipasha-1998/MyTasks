Rails.application.routes.draw do
  root to: "home#index"
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"

  resources :users, only: [:new, :create]
  resources :tasks do
    member do
      patch :update_status
    end

    collection do
      get :completed
    end
  end
end

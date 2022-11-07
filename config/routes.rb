Rails.application.routes.draw do
  root 'static_pages#index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/rides", to: "static_pages#index"
  get "/rides/new", to: "rides#new"
  get "/rides/:id", to: "static_pages#index"
  get "/rides/:id", to: "static_pages#index"
  post "rides/search", to: "rides#search"

    namespace :api do
      namespace :v1 do
        resources :rides, only: [:index, :show] do
          resources :reviews, only: [:create]
      end
    end
    resources :rides, only: [:new, :create]
  end
end
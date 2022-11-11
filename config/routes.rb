Rails.application.routes.draw do
  root 'main#index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/rides", to: "static_pages#index"
  get "/rides/new", to: "static_pages#authorized"
  get "/rides/:id", to: "static_pages#index"
  
  namespace :api do
    namespace :v1 do
      resources :rides, only: [:index, :show, :create] do
        resources :reviews, only: [:create]
      end
      post "/rides/search", to: "rides#search"
    end
  end
end

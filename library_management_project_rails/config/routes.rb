Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  resources :home
  resources :dashboard
  resources :books
  resources :rak
  resources :section
  resources :user
  resources :book_transactions

  namespace :backend do
    resources :membership, only: [:new, :create, :index], format: :xlsx
    resources :rak, only: [:index]
  end
end

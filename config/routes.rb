Rails.application.routes.draw do
  resources :customers, only: [ :index ]
  devise_for :users
  root 'dashboard#index'
end

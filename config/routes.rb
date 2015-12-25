Rails.application.routes.draw do
  resources :collections, only: [:index, :create]
  root to: 'welcom#index'
end

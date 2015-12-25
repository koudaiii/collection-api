Rails.application.routes.draw do
  resources :collections, only: [:create]
  root to: 'welcom#index'
end

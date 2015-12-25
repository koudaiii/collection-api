Rails.application.routes.draw do
  resources :collections
  root to: 'welcom#index'
end

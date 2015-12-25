Rails.application.routes.draw do
  root to: 'welcom#index'
  resources :users
end

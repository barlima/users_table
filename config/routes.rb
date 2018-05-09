Rails.application.routes.draw do
  root to: 'users#index'
  resources :users

  mount ActionCable.server => '/cable'
end

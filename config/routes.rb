Rails.application.routes.draw do
  root 'public#index'

  resources :messages, only: [:index, :create]
end

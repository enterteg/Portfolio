Rails.application.routes.draw do
  root 'public#index'

  post 'messages' => 'public#create'
  resources :public, only: [:create]
end

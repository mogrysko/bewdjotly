Rails.application.routes.draw do
  root to: 'session#show'
  post '/' => 'session#create'
  delete '/session' => 'session#destroy'
  resources :users, only: [:new, :create, :show, :edit, :update]
  resources :jots
end

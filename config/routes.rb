Rails.application.routes.draw do
  root to: 'session#show'
  post '/' => 'session#create'
  delete '/session' => 'session#destroy'
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :jots do
    member do
      post :like
      post :unlike
    end
  end
  resources :relationships, only: [:create, :destroy]
  get '/feed' => 'users#yourfeed'
  get '/location' => 'jots#location'
end

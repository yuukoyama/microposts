Rails.application.routes.draw do

  root to: 'static_pages#home'
  get 'signup',  to: 'users#new'
  get    'login' , to: 'sessions#new'
  post   'login' , to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :microposts
  resources :relationships, only: [:create, :destroy]
  resources :users do
    member do
      get :followings, :followers
    end
  end
end
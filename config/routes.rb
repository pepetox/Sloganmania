Rails.application.routes.draw do
  post 'users/follow'
  resources :relationships,  only: [:create, :destroy]
  resources :sloganers, param: :username,  only: [:show, :index] do
    member do
      get :following, :followers
      resources :messages
    end
  end
  devise_for :users
  get 'welcome/index'
  root 'welcome#index'

end

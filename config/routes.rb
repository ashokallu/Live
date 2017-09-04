Rails.application.routes.draw do
  root 'polls#index'

  resources :users
  resources :sessions, :only => [:new, :create, :destroy]

  resources :polls do
    resources :options
  end

  resources :options do
    resources :votes
  end

  resources :votes

  get 'data', to: 'votes#data', :defaults => { :format => 'json' }
  
  get 'signup', to: 'users#new', as: 'signup'

  get 'login', to: 'sessions#new', as: 'login'

  get 'logout', to: 'sessions#destroy', as: 'logout'

end

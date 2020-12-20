Rails.application.routes.draw do
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  resources :users, only: [:show, :new, :create, :edit, :update] do
    member do
      get :participatings
      get :participateds
    end
  end  
  resources :team_informations, only: [:new, :create, :destroy, :edit, :update] 
  
  get 'team_informations/:id', to: 'team_informations#is_finished'
  post 'team_informations/:id', to: 'team_informations#is_finished'
  patch 'team_informations/:id', to: 'team_informations#is_finished'
  put 'team_informations/:id', to: 'team_informations#is_finished'
  
  resources :rooms, only: [:show, :create, :destroy]
  
  resources :messages, only: [:index, :create]
end

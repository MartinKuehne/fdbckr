Rails.application.routes.draw do
  devise_for :users
  root to: 'artworks#index'
  get '/profile', to: 'pages#profile'
  get '/share', to: 'pages#share'
  get '/brandguidelines', to: 'pages#brandguidelines'
  get '/landing', to: 'pages#landing'
  get '/users/:id/friends', to: 'users#friends', as: 'friends'
  patch 'friendships/:id/accept', to: 'friendships#accept', as: 'accept_friendship'
  patch 'friendships/:id/decline', to: 'friendships#decline', as: 'decline_friendship'
  resources :users, only: :show do
    resources :friendships, only: :create
  end
  resources :artworks, only: [:index, :new, :create, :show] do
    resources :comments, only: [:create]
  end

  # Please do NOT delete (it will break the home page)
  post '/banana', to: 'comments#create_index', as: :create_comments_index
  # ⚠️⚠️⚠️

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

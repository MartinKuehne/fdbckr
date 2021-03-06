Rails.application.routes.draw do
  devise_for :users
  match "/404", to: "errors#not_found", via: :all
  match "/500", to: "errors#internal_server_error", via: :all
  root to: 'artworks#index'
  get '/profile', to: 'pages#profile'
  get '/share/:artwork_id', to: 'pages#share', as: 'share'
  post '/mail_request/:artwork_id', to: 'mail_requests#invite_externals', as: 'invite_externals'
  get '/brandguidelines', to: 'pages#brandguidelines'
  get '/landing', to: 'pages#landing'
  get '/users/:id/friends', to: 'users#friends', as: 'friends'
  get '/discover', to: 'artworks#discover'
  get '/artists', to: 'users#index'
  get '/support', to: 'pages#support'
  post '/artworks/:artwork_id/comments/feed', to: 'comments#create_index', as: 'create_comments_index'
  patch 'friendships/:id/accept', to: 'friendships#accept', as: 'accept_friendship'
  patch 'friendships/:id/decline', to: 'friendships#decline', as: 'decline_friendship'
  resources :users, only: :show do
    resources :friendships, only: :create
  end
  resources :artworks, only: [:index, :new, :create, :show] do
    resources :comments, only: [:create]
  end

  get 'card/:id', to: 'comments#card', as: :card

  # Please do NOT delete (it will break the home page)
  # post '/banana', to: 'comments#create_index', as: :create_comments_index
  # ⚠️⚠️⚠️

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

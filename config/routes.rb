Rails.application.routes.draw do
  devise_for :users
  root to: 'artworks#index'
  get '/profile', to: 'pages#profile'
  get '/share', to: 'pages#share'
  get '/brandguidelines', to: 'pages#brandguidelines'
  get '/landing', to: 'pages#landing'
  post '/artworks/:artwork_id/comments', to: 'comments#create_index', as: 'create_comments_index'
  resources :users, only: :show
  resources :artworks, only: [:index, :new, :create, :show] do
    resources :comments, only: [:create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/profile', to: 'pages#profile'
  get '/brandguidelines', to: 'pages#brandguidelines'
  resources :artworks, only: [:index, :new, :show] do 
    resources :comments, only: [:create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

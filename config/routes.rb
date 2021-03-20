Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :listings, except: [:show] do
  end
  resources :auctions do
    resources :listings, only: [:show]
    resources :biddings, only: [:new, :create]
  end
  resources :biddings, only: [:index, :show]
  get '/offers', to: 'pages#offers'
end

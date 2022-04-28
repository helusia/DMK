Rails.application.routes.draw do
  get 'relationships/followings'
  get 'relationships/followers'
  devise_for :users
  root to: 'homes#top'
  get 'about' => 'homes#about'
  get "search" => "searches#search"
  resources :users do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'

    member do
      get :favorites
      get :followings
      get :followers
    end
  end
  resources :posts do
     resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end

   namespace :admin do
    resources :users
  end

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end



Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get 'about' => 'homes#about'
  get "search" => "searches#search"
  resources :users do
    member do
      get :favorites
    end
  end
  resources :posts do
     resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end

   namespace :admin do
    resources :users
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end



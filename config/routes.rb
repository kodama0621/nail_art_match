Rails.application.routes.draw do
  get 'search' => 'post_images#search'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'homes#top'
  get 'about/' => 'homes#about'

  resources :post_images, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
    resource :likes, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
    resources :favorites, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :update, :destroy] do
    member do
      get :favorite
    end
  end

end

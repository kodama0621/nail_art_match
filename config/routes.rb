Rails.application.routes.draw do
  get '/search' => 'search#search'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'homes#top'
  get '/about' => 'homes#about'

  resources :post_images, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
    resource :likes, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
    resources :favorites, only: [:create, :destroy]
    collection do
      get 'search'
    end
  end
  resources :users, only: [:show, :edit, :update, :destroy] do
    member do
      get :favorite
    end
  end

end

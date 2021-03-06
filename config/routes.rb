Rails.application.routes.draw do
  get '/search' => 'search#search'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }

  root 'homes#top'
  get '/about' => 'homes#about'
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

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

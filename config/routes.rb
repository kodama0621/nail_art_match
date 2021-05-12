Rails.application.routes.draw do
  root 'homes#top'
  get 'about/' => 'homes#about'
  devise_for :users
  resources :post_images, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
    resource :likes, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :update]

end

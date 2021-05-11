Rails.application.routes.draw do
  root 'homes#top'
  get 'about/' => 'homes#about'
  devise_for :users
  resources :post_images, only: [:new, :create, :index, :show, :destroy]
end

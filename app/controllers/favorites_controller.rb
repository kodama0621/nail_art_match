class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    @post_image = PostImage.find(params[:post_image_id])
    favorite = @post_image.favorites.new(user_id: current_user.id)
    if favorite.save
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end

  def destroy
    @post_image = PostImage.find(params[:post_image_id])
    favorite = @post_image.favorites.find_by(user_id: current_user.id)
    if favorite.present?
        favorite.destroy
        redirect_to request.referer
    else
        redirect_to request.referer
    end
  end
end
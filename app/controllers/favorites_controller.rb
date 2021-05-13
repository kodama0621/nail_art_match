class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    @favorite = current_user.favorites.build(favorite_params)
    @post_image = @favorite.post_image
    if @favorite.valid?
      @favorite.save
      redirect_to post_image_path(@post_image)
    end
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    @favorite = @favorite.post_image
    if @favorite.destroy
      redirect_to post_image_path(@post_image)
    end
  end

  private
  def favorite_params
    params.permit(:post_image_id)
  end
end


class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @post_images = @user.post_images.page(params[:page]).reverse_order
    favorites = Favorite.where(user_id: current_user.id).pluck(:post_image_id)
    @favorite_list = PostImage.find(favorites)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = 'ユーザーを削除しました。'
    redirect_to :root
  end

  def favorite
    @user = User.find(params[:id])
    favorites = Favorite.where(user_id: current_user.id).pluck(:post_image_id)
    @favorites = PostImage.find(favorites)
  end


  private
  def user_params
    params.require(:user).permit(:name, :profile_image)
  end

end

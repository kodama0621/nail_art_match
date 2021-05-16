class UsersController < ApplicationController

  before_action :ensure_current_user, {only: [:edit, :update, :destroy, :favorite]}

  def ensure_current_user
    if current_user.id != params[:id].to_i
      redirect_to user_path(current_user)
    end
  end

  def show
    @user = User.find(params[:id])
    @post_images = @user.post_images.page(params[:page]).reverse_order
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id)
      flash[:notice] = "保存できました。"
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "ユーザーを削除しました。"
    redirect_to :root
  end

  def favorite
    @user = User.find(params[:id])
    favorites = Favorite.where(user_id: current_user.id).pluck(:post_image_id)
    @favorites = PostImage.find(favorites)
  end


  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :profile_body)
  end

end

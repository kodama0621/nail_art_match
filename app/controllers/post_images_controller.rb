class PostImagesController < ApplicationController
  def new
    @post_image = PostImage.new
  end

  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id
    @post_image.save
    redirect_to post_images_path
  end

  def index
    @post_images = PostImage.all
  end

  def show
    @post_image = PostImage.find(prams[:id])
  end

  def destroy
  end

  private
  def post_image_params
    params.require(:post_image).permit(:title, :image, :caption)
  end


end

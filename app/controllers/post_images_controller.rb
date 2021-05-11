class PostImagesController < ApplicationController
  def new
    @post_image = ImagePost.new
  end

  def create
    @postimage = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id
    @post_image.save
    redirect_to post_images_path
  end

  def index
    @post_images = PostImage.all
  end

  def show
  end

  def destroy
  end

  private
  def post_image_params
    params.require(:post_image).permit(:title, :image, :caption)
  end


end

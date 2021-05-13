class PostImagesController < ApplicationController

  before_action :ensure_current_user, {only: [:edit, :update]}
  def ensure_current_user
    @post_image = PostImage.find(params[:id])
    if current_user.id != @post_image.user_id
      redirect_to post_images_path
    end
  end


  def new
    @post_image = PostImage.new
  end

  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id
    if @post_image.save
      redirect_to post_images_path
    else
      render :new
    end
  end

  def index
    @post_images = PostImage.page(params[:page]).reverse_order
  end

  def show
    @post_image = PostImage.find(params[:id])
    @post_comment = PostComment.new
  end

  def edit
    @post_image = PostImage.find(params[:id])
  end

  def update
    @post_image = PostImage.find(params[:id])
    if @post_image.update(post_image_params)
      redirect_to post_image_path(@post_image.id)
      flash[:notice] = "保存成功しました"
    else
      render :edit
    end
  end

  def destroy
    @post_image = PostImage.find(params[:id])
    @post_image.destroy
    redirect_to post_images_path
  end

  def search
    @post_images = PostImage.search(params[:keyword])
    @keyword = params[:keyword]
    render :index
  end


  private
  def post_image_params
    params.require(:post_image).permit(:title, :image, :caption)
  end


end

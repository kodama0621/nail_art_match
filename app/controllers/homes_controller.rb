class HomesController < ApplicationController
  def top
    post_images = PostImage.includes(:liked_users).sort {|a,b| b.liked_users.size <=> a.liked_users.size}
    @post_images = Kaminari.paginate_array(post_images).page(params[:page]).per(5)
  end

  def about
  end

end

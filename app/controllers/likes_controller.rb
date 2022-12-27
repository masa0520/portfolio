class LikesController < ApplicationController
  def create
    @liked_posts = current_user.likes.create(post_id: params[:post_id])
    @liked_posts.save
    redirect_back fallback_location: posts_path
  end

  def destroy
    @liked_posts = Like.find_by(user_id: current_user.id, post_id: params[:post_id])
    @liked_posts.destroy!
    redirect_back fallback_location: posts_path
  end
end

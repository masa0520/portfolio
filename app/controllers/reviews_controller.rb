class ReviewsController < ApplicationController
  def create
    @review = current_user.reviews.build(comment_params)
    @review.save
  end

  def destroy
    @review = current_user.reviews.find(params[:id])
    @review.destroy!
  end

  def private
    params.require(:review).permit(:comment).merge(post_id: params[:post_id])
  end
end

class ReviewsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @review = Review.new
  end

  def create
    @review = current_user.reviews.build(review_params)
    if @review.save
      redirect_to post_url(@review.post_id), success: "レビューをしました"
    else
      flash.now[:danger] = 'レビューに失敗しました'
      render :new
    end
  end

  def destroy
    @review = current_user.reviews.find(params[:id])
    @review.destroy!
    redirect_to post_path(@review.post_id)
  end

  private
  def review_params
    params.require(:review).permit(:comment).merge(post_id: params[:post_id])
  end
end

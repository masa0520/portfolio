class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to post_url(@post), success: "Post was successfully created."
    else
      flash.now[:danger] = '店名を入力してください'
      render :new
    end
  end

  def update
  end

  def destroy
    @post.destroy
    redirect_to posts_url, success: "Post was successfully destroyed."
  end

  private

    def set_post
      @post = Post.find(params[:id])
    end


    def post_params
      params.require(:post).permit(:title, :body, :address, :lat, :lng)
    end
end

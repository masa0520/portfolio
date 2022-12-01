class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]

  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to login_path, success: 'User was successfully created.'
    else
      flash.now[:danger] = 'User creation failed.'
      render :new
    end


  # PATCH/PUT /users/1 or /users/1.json
  def update
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy
    redirect_to root_path, success: 'User was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:nickname, :email, :password, :password_confirmation)
    end
end

class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @user.update(user_params)
    redirect_to edit_user_registration_path(@user)
  end

  def destroy
    @user.destroy
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:full_name, :image)
  end

  def set_user
    @user = User.find(params[:id])
  end
end

class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.save
    redirect_to new_user_registration_path
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
    params.require(:user).permit(:full_name)
  end

  def set_user
    @ser = User.find(params[:id])
  end
end

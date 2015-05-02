class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @jots = @user.jots.order(updated_at: :desc)
  end
  def new
    @user = User.new
  end
  def create
    @user = User.create(user_params)
    if @user.save
      redirect_to root_path
    else
      render 'new'
    end
  end
  def edit
    @user = User.find(params[:id])
  end
  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path(user)
  end
  private
  def user_params
    params.require(:user).permit(:photo, :email)
  end
end

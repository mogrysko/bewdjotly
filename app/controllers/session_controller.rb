class SessionController < ApplicationController
  def index; end
  def show
    @users = User.all
  end
  def create
    @users = User.all
    user = User.find_by(email: params[:email])
    if user
      login user
      redirect_to jots_path
    else
      render 'show'
      flash[:alert]="You must enter a registered email address."
    end
  end
  def destroy
    @_current_user = session[:user_id] = nil
    redirect_to root_path
  end
end

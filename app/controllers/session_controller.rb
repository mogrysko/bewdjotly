class SessionController < ApplicationController
  def show
    @users = User.all
  end
  def create
    user = User.find_by(email: params[:email])
    if user
      login user
      redirect_to jots_path
    else
      render 'show'
      flash[:alert]="You must enter a registered email address."
    end
  end
  def jot_author(jot)
    if jot.user_id == current_user.try(:id)
      'You'
    else
      jot.user.try(:email)
    end
  end
  def jot_author?(jot)
    jot.user_id == current_user.try(:id)
  end
end

class JotsController < ApplicationController
  def index
    @jots = Jot.all.order(updated_at: :desc)
  end
  def location
    if params[:search].present?
      @jots = Jot.near(params[:search], 5)
    else
      @jots = Jot.all.order(updated_at: :desc)
    end
  end
  def new
    @jot = Jot.new
  end
  def create
    jot = Jot.create(jot_params)
    redirect_to jots_path
  end
  def edit
    @jot = Jot.find(params[:id])
  end
  def update
    jot = Jot.find(params[:id])
    jot.update(jot_params)
    redirect_to jots_path
  end
  def destroy
    jot = Jot.find(params[:id])
    jot.destroy
    redirect_to jots_path
  end
  def like
    jot = Jot.find(params[:id])
    jot.likes.create!(user_id: current_user.id)
    redirect_to jots_path
  end
  def unlike
    jot = Jot.find(params[:id])
    jot.likes.where(user_id: current_user.id).delete_all
    redirect_to jots_path
  end
  private
  def jot_params
    params.require(:jot).permit(:photo, :content, :latitude, :longitude).merge(user_id: session[:user_id])
  end
  def has_not_liked?(jot)
    jot.likes.where(user_id: current_user.id).empty?
  end
  helper_method :has_not_liked?
end

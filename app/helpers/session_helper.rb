module SessionHelper
  def login(user)
    session[:user_id] = user.id
    session[:email] = user.email
    session[:username] = user.username
  end
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  def current_user?(user)
    user == current_user
  end
  def jot_author(jot)
    if jot.user_id == current_user.try(:id)
      'You'
    else
      jot.user.try(:username)
    end
  end
  def jot_author?(jot)
    jot.user_id == current_user.try(:id)
  end
end

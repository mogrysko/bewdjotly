module SessionHelper
  def login(user)
    session[:user_id] = user.id
    session[:email] = user.email
  end
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
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

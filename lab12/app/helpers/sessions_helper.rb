module SessionsHelper

  def log_in(user)
    session[:user_login] = user.login
  end
end
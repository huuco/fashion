module SessionsHelper
  def login user
    session[:user_id] = user.id
  end

  def remember user
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  def current_user
    @current_user ||= User.find_by id: session[:user_id]
  end

  def logged_in?
    current_user.present?
  end

  def log_out
    session.delete :user_id
    cookies.delete :remember_token
    @current_user = nil
  end

  def forget user
    user.forget
    cookies.delete :user_id
    cookies.delete :remember_token
  end

  def store_location
    session[:forwarding_url] = request.original_url if request.get?
  end

  def redirect_forwarding_url url
    redirect_to session[:forwarding_url] || url
    session.delete :forwarding_url
  end
end

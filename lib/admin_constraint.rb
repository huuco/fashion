class AdminConstraint
  # include ActionController::Redirecting
  def matches?(request)
    return false unless request.session[:user_id]
    user = User.find_by id: request.session[:user_id]
    user && user.admin?
  end
end

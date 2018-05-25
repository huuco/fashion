class SessionsController < ApplicationController
  def new
    redirect_to admin_url if current_user.present? && current_user.admin?
  end

  def create
    user = User.find_by email: params[:session][:email].downcase

    if user && user.authenticate(params[:session][:password]) && user.admin?
      login user
      params[:session][:remember_me] == "1" ? remember(user) : forget(user)
      redirect_to admin_url
    else
      flash.now[:error] = t ".error_login"
      render :new
    end
  end

  def destroy
    log_out
    flash[:success] = t ".logout"
    redirect_to login_path
  end
end

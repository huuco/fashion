class SessionsController < ApplicationController
  def new
    if logged_in?
      flash[:warning] = t ".logined"
      redirect_user
    end
  end

  def create
    user = User.find_by email: params[:session][:email].downcase

    if user && user.authenticate(params[:session][:password])
      login user
      params[:session][:remember_me] == "1" ? remember(user) : forget(user)
      redirect_user
    else
      flash.now[:danger] = t ".error_login"
      render :new
    end
  end

  def destroy
    log_out
    flash[:success] = t ".logout"
    redirect_to login_path
  end

  private

  def redirect_user
    if current_user.admin?
      redirect_to admin_url
    else
      redirect_to root_url
    end
  end
end

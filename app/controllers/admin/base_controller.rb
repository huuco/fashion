class Admin::BaseController < ApplicationController
  layout "admin"
  before_action :check_admin

  def check_admin
    if logged_in?
      unless current_user.admin?
        flash[:warning] = t ".warning"
        redirect_to root_path
      end
    else
      flash[:warning] = t ".need_login"
      redirect_to root_path
    end
  end
end

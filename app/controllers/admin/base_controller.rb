class Admin::BaseController < ApplicationController
  layout "admin"
  before_action :check_admin

  def index
    @chart_data = Order.total_by_day (Date.today - 10).to_s, Date.today.to_s
    if params[:datechart]
      @chart_data = Order.total_by_day base_params[:from_date], base_params[:to_date]
    end
  end

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

  private

  def base_params
    params.require(:datechart).permit :from_date, :to_date
  end
end

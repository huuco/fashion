class Admin::UsersController < Admin::BaseController
  def index
    @users = User.page(params[:page]).per(Setttings.user.limit_page)
  end
end

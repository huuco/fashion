class Admin::RatesController < Admin::BaseController
  before_action :load_rate, only: %i(update destroy)

  def index
    @rates = Rate.page(params[:page]).per Settings.limit_page
  end

  def update
    @rate.update_attributes active: Settings.rate_active
    respond_to do |format|
      format.js
    end
  end

  def destroy
    if @rate.destroy
      flash[:success] = t ".delete_success"
    else
      flash[:warning] = t ".delete_error"
    end
    redirect_to admin_rates_path
  end

  private

  def load_rate
    @rate = Rate.find_by id: params[:id]
    return if @rate
    flash[:warning] = t ".not_found"
    redirect_to admin_rates_path
  end
end

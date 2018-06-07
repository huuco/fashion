class RatesController < ApplicationController
  before_action :logged_in?, only: :create
  before_action :load_product, only: :create

  def create
    @rate = current_user.rates.build rate_params.merge({product: @product})
    if @rate.save
      flash[:success] = t ".comment_success"
      redirect_to product_path(@product)
    else
      respond_to do |format|
        format.js
      end
    end
  end

  private

  def load_product
    @product = Product.find_by id: params[:product_id]
    return if @product
    flash[:warning] = t "search.product_not_found"
    redirect_to root_url
  end

  def rate_params
    params.require(:rate).permit :star, :content
  end
end

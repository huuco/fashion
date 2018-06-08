class BrandsController < ApplicationController
  before_action :load_brand, only: :show

  def index
    @brands = Brand.order_brand.page(params[:page]).per Settings.record_per_page
  end

  def show
    @products = @brand.products.order_by_name.page(params[:page])
      .per Settings.record_per_page
  end

  private

  def load_brand
    @brand = Brand.find_by id: params[:id]
    return if @brand
    flash[:warning] = t ".not_found"
    redirect_to root_path
  end
end

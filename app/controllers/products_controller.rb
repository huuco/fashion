class ProductsController < ApplicationController
  before_action :load_product, only: %i(show)

  def index
    @new_product = Product.get_new_products
  end

  def show; end

  private

  def load_product
    @product = Product.find_by id: params[:id]
    return if @product
    flash[:warning] = t "search.product_not_found"
    redirect_to root_url
  end
end

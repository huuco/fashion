class ProductsController < ApplicationController
  before_action :load_product, only: %i(show)

  def index
    @new_product = Product.order_by_created_at
  end

  def show
    @related_product = Product.related_product @product.id
    @new_product = Product.order_by_created_at
    @best_selling = OrderDetail.best_selling.map &:product
    @rates = Rate.get_rate_actived_by_product_id @product.id
  end

  private

  def load_product
    @product = Product.find_by id: params[:id]
    return if @product
    flash[:warning] = t "search.product_not_found"
    redirect_to root_url
  end
end

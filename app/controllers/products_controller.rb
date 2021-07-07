class ProductsController < ApplicationController
  before_action :load_product, only: :show
  before_action :load_new_products, only: %i(index show new_products)
  before_action :load_hot_products, only: %i(show hot)

  def index
    @slides = Slide.all
  end

  def show
    @related_product = Product.related_product @product.id
    @rates = Rate.get_rate_actived_by_product_id @product.id
    @comments = @product.comments.show_review.page(params[:page]).
      per Settings.record_per_page
    respond_to do |format|
      format.js
      format.html
    end
    @comment = Comment.new
  end

  def new_products; end

  def hot; end

  private

  def load_new_products
    @new_product = Product.order_by_created_at.page(params[:page])
      .per Settings.record_per_page
  end

  def load_hot_products
    @best_selling = Product.best_selling.page(params[:page])
      .per Settings.record_per_page
  end

  def load_product
    @product = Product.find_by id: params[:id]
    return if @product
    flash[:warning] = t "search.product_not_found"
    redirect_to root_url
  end
end

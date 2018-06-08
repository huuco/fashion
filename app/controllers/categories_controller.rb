class CategoriesController < ApplicationController
  before_action :load_category, only: :show

  def index
    @categories = Category.order_name.page(params[:page])
      .per Settings.record_per_page
  end

  def show
    @products = @category.products.order_by_name.page(params[:page])
      .per Settings.record_per_page
  end

  private

  def load_category
    @category = Category.find_by id: params[:id]
    return if @category
    flash[:warning] = t ".not_found"
    redirect_to root_path
  end
end

class Admin::CategoriesController < Admin::BaseController
  before_action :load_category, only: %i(edit update destroy active)

  def index
    @categories = Category.order_name
                          .search_admin_c(params[:search])
                          .page(params[:page])
                          .per Settings.limit_page
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new category_params

    if @category.save
      flash[:success] = t ".create_succeed"
      redirect_to admin_categories_path
    else
      flash[:danger] = t ".create_failed"
      render :new
    end
  end

  def edit; end

  def update
    if @category.update_attributes category_params
      flash[:success] = t ".update_succeed"
      redirect_to admin_categories_path
    else
      flash[:danger] = t ".update_failed"
      render :edit
    end
  end

  def destroy
    if @category.products.empty? && @category.destroy
      flash[:success] = t ".delete_succeed"
    else
      flash[:danger] = t ".delete_failed_have_product"
    end
    redirect_to admin_categories_path
  end

  def active
    @category.update_attributes active: params[:active]
    respond_to do |format|
      format.json
    end
  end

  private

  def category_params
    params.require(:category).permit Category::PARAMS_LIST
  end

  def load_category
    @category = Category.find_by id: params[:id]
    return if @category
    flash[:danger] = t ".not_found_category"
    redirect_to admin_categories_path
  end
end

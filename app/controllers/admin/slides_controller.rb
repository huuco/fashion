class Admin::SlidesController < Admin::BaseController
  before_action :load_slide, only: %i(edit update destroy)

  def index
    @slides = Slide.order_title.page(params[:page]).per Settings.limit_page
  end

  def new
    @slide = Slide.new
  end

  def create
    @slide = Slide.new slide_params
    if @slide.save
      flash[:success] = t ".create_succeed"
      redirect_to admin_slides_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @slide.update_attributes slide_params
      flash[:success] = t ".update_succeed"
      redirect_to admin_slides_path
    else
      render :edit
    end
  end


  def destroy
    if @slide.destroy
      flash[:success] = t ".delete_success"
    else
      flash[:danger] = t ".delete_failed"
    end
    redirect_to admin_slides_path
  end

  private

  def slide_params
    params.require(:slide).permit :title, :image, :link
  end

  def load_slide
    @slide = Slide.find_by id: params[:id]
    return if @slide
    flash[:danger] = ".not_found_slide"
    redirect_to admin_slides_path
  end
end

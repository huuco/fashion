class CommentsController < ApplicationController
  before_action :load_product

  def create
    if logged_in?
      @comment = current_user.comments.build comment_params.merge({product: @product})
    else
      @comment = @product.comments.build comment_params
    end
    if @comment.save
      respond_to do |format|
        format.js
      end
    else
      respond_to do |format|
        format.js {render "error.js.erb"}
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit :author, :content, :email
  end

  def load_product
    @product = Product.find_by id: params[:product_id]
    return if @product
    flash[:warning] = t "search.product_not_found"
    redirect_to root_url
  end
end

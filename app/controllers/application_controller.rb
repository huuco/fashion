class ApplicationController < ActionController::Base
  include SessionsHelper
  include ApplicationHelper
  before_action :session_cart

  def session_cart
    @cart = session[:cart] || {}
    @products_cart = @cart.map {|id, quantity| [Product.find_by(id: id),
      quantity]}
    @count_product_cart = 0
    @cart.each {|id, quantity| @count_product_cart += quantity}
    @total = total_cart @products_cart
  end

  def total_cart products
    @total = 0
    products.each do |product, quantity|
      @total += product.promotion_price * quantity
    end
    @total
  end
end

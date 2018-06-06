json.cart do
  json.product_id(@product.id)
  json.count_product_cart t("header.item", item: @count_product_cart)
  json.quantity t("item_cart.x", quantity: @quantity)
  json.product_subtotal(currency @product.price * @quantity)
  json.total(currency @total)
  json.update_success t(".update_success")
  json.toastr_timeout Settings.toastr_timeout
end

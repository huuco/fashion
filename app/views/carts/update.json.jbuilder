json.cart do
  json.product_id(@product.id)
  json.count_product_cart t("header.item", item: @count_product_cart)
  json.qty t("item_cart.x", qty: @qty)
  json.product_subtotal(number_to_currency(@product.promotion_price*@qty,
    unit: t("currency"), separator: ","))
  json.total(number_to_currency(@total, unit: t("currency"), separator: ","))
  json.update_success t(".update_success")
  json.toastr_timeout Settings.toastr_timeout
end

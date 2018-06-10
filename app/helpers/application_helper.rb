module ApplicationHelper
  def index_for_list object, counter
    ((object.current_page - 1)  * object.limit_value) + counter + 1
  end

  def currency price
    number_to_currency(price, unit: t("currency"), separator: ",")
  end
end

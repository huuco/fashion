class Category < ApplicationRecord
  has_many :products
  validates :name, presence: true
  PARAMS_LIST = %i(name description parent_id active)
  scope :order_name, ->{order name: :asc}
  scope :list, ->(category_id_current){where "id != ?", category_id_current}
  scope :search_admin, (lambda do |search|
    where "name LIKE :q OR parent_id LIKE :q", q: "%#{search}%"
  end)
end

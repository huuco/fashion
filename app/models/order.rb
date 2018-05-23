class Order < ApplicationRecord
  has_many :order_details
  belongs_to :address
  belongs_to :shipping
  belongs_to :payment
end

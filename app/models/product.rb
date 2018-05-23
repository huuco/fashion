class Product < ApplicationRecord
  has_many :rates
  has_many :order_details
  has_many :comments
  has_many :wishlists
  has_many :images
  belongs_to :brand
  belongs_to :category
end

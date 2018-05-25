class Product < ApplicationRecord
  has_many :rates
  has_many :order_details
  has_many :comments
  has_many :wishlists
  has_many :images
  belongs_to :brand
  belongs_to :category

  def self.get_new_products
    Product.limit(Settings.products.record_per_page).order "created_at DESC"
  end

  def self.search(search)
    where("name LIKE ?", "%#{search}%" )
  end
end

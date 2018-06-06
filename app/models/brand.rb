class Brand < ApplicationRecord
  has_many :products
  validates :name, presence: true
  scope :order_brand, -> {select(:id, :name, :description).order(name: :asc)}
  scope :search_brand, -> search_name do
    where("brands.name LIKE ?", "%#{search_name}%")
  end
end

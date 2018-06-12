class Product < ApplicationRecord
  has_many :rates
  has_many :order_details
  has_many :comments
  has_many :wishlists
  has_many :images

  belongs_to :brand
  belongs_to :category

  validates :name, presence: true
  validates :old_price, presence: true,
    numericality: {greater_than_or_equal_to: Settings.product.conditional_min}
  validates :discount, presence: true,
    inclusion: Settings.product.conditional_min..Settings.product.conditional_max
  validates :price, presence: true,
    numericality: {greater_than_or_equal_to: Settings.product.conditional_min}
  validates :quantity, presence: true,
    numericality: {greater_than_or_equal_to: Settings.product.conditional_min}

  delegate :name, to: :category, prefix: true, allow_nil: true
  delegate :name, to: :brand, prefix: true
  accepts_nested_attributes_for :images, allow_destroy: true

  ATTR_PARAMS = [:name, :price, :old_price, :discount, :quantity,
    :short_description, :long_description, :tag, :ref, :brand_id, :category_id,
    :active, images_attributes: %i(id image image_cache _destroy)].freeze

  scope :order_by_name, ->{order name: :asc}
  scope :search_admin,(lambda do |search|
    where "name LIKE :q OR price LIKE :q OR quantity LIKE :q OR old_price LIKE :q",
      q: "%#{search}%"
  end
  )
  scope :related_product, ->(category_id){where(category_id: category_id)}
  scope :order_by_created_at, ->{order("created_at DESC")}
  scope :search_by_name, ->search_product do
    where("products.name LIKE ?", "%#{search_product}%").order(name: :asc)
  end

  scope :best_selling,
    ->{select("products.*, SUM(order_details.quantity) as total_quantity")
    .joins(:order_details).group("products.id").order("total_quantity DESC")}
  end

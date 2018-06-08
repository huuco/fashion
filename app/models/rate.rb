class Rate < ApplicationRecord
  belongs_to :product
  belongs_to :user

  validates :star, presence: true, numericality: {
    greater_than_or_equal_to: Settings.min_rate_star,
    less_than_or_equal_to: Settings.max_rate_star}
  validates :content, presence: true, length: {
    maximum: Settings.max_rate_content}

  delegate :full_name, :email, to: :user, prefix: true, allow_nil: true
  delegate :name, to: :product, prefix: true, allow_nil: true
  scope :get_rate_actived_by_product_id,
    ->(product_id){(where active: Settings.rate_active, product_id: product_id)
    .order("created_at DESC")}
end

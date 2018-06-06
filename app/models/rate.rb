class Rate < ApplicationRecord
  belongs_to :product
  belongs_to :user

  validates :star, presence: true, numericality: {
    greater_than_or_equal_to: Settings.min_rate_star,
    less_than_or_equal_to: Settings.max_rate_star}
  validates :content, presence: true, length: {
    maximum: Settings.max_rate_content}

  delegate :full_name, to: :user, prefix: true, allow_nil: true
end

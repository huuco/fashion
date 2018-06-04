class Payment < ApplicationRecord
  has_many :orders
  validates :name, presence: true

  scope :list_payments, ->{select :id, :name, :description}
  PARAMS = %i(name description).freeze
end

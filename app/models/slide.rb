class Slide < ApplicationRecord
  scope :order_title, -> {select(:id, :title, :image, :link).order(title: :asc)}
end

class Slide < ApplicationRecord
  mount_uploader :image, ImageUploader
  scope :order_title, -> {select(:id, :title, :image, :link).order(title: :asc)}
end

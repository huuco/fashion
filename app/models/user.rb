class User < ApplicationRecord
  has_many :orders
  has_many :addresses, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :rates, dependent: :destroy
  enum role: %i(admin user)
end

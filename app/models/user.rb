class User < ApplicationRecord
  attr_accessor :remember_token
  has_many :orders
  has_many :addresses, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :rates, dependent: :destroy
  enum role: %i(admin user)
  has_secure_password

  def remember
    self.remember_token = User.new_token
    update_attributes remember_digest: User.digest(remember_token)
  end

  def self.digest string
    cost = BCrypt::Engine.cost
    cost = BCrypt::Engine::MIN_COST if ActiveModel::SecurePassword.min_cost
    BCrypt::Password.create string, cost: cost
  end

  def self.new_token
    SecureRandom.urlsafe_base64
  end

  def forget
    update_attributes remember_digest: nil
  end
end

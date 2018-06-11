class Comment < ApplicationRecord
  belongs_to :product
  belongs_to :user, optional: true

  COMMENT_PARAMS = %i(content author)
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :author, presence: true
  validates :content, presence: true
  validates :email, presence: true,
    length:{maximum: Settings.max_length_email},
    format: {with: VALID_EMAIL_REGEX}
  scope :show_review, (lambda do
    select(:content, :user_id, :author, :created_at).order created_at: :desc
  end)
end

class Customer < ApplicationRecord
  has_one_attached :avatar

  # Validations
  validates :full_name, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, allow_blank: true

  # Scopes for part 2
  scope :alphabetized, -> { order(:full_name) }
  scope :missing_email, -> { where(email: [nil, ""]) }
end

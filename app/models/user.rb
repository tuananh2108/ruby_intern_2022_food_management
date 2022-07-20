class User < ApplicationRecord
  acts_as_paranoid

  has_many :orders, dependent: :destroy

  VALID_EMAIL_REGEX = Settings.user.email_regex
  validates :email, presence: true,
            length: {maximum: Settings.user.email.max_length},
            format: {with: VALID_EMAIL_REGEX},
            uniqueness: true

  validates :password, presence: true,
            length: {minimum: Settings.user.password.min_length},
            if: :password,
            allow_nil: true

  has_secure_password

  before_save :downcase_email

  class << self
    def digest string
      cost = if ActiveModel::SecurePassword.min_cost
               BCrypt::Engine::MIN_COST
             else
               BCrypt::Engine.cost
             end
      BCrypt::Password.create string, cost: cost
    end
  end

  private
  def downcase_email
    email.downcase!
  end
end

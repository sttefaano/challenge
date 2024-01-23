class User < ApplicationRecord
  has_secure_password

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true, length: { minimum: 6 }
  validate :password_complexity

  private

  def password_complexity
    return if password.blank?

    unless password.match(/\A(?=.*[a-z])(?=.*[A-Z])(?=.*\d).+\z/)
      errors.add(:password, 'must include at least one lowercase letter, one uppercase letter, and one digit')
    end
  end
end

 class User < ApplicationRecord
  # Include default devise modules
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable, :lockable, :timeoutable

  # Validations
  validates :name, presence: true, length: { minimum: 2, maximum: 50 }
  validates :email, presence: true, 
                   uniqueness: { case_sensitive: false },
                   format: { with: URI::MailTo::EMAIL_REGEXP }

  # Callbacks
  before_save :downcase_email

  # Security - prevent mass-assignment of admin flag
  # Note: attr_accessible is removed in favor of strong parameters in the controller
  
  private

  def downcase_email
    self.email = email.downcase if email.present?
  end
end

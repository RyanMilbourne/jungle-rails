class User < ApplicationRecord

  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 5 }
  validates :password_confirmation, presence: true
  
  before_save :downcase_email

  def downcase_email
    self.email.downcase!
  end
  
  def self.authenticate_with_credentials(email, password)
    targetEmail = email.downcase.strip

    user = User.find_by(email: targetEmail)
    
    if user && user.authenticate(password)
      return user
    else
      return nil
    end

  end
end

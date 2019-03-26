class User < ActiveRecord::Base
  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { without: /\s/ }
  validates :password, confirmation: true, length: { minimum: 7 }

  def self.authenticate_with_credentials(email, password) 
    User.find_by(email: email.strip.downcase).try(:authenticate, password)
  end
end

class User < ActiveRecord::Base

  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 5 }
  validates :password_confirmation, presence: true
  validates :password_digest, presence: true

  def self.authenticate_with_credentials(email, password)
    email.strip!
    email.downcase!
    user = find_by_email(email)
    if user && user.authenticate(password) #password_digest == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

end

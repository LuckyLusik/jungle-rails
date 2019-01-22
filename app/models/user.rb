class User < ActiveRecord::Base

  has_secure_password
  has_many :reviews
  validates :email, uniqueness: true
  validates :password, :password_confirmation, presence: true, length: { minimum: 5}
  validates :first_name, :last_name, :email, presence: true

  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email)
    user && user.authenticate(password)
  end



end

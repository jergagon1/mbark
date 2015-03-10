class User < ActiveRecord::Base
  validates :email, :password, presence: true
  validates :password, length: {minimum: 6}
  validates :email, uniqueness: true

  has_many :dogs

  include BCrypt

  def password
    @password ||= Password.new(password_hash) if password_hash
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def authenticate(password)
   self.password == password
  end
end

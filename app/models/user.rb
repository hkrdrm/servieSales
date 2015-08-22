class User < ActiveRecord::Base
  attr_accessor :password

  validates_presence_of :email
  validates_presence_of :username
  validates :username, :uniqueness => true

  before_save :encrypt_password, :if => :password_required

  def self.authenticate(user, password)
    user = User.find_by_username(user.downcase)
    user && user.has_password?(password) ? user : nil
  end

  def has_password?(password)
    ::BCrypt::Password.new(crypted_password) == password
  end



  private

  def encrypt_password
    value = ::BCrypt::Password.create(password)
    #value = value.force_encoding(Encoding::UTF_8) if value.encoding == Encoding::ASCII_8BIT
    self.crypted_password = value
  end

  def password_required
    crypted_password.blank? || password.present?
  end
end

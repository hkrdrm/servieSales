class User < ActiveRecord::Base
  validates_presence_of :email
  validates_presence_of :username
  validates :username, :uniqueness => true

end

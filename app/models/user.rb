class User < ActiveRecord::Base
  has_secure_password
  validates_presence_of :email, uniqueness: true
  has_many :polls, :dependent => :nullify
  has_many :votes
end

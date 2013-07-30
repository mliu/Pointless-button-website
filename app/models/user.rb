require 'bcrypt'

class User < ActiveRecord::Base
  has_secure_password
  validates_uniqueness_of :username, before: create
  validates_uniqueness_of :email, before: create
  validates_presence_of :username, :email, :password, before: create
  
  def click
    self.update_attribute(:clicks, self.read_attribute(:clicks).to_i + 1)
  end
end
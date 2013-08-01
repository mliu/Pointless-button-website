require 'bcrypt'

class User < ActiveRecord::Base
  has_secure_password
  validates_uniqueness_of :username, before: create
  validates_uniqueness_of :email, before: create
  validates_presence_of :username, :email, :password, before: create
  #has_one :button, class_name: "Button", :foreign_key => "user_id"

  def valid_click?
    diff_seconds = Time.now - self.read_attribute(:end_time).to_s.to_time.strftime("%Y-%m-%d").to_time
    diff_seconds > 0
  end
end
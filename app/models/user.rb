require 'bcrypt'

class User < ActiveRecord::Base
  has_secure_password
  validates_uniqueness_of :username, before: create
  validates_uniqueness_of :email, before: create
  validates_presence_of :username, :email, :password, before: create
  validates :username, length: { minimum: 3, maximum: 15 }
  validates_format_of :username, :with => /^[-a-z]+$/, multiline: true, message: "must only contain letters and numbers"
  validates_format_of :email, :with => /^.+@.+$/, multiline: true
  has_many :points, :class_name => "Click", :foreign_key => "user_id"
  #has_one :button, class_name: "Button", :foreign_key => "user_id"

  def valid_click?
    diff_seconds = Time.now - self.read_attribute(:end_time).to_s.to_time.strftime("%Y-%m-%d").to_time
    diff_seconds > 0
  end
end
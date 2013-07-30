require 'bcrypt'

class User < ActiveRecord::Base
  has_secure_password
  validates_uniqueness_of :username, before: create
  validates_uniqueness_of :email, before: create
  validates_presence_of :username, :email, :password, before: create
  has_one :button, class_name: "Button", :foreign_key => "user_id"

  def click
    if button.valid_click?
      self.update_attribute(:clicks, self.read_attribute(:clicks).to_i + 1)
      button.update_attribute(:end_time, Time.now + rand(5..6000))
    else
      flash[:early_click] = "You clicked too early! (+20 minutes)"
      button.update_attribute(:end_time, :end_time.to_time() + 1200)
    end
  end
end
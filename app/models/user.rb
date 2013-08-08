require 'bcrypt'

class User < ActiveRecord::Base
  has_secure_password
  validates_uniqueness_of :username, before: :create
  validates_uniqueness_of :email, before: :create
  validates_presence_of :username, :email, :password
  validates :username, length: { minimum: 3, maximum: 15 }
  validates_format_of :username, :with => /^[a-zA-Z\d ]*$/i, multiline: true, message: "must only contain letters and numbers"
  validates_format_of :email, :with => /^.+@.+$/, multiline: true
  has_many :points, :class_name => "Click", :foreign_key => "user_id"
  has_many :achievements, :class_name => "Achievement", :foreign_key => "user_id"
  #has_one :button, class_name: "Button", :foreign_key => "user_id"

  def valid_click?
    diff_seconds = Time.now - self.read_attribute(:end_time).to_s.to_time.strftime("%Y-%m-%d").to_time
    diff_seconds > 0
  end

  def check
    hours = ("%0.f" % ((self.read_attribute(:end_time).to_s.to_time.strftime("%Y-%m-%d").to_time - Time.now)/3600)).to_i
    #Get more than 8 days
    if(hours > 192)
      Achievement.create(user_id: self.id, image: "1.jpg", title: "Noob!", description: "Exceeded 8 days in waiting time")
    end
    #Get more than 12 days
    if(hours > 288)
      Achievement.create(user_id: self.id, image: "2.jpg", title: "Instructions? What Instructions?", description: "Exceeded 12 days in waiting time")
    end
    #Get more than 20 days
    if(hours > 480)
      Achievement.create(user_id: self.id, image: "3.jpg", title: "How do I shot web?", description: "Exceeded 20 days in waiting time ಠ_ಠ")    
    end
    #More than 2 clicks
    if(self.points.count > 1)
      Achievement.create(user_id: self.id, image: "4.jpg", title: "Seasoned Pro", description: "Clicked twice")
    end
    #More than 3 clicks
    if(self.points.count > 2)
      Achievement.create(user_id: self.id, image: "5.jpg", title: "World Elite", description: "Clicked three times")
    end
    #More than 5 clicks
    if(self.points.count > 4)
      Achievement.create(user_id: self.id, image: "6.jpg", title: "Why", description: "Clicked five times")
    end
  end
end
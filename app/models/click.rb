class Click < ActiveRecord::Base
  #belongs_to :user, :class_name => "User"

  default_scope order("clicks.created_at DESC")
end

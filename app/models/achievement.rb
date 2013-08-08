class Achievement < ActiveRecord::Base
  belongs_to :user, :class_name => "User"
  validates_uniqueness_of :user_id, scope: :title
end

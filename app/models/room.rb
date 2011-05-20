class Room < ActiveRecord::Base
  has_many :room_users
  has_many :users, :through => :room_users
  
  # This allows us to obtain the creator of the room easily
  has_one :creator, :through => :room_users, :class_name => 'User', :source => :user, :conditions => ['room_users.creator = ?', true]
  
  validates :name, :presence => true
end

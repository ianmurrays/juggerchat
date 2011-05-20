class RoomUser < ActiveRecord::Base
  # TODO: Test this model
  belongs_to :room
  belongs_to :user
  
  validates :room_id, :user_id, :presence => true
  validates :creator, :inclusion => { :in => [true, false] }
end

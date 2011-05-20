require 'test_helper'

class RoomTest < ActiveSupport::TestCase
  test "set_creator should set the creator of the room" do
    room = rooms(:one)
    user = users(:one)
    
    room.set_creator! user
    assert_equal user.id, room.creator.id
  end
end

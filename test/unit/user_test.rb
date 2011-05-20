require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @fb_hash = {"user_info"=>{"name"=>"John Doe", "urls"=>{"Facebook"=>"http://www.facebook.com/john_doe", "Website"=>nil}, "nickname"=>"johndoe", "last_name"=>"Doe", "image"=>"http://graph.facebook.com/000000000/picture?type=square", "first_name"=>"John", "email"=>"john_doe@example.org"}, "uid"=>"0000000", "credentials"=>{"token"=>"0000"}, "extra"=>{"user_hash"=>{"name"=>"John Doe", "username"=>"johndoe", "timezone"=>0, "gender"=>"male", "id"=>"00000", "languages"=>[{"name"=>"English", "id"=>"106059522759137"}], "last_name"=>"Doe", "updated_time"=>"0000", "verified"=>true, "locale"=>"en_US", "hometown"=>{}, "link"=>"http://www.facebook.com/johndoe", "email"=>"johndoe@example.org", "first_name"=>"John"}}, "provider"=>"facebook"}
  end
  
  test "that user is created or returned from valid hash" do
    # Non-existent User
    user = User.create_or_get_from_omniauth @fb_hash
    assert user.valid?
    assert_equal @fb_hash['user_info']['name'], user.name
    assert_equal @fb_hash['uid'], user.uid
    assert_equal @fb_hash['provider'], user.provider
    assert_equal @fb_hash['user_info']['image'], user.picture_url
    
    # Existen User should now be just returned
    returned = User.create_or_get_from_omniauth @fb_hash
    assert_equal user.id, returned.id
  end
end

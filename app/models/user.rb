class User < ActiveRecord::Base
  validates :name, :uid, :provider, :presence => true
  
  # Creates a user from a valid hash
  def self.create_or_get_from_omniauth(hash)
    # Does he exist?
    user = where(:uid => hash['uid'], :provider => hash['provider']).first
    
    unless user
      user = create :name         => hash['user_info']['name'], 
                    :last_seen    => Time.now, 
                    :uid          => hash['uid'], 
                    :provider     => hash['provider'],
                    :picture_url  => hash['user_info']['image']
    end
    
    user
  end
end

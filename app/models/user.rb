class User < ActiveRecord::Base
  acts_as_liker
  has_many :friendships
  has_many :friends,
   :through => :friendships,
   :conditions => "status = 'accepted'",
   :order => :name
  has_many :requested_friends,
   :through => :friendships,
   :source => :friend,
   :conditions => "status = 'requested'",
   :order => :created_at
  has_many :pending_friends,
   :through => :friendships,
   :source => :friend,
   :conditions => "status = 'pending'",
   :order => :created_at
  has_many :wishlist, dependent: :destroy
  has_many :notification
	def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.notifcount=0
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end
  def largeimage
    "http://graph.facebook.com/#{self.uid}/picture?height=300&width=300"
  end
end

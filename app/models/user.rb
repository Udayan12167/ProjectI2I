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

  def books
    graph= Koala::Facebook::GraphAPI.new(self.oauth_token)
      @books=graph.get_connections("me","video.watches")
      # a = JSON.parse(open(URI.escape("http://graph.facebook.com/#{self.uid}/likes?access_token=#{self.oauth_token}")).read)
      # a = JSON.parse(@friends)
      return @books
  end
  def television
    graph= Koala::Facebook::GraphAPI.new(self.oauth_token)
      @tv=graph.get_connections("me","television")
      # a = JSON.parse(open(URI.escape("http://graph.facebook.com/#{self.uid}/likes?access_token=#{self.oauth_token}")).read)
      return @tv
  end
  def movies
    graph= Koala::Facebook::GraphAPI.new(self.oauth_token)
      @movies=graph.get_connections("me","movies")
      # a = JSON.parse(open(URI.escape("http://graph.facebook.com/#{self.uid}/likes?access_token=#{self.oauth_token}")).read)
      return @movies
  end
  def music
    graph= Koala::Facebook::GraphAPI.new(self.oauth_token)
      @music=graph.get_connections("me","music")
      # a = JSON.parse(open(URI.escape("http://graph.facebook.com/#{self.uid}/likes?access_token=#{self.oauth_token}")).read)
      return @music
  end
  def games
    graph= Koala::Facebook::GraphAPI.new(self.oauth_token)
      @games=graph.get_connections("me","games")
      # a = JSON.parse(open(URI.escape("http://graph.facebook.com/#{self.uid}/likes?access_token=#{self.oauth_token}")).read)
      return @games
  end

  def coverimage
    a = JSON.parse(open("http://graph.facebook.com/#{self.uid}?fields=cover").read)
    return a["cover"]["source"]
  end
end
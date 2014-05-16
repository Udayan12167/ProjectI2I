class FacebookApiController < ApplicationController

  def friends
    	@friends=Array.new
  	#@friendsonfundr=Array.new
  	if session["fb_access_token"].present?
  		graph= Koala::Facebook::GraphAPI.new(session["fb_access_token"])
  		@friends=graph.get_connections("me","friends","fields"=>"name,birthday,gender")
      
  	end
    respond_to do |format|
  		format.html
  		format.js
  	end
  end
  helper_method :friends
  def notify
     if session["fb_access_token"].present?
      @graph= Koala::Facebook::GraphAPI.new(session["fb_access_token"])
      @graph.put_object(params[:uid],"feed",{:message => "Join friendsfundr"})
      
    end
  end
  def fimage(id)
  	"http://graph.facebook.com/#{id}/picture?type=large"
  end
  helper_method :fimage
  def fbday(id)
    "http://graph.facebook.com/#{id}/birthday"
  end
  helper_method :fbday
  
end

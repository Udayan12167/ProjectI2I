module FacebookApiHelper
	def friends
  		friends=Array.new
  		#@friendsonfundr=Array.new
  		if session["fb_access_token"].present?
  			graph= Koala::Facebook::GraphAPI.new(session["fb_access_token"])
  			friends=graph.get_connections("me","friends","fields"=>"name,birthday,gender")
  		end
    	friends
  	end
  	def fimage(id)
  		"http://graph.facebook.com/#{id}/picture?type=large"
  	end
  	def fbday(id)
    	"http://graph.facebook.com/#{id}/birthday"
  	end
end

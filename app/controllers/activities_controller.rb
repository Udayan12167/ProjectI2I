class ActivitiesController < ApplicationController
  
  def index
  	@activities = Array.new
  	@activities = PublicActivity::Activity.order("created_at desc")
  	@activities
  end

  helper_method :index

  def post
	if current_user.oauth_token
    	@graph = Koala::Facebook::API.new(current_user.oauth_token) # Note that i'm using session here
		@graph.put_wall_post("Hi I Created a wishlist using friendfundr", {:link => "www.cnet.com"})
  	end
  	redirect_to root_url
  end



  
end

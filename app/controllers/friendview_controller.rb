class FriendviewController < ApplicationController
  def index
  	@object = params[:my_params]
  	@friends=Array.new
    #@friendsonfundr=Array.new
    if session["fb_access_token"].present?
      graph= Koala::Facebook::GraphAPI.new(session["fb_access_token"])
      @friends=graph.get_connections("me","friends","fields"=>"name,birthday,gender")
     end
  end
end

class FriendshipController < ApplicationController
	before_filter :setup_friends
	def index
		@friendship=Friendship.all
	end
	def create
		Friendship.request(@user,@friend)
		flash[:notice]="Friend request sent"
		redirect_to root_url
	end
	private
    	def setup_friends
       		@user = User.find(session[:user_id])
       		@friend = User.find_by_name(params[:id])
		end
end

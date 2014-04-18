class ApplicationController < ActionController::Base
  include PublicActivity::StoreController
  def fimage(id)
    "http://graph.facebook.com/#{id}/picture?type=large"
  end
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  	def current_user
    	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  	end
  	helper_method :current_user
    hide_action :current_user
    private

  	def current_wishlist
  		@wishlist ||= User.find(session[:user_id]).wishlist.paginate(page: params[:page])
  	end
  	helper_method :current_wishlist
end

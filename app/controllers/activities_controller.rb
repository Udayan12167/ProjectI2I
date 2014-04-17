class ActivitiesController < ApplicationController
  def index
  	@activities = Array.new
  	@activities = PublicActivity::Activity.order("created_at desc")
  	@activities
  end

  helper_method :index

  
end

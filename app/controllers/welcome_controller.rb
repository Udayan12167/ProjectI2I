include WillPaginateHelper 
class WelcomeController < ApplicationController
  def index
  	current_page=1
  	if params[:page]!=nil
  		current_page=params[:page].to_i
  	end
    per_page=30
  	@friends=Array.new
  	if session["fb_access_token"].present?
  		graph= Koala::Facebook::GraphAPI.new(session["fb_access_token"])
  		@friends=graph.get_connections("me","friends","fields"=>"name,birthday,gender")
      
  	end
  	@page_results=[]
  	@friends.each{|hash| @page_results << {'id' => hash["id"],'name' =>hash["name"],'birthday' => hash["birthday"]}}
  	@paginated_results=@page_results.paginate(:page => current_page,:per_page => per_page)
  	#@page_results=WillPaginate::Collection.create(current_page,per_page,count) do |pager|
     # start=(current_page-1)*per_page
      #pager.replace(@friends.to_array[start,per_page])
    #end
    respond_to do |format|
  		format.js
  	end
  end
  helper_method :index
  def home
  	current_page=1
    if params[:page]!=nil
      current_page=params[:page].to_i
    end
    per_page=30
    @friends=Array.new
    if session["fb_access_token"].present?
      graph= Koala::Facebook::GraphAPI.new(session["fb_access_token"])
      @friends=graph.get_connections("me","friends","fields"=>"name,birthday,gender")
      
    end
    @page_results=[]
    @friends.each{|hash| @page_results << {'id' => hash["id"],'name' =>hash["name"],'birthday' => hash["birthday"]}}
    @paginated_results=@page_results.paginate(:page => current_page,:per_page => per_page)
    #@page_results=WillPaginate::Collection.create(current_page,per_page,count) do |pager|
     # start=(current_page-1)*per_page
      #pager.replace(@friends.to_array[start,per_page])
    #end
    respond_to do |format|
      format.html
      format.js

    end
  end
  def date
    @date=params[:date]
    @id=params[:person]
    respond_to do |format|
      format.js
    end
  end
 
end

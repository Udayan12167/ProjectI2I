class WishlistsController < ApplicationController
  respond_to :js

  @@poolarr = Hash.new

  def index
    @wishlist = Wishlist.all
  end
  def create
    @userid = params[:userid]
    if @userid != nil
      @username = User.find_by_id(@userid).name
    end
    @wishlist = current_user.wishlist.build(wishlist_params)
    @wishlist.user = current_user
    @wishlist.save
    friendship=Friendship.all
    friendship.each do |t|
      if t.user_id==current_user.id && @username != nil
         Notification.create(:owner_id => current_user.uid ,:user_id => t.friend_id , :content => "added item to wishlist #{@wishlist.id} via #{@username}",:name => current_user.name, :content_id => 1)
      elsif t.user_id==current_user.id
        Notification.create(:owner_id => current_user.uid ,:user_id => t.friend_id , :content => "added item to wishlist #{@wishlist.id}",:name => current_user.name, :content_id => 1)
    
      end
      if params[:flag] != nil 
        redirect_to root_url
      end
    end

    
    respond_to do |format|
      format.js
    end 

  end

  def destroy
    @wishlist.destroy
  end


  def requestpool
    @loc = Facebooksignin::Application::YOUR_GLOBAL_VAR
    @wishid = params[:wishid]
    @ids = Array.new
    @ids = params[:values]
    @wishid = params[:wishid]
    @userid = params[:userid]
    @ids.each do |i|
      user = User.find_by_uid(i)
      Notification.create(:owner_id => current_user.uid ,:user_id => user.id , :content => "invited you to pool in wishlist item #{@wishid} belonging to #{User.find_by_id(@userid).name}",:name => current_user.name, :content_id => 1)
    end
    w = Wishlist.find_by_id(@wishid)
    w.poolers = ""
    w.poolers << " #{current_user.id}"
    w.save!
   PoolGroup.create(:wishlist_id => w.id, :poolers => w.poolers)
   $id = PoolGroup.find_by_wishlist_id_and_poolers(w.id,w.poolers).id
  # session[:return_to] ||= request.referer
  # redirect_to session.delete(:return_to)
  end


  def claimview
    @itemm = @friends
    #render 'wishlists/claim'
  end

  



  def responsepool
    @loc = Facebooksignin::Application::YOUR_GLOBAL_VAR
    @i = @@poolarr
    @accept = params[:response]
    # @reject = params[:reject]
    @wishid = params[:wishid]
    @userid = params[:userid]
    @notifid = params[:notifid]
    @del = Notification.find_by_id(@notifid)
    if @accept == "accept"
      Notification.create(:owner_id => current_user.uid ,:user_id => User.find_by_uid(@userid).id , :content => "accepted your pool request for gift #{@wishid} belonging to #{User.find_by_id(Wishlist.find_by_id(@wishid).user_id).name}",:name => current_user.name, :content_id => 1)
      w = Wishlist.find_by_id(@wishid)
      ar = w.poolers.scan(/\d+/)
      if ar.index(current_user.id.to_s) == nil 
       w.poolers << " #{current_user.id}"
       w.save!
     end
       @wpool = PoolGroup.find_by_id($id)
       @wpool.poolers = w.poolers
       @wpool.save!
  
      
    elsif @accept == "reject"
      Notification.create(:owner_id => current_user.uid ,:user_id => @userid , :content => "rejected your pool request for gift #{@wishid} belonging to #{User.find_by_id(Wishlist.find_by_id(@wishid).user_id).name}",:name => current_user.name, :content_id => 1)
    end
    if @del != nil
      @del.content_id = 0;
      @del.save!
    end
    session[:return_to] ||= request.referer
    redirect_to session.delete(:return_to)
  end

  def exitpool
    @wishid = params[:wishid]
    @w = Wishlist.find_by_id(@wishid)
    @a = @w.poolers.to_s.scan(/\d+/)
    @a.delete(current_user.id.to_s)
    @w.poolers = @a.to_s
    @w.save!
    redirect_to root_url
  end

  def claimed
    @wishid = params[:wishid]
    @userid = params[:userid]
    @claimer = params[:claimer]
    if @wishid != nil && @claimer != nil && @userid != nil
      user = User.find_by_id(@userid)
      if user != nil
        user.wishlist.each do |t|
          if t.id.to_i == @wishid.to_i
            t.claimed = 1;
            t.claimer = @claimer
            t.save!
            Friendship.all.each do |t|
              if t.user_id==current_user.id && t.friend_id != User.find_by_id(Wishlist.find_by_id(@wishid).user_id).id
                 Notification.create(:owner_id => current_user.uid ,:user_id => t.friend_id , :content => "claimed wishlist item #{@wishid} belonging to #{User.find_by_id(@userid).name}",:name => current_user.name, :content_id => 1)
              end
            end
          end
        end
      end
    end
    respond_to do |format|
      format.js
    end 
  end

  def unclaimed
    @wishid = params[:wishid]
    @userid = params[:userid]
    @claimer = params[:claimer]
    if @wishid != nil && @claimer != nil && @userid != nil
      user = User.find_by_id(@userid)
      if user != nil
        user.wishlist.each do |t|
          if t.id.to_i == @wishid.to_i
            t.claimed = nil;
            t.claimer = nil
            t.save!
             temp =  Notification.find_by_content("claimed wishlist item #{@wishid} belonging to #{User.find_by_id(@userid).name}")
             while temp!= nil
              Notification.delete(temp)
              temp =  Notification.find_by_content("claimed wishlist item #{@wishid} belonging to #{User.find_by_id(@userid).name}")
              end

            
          end
        end
      end
    end
    respond_to do |format|
      format.js
    end 
  end

  def remove
    @object = params[:my_param]
    current_user.wishlist.each do |t|
      if @object.to_i == t.id.to_i
        t.destroy
        t.pool_group.destroy
        Notification.all.each do |n|
          if n.content.scan(/\d+/).first.to_i == t.id.to_i
            n.destroy
          end
        end
      end
    end
    redirect_to root_url
  end
  def initiate
    @wishlist =current_user.wishlist.build
  end

  def poolnotif
    @c = params[:created]
    @u = params[:u]
    @notifid = params[:notifid]
    @del = Notification.find_by_user_id_and_created_at(@u,@c)
  end

  def read
    
    @c = params[:created]
    @u = params[:u]
    @del = Notification.find_by_user_id_and_created_at(@u,@c)
    if @del != nil
      @del.content_id = 0
      @del.save!
    end
    respond_to do |format|
      format.js
    end
  end

  def readAll
    current_user.notification.all.each do |n|
      n.content_id = 0
      n.save!
    end
  session[:return_to] ||= request.referer
  redirect_to session.delete(:return_to)
  end

  def vote
    @object = params[:wish_param]
    @user_id = User.find_by_id(params[:my_params])
    
    Wishlist.all.each do |t|
      if @object.to_i == t.id.to_i
        current_user.like!(t)
        friendship=Friendship.all
        friendship.each do |f|
          if f.user_id==current_user.id
            Notification.create(:owner_id => current_user.uid ,:user_id => f.friend_id , :content => "liked your wishlist item #{t.id}",:name => current_user.name ,:content_id => 1)
          end
        end
      end

    end
    #redirect_to root_url
    
     respond_to do |format|
       format.js
    end 
  end
  def unvote
      @object = params[:wish_param]
      @user_id = User.find_by_id(params[:my_params])
      Wishlist.all.each do |t|
      if @object.to_i == t.id.to_i
        current_user.unlike!(t)
      end
      
    end
     #redirect_to root_url
    respond_to do |format|
      format.js
    end   
    # Notification.all.each do |n|
    #   del = Notification.find_by_content_and_by_name("liked your wishlist item #{@object}",current_user.name)
    #   if del != nil
    #   del.destroy
    # end
    # end
    end

  private

    def wishlist_params
      params.require(:wishlist).permit(:link,:price)
    end

    

  
end
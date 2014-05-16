class WishlistsController < ApplicationController
  respond_to :js
  def index
    @wishlist = Wishlist.all
  end
  def create
    @wishlist = current_user.wishlist.build(wishlist_params)
    @wishlist.user = current_user
    friendship=Friendship.all
    friendship.each do |t|
      if t.user_id==current_user.id
        Notification.create(:owner_id => current_user.uid ,:user_id => t.friend_id , :content => "added item to wishlist",:name => current_user.name)
      end
      if params[:flag] != nil 
        redirect_to root_url
      end
    end

    if @wishlist.save
      flash[:notice] = "Micropost created!"
      redirect_to root_url
    else
      render 'layouts/profile'
    end
  end

  def destroy
  end

  def remove
    @object = params[:my_param]
    current_user.wishlist.each do |t|
      if @object.to_i == t.id.to_i
        current_user.wishlist.delete(t)
      end
    end
    redirect_to root_url
  end
  def initiate
    @wishlist =current_user.wishlist.build
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
            Notification.create(:owner_id => current_user.uid ,:user_id => f.friend_id , :content => "liked your wishlist item #{t.id}",:name => current_user.name)
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
    end

  private

    def wishlist_params
      params.require(:wishlist).permit(:link,:price)
    end

    

  
end
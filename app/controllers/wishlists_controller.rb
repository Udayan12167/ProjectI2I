class WishlistsController < ApplicationController
  respond_to :js
  def index
    @wishlist = Wishlist.all
  end
  def create
    @wishlist = current_user.wishlist.build(wishlist_params)
    @wishlist.user = current_user
    

    if @wishlist.save
      flash[:notice] = "Micropost created!"
      redirect_to root_url
    else
      render 'layouts/profile'
    end
    friendship=Friendship.all
    friendship.each do |t|
      if t.user_id==current_user.id
        Notification.create(:owner_id => current_user.uid ,:user_id => t.friend_id , :content => "added item to wishlist bhenchod #{@wishlist.id}",:name => current_user.name, :content_id => 1)
      end
      if params[:flag] != nil 
        redirect_to root_url
      end
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



  def read
    
    @c = params[:created]
    @u = params[:u]
    @del = Notification.find_by_user_id_and_created_at(@u,@c)
    if @del != nil
      @del.content_id = 0
      @del.save!
    end
    redirect_to root_url
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
class WishlistsController < ApplicationController
  def index
    @wishlist = Wishlist.all
  end
  def create
    @wishlist = current_user.wishlist.build(wishlist_params)
    friendship=Friendship.all
    friendship.each do |t|
      if t.user_id==current_user.id
        Notification.create(:user_id => t.friend_id , :content => "added item to wishlist",:name => current_user.name)
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
  def initiate
    @wishlist =current_user.wishlist.build
  end

  def vote
      @object = params[:my_param]
      current_user.wishlist.each do |t|
      if @object.to_i == t.id.to_i
        current_user.like!(t)
      end

    end
   redirect_to root_url  
    end
  def unvote
      @object = params[:my_param]
      current_user.wishlist.each do |t|
      if @object.to_i == t.id.to_i
        current_user.unlike!(t)
      end

    end
    redirect_to root_url  
    end

  private

    def wishlist_params
      params.require(:wishlist).permit(:link,:price)
    end

    

  
end
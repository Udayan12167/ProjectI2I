class WishlistsController < ApplicationController
  def index
    @wishlist = Wishlist.all
  end
  def create
    @wishlist = current_user.wishlist.build(wishlist_params)
    friendship=Friendship.all
    friendship.each do |t|
      if t.user_id==current_user.id
        Notification.create(:user_id => t.friend_id , :content => "#{current_user.name} added item to wishlist")
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
  private

    def wishlist_params
      params.require(:wishlist).permit(:link,:price)
    end
end
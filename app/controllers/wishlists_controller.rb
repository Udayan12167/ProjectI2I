class WishlistsController < ApplicationController
  def index
    @wishlist = Wishlist.all
  end
  def create
    @wishlist = current_user.wishlist.build(wishlist_params)
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
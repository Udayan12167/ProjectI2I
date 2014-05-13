class Wishlist < ActiveRecord::Base
	include PublicActivity::Model
	belongs_to :user
	validates :user_id, presence: true
	validates :link, presence: true,length: {maximum: 140}
	
end


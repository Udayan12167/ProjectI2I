class Wishlist < ActiveRecord::Base
	include PublicActivity::Model
	belongs_to :user
	acts_as_likeable
	validates :user_id, presence: true
	validates :link, presence: true,length: {maximum: 140}
	
end


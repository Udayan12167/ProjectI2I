class Wishlist < ActiveRecord::Base
	has_many :pool_group
	serialize :poolers
	include PublicActivity::Model
	tracked owner: ->(controller,model) { controller && controller.current_user}
	belongs_to :user
	acts_as_likeable
	validates :user_id, presence: true
	validates :link, presence: true,length: {maximum: 140}

  
	
end


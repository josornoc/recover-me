class Relation < ActiveRecord::Base

	validates :item_id, presence: true, numericality: true
	validates :user_id, presence: true, numericality: true
	validates :type, presence: true

	belongs_to :item
	belongs_to :user

end

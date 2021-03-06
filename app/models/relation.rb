class Relation < ActiveRecord::Base

  # @my_items_ids = @my_relations.map(&:item_id)
  # requests = @my_items_ids.map{ |val| Relation.where( item_id: val ) };
  # requests.where( "user_id != ?", current_user.id )
  # #Relation.where(item_id:my_items_ids[i])

	# validates :item_id, presence: true, numericality: true
	# validates :user_id, presence: true, numericality: true
	
	validates :type, presence: true

	has_many   :answers
	belongs_to :item
	belongs_to :user

	def ownership_validated?
		answers.each do |answer|
			return false if answer.is_validated == false
		end
		true
	end

	def self.get_by_user_id(user_id)
		where( user_id:user_id )
	end

	def self.get_by_item_id(item_id)
		where( item_id:item_id )
	end

	def self.get_by_item_without_user(user_id, item_id)
		where(["user_id != ? and item_id = ?", user_id, item_id])
	end

  def self.get_by_userid_and_itemid(user_id, item_id)
    where(["user_id = ? and item_id = ?", user_id, item_id])
  end
end

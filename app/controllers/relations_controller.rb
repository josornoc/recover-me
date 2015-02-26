class RelationsController < ApplicationController

	def create
		
		@item = Item.where(id: params[:item_id])
		binding.pry

		# @relation = Relation.new relation_found_params
		# if @relation.save
		# 	redirect_to item_path
		# else
		# 	@relation.errors.add(:item, "The item couldn't be save correctly in the database...")
		# end
	end

	private
	def relation_found_params
    params.require(:relation).permit(:item_id, :user_id)
  end
end












class RelationsController < ApplicationController

	def authenticate
		@relation = Relation.find( params[:id] )
		session[:current_relation_id] = @relation.id
	end

	def create
		@item = Item.where(id: params[:item_id])[0]
		if(@item.is_lost?)
			@relation = Founder.new(item_id: params[:item_id], user_id: params[:user_id])
		end

		if(@item.is_found?)
			@relation = Owner.new(item_id: params[:item_id], user_id: params[:user_id])
		end

		if @relation.save
			redirect_to item_path(@item)
		else
			@relation.errors.add(:item, "The item couldn't be save correctly in the database...")
		end

	end

	private
	def owner_found_params
    params.require.permit(:item_id, :user_id)
  end

  def founder_found_params
    params.require.permit(:item_id, :user_id)
  end
end












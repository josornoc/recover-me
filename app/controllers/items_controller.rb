class ItemsController < ApplicationController

	def index
	end

	def new
		@is_reporting_lost
		if params["reporting"] == "lost"
			@is_reporting_lost = true
		elsif params["reporting"] == "found"
			@is_reporting_lost = false
		end
		@item = Item.new
		render 'new'
	end

	def create
		if @is_reporting_lost
			@item = Item.new item_lost_params
		else
			@item = Item.new item_found_params
		end

		if @item.save
			redirect_to root_path
		else
			@item.errors.add(:item, "The item couldn't be save correctly in the database...")
		end

	end

	private
	def item_lost_params
    params.require(:item).permit(:name, :datetime, :contact_email, :description, :reward, :category, :state)
  end

  def item_found_params
    params.require(:item).permit(:name, :datetime, :contact_email, :description, :category, :state)
  end

end












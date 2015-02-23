class ItemsController < ApplicationController

	def index

	end

	def new
		session["reporting"] = get_reporting_status
		if session["reporting"] == "lost"
			@is_reporting_lost = true
		elsif session["reporting"] == "found"
			@is_reporting_lost = false
		end
		@item = Item.new
		render 'new'
	end

	def create
		
		if session["reporting"] == "lost"
			@item = Item.new item_lost_params
			@item.state = "lost"
		else
			@item = Item.new item_found_params
			@item.state = "found"
		end

		if @item.save
			redirect_to root_path
		else
			@item.errors.add(:item, "The item couldn't be save correctly in the database...")
		end

	end

	private

	def get_reporting_status 
		params["reporting"]
	end

	def item_lost_params
    params.require(:item).permit(:name, :datetime, :contact_email, :description, :reward, :category)
  end

  def item_found_params
    params.require(:item).permit(:name, :datetime, :contact_email, :description, :category)
  end

end












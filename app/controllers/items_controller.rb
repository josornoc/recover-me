class ItemsController < ApplicationController

	before_action :require_login
	
	helper_method :is_current_user_owner?

	def index
		# all relations for current user
		@my_relations = Relation.get_by_user_id(session[:logged_in_user])
		# all item ids for current user - can be inside items
		my_item_ids = @my_relations.map(&:item_id)
		# all item requests by other users over my items
		@item_requests = get_item_requests(my_item_ids)
		#got to check new messages - pending validations - pending questions - etc!
		@other_relations = Relation.where("user_id != ?", current_user.id)
		#@lost_items = Item.all
		@lost_items = get_current_lost_items

		#for creating new reports
		@item = Item.new
		@relation = @item.relations.new

		#user lost & found
		@user_lost_items = Item.get_lost_items_by_user_id(current_user.id)
		@user_found_items = Item.get_found_items_by_user_id(current_user.id)
	end

	def get_item_requests( items_ids )
		# get relations over item without the current user... this means requests / item matches by other users
		r_ary = []
		items_ids.each do |item_id|
			r_ary << Relation.get_by_item_without_user(current_user.id, item_id)
		end
		r_ary
	end

	def new
		session["reporting"] = get_reporting_status
		if session["reporting"] == "lost"
			@is_reporting_lost = true
		elsif session["reporting"] == "found"
			@is_reporting_lost = false
		end
		@item = Item.new
	end

	def create

		@item = Item.new item_params
		@item.relations.first.user_id = session[:logged_in_user]

		if @item.save
			flash["success_message"] = "Report created succesfully."
			#redirect_to items_path
			redirect_to item_path(@item)
		else
			flash[:danger_message] = @item.errors.full_messages
			#redirect_to items_path
		end		
	end

	def show

		@user = current_user
		@item = Item.where(id: params[:id])[0]

		if @item.founders.where(user_id: @user.id).empty? == false
			@relation_ship_type = "founder"
		elsif @item.owners.where(user_id: @user.id).empty? == false
			@relation_ship_type = "owner"
		else
			@relation_ship_type = nil
		end
	end

	def destroy
		item = Item.find(params[:id])
		Relation.where(item_id: item.id).destroy_all
		item.destroy
		flash.now["info_message"] = "Report deleted succesfully."
		redirect_to items_path
	end

	private

	def is_current_user_owner?
		return true if @item.owners.first.user.id == @user.id
		false
	end

	def get_reporting_status
		params["reporting"]
	end

	def item_params
		params.require(:item).permit(:name,:avatar,:datetime,:contact_email,:state,:description,:reward,:category,relations_attributes:[:id, :type])
  end

  def get_current_lost_items
		all_items = Item.all
		relations = []
		item_results = []
		all_items.each do |item|
			if item.relations.length > 1
				item.relations.each do |relation|
					relations << relation.ownership_validated?
				end
				if relations.include? false
					item_results << item
				else
					p 'already validated relation....'
				end
			else
				item_results << item
			end
		end
		item_results
	end
end



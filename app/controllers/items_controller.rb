class ItemsController < ApplicationController

	def index
		@my_relations = Relation.get_by_user_id(current_user.id)
		my_item_ids = @my_relations.map(&:item_id)
		@item_requests = get_item_requests(my_item_ids)
		@other_relations = Relation.where("user_id != ? ", current_user.id)
		@lost_items = Item.all
		# for new reportings and relations...
		@item = Item.new
		@relation = @item.relations.build
	end

	def get_item_requests( items_ids )
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
		type_param_relation = params["item"]["relations_attributes"]["0"]["type"]

		if @item.save
			@item.relations.create(item_id:@item.id,user_id:current_user.id,type:type_param_relation,has_validated_questions:false)
			redirect_to items_path
		else
			@item.errors.add(:item, "The item couldn't be save correctly in the database...")
			#flash["error_message"] = "The item couldn't be save correctly in the database..."
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

	private
	def get_reporting_status
		params["reporting"]
	end

	def item_params
		params.require(:item).permit(:name, :avatar, :datetime, :contact_email, :state, :description, :reward, :category)
  end
end












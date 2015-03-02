class RelationsController < ApplicationController

	def authenticate
		get_current_relation
	end

	def create
		@item = get_current_item
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

	def answer
		#@answer = get_current_relation.answers.create(answer_params)
		@answer = get_current_relation.answers.create(answer: params[:answer],
																									relation_id: params[:id],
																									user_id: current_user.id,
																									question_id: params[:question_id])
		if @answer.save
			redirect_to items_path
		else
			@answer.errors.add(:answer, "The answer couldn't be save correctly in the database...")
		end
	end

	private

	def get_current_item
		Item.where(id: params[:item_id])[0]
	end

	def get_current_relation
		@relation = Relation.find( params[:id] )
		session[:current_relation_id] = @relation.id
		@relation
	end

	def answer_params
		 params.require(:answer).permit(:answer, :id)
	end

	def owner_found_params
    params.require.permit(:item_id, :user_id)
  end

  def founder_found_params
    params.require.permit(:item_id, :user_id)
  end
end












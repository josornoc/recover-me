class QuestionsController < ApplicationController

	def create
		@question = Question.new(name: params[:name], answer: params[:answer], item_id: params[:item_id])
		if @question.save
			redirect_to item_relation_path(params[:item_id], current_relation)
		else
			@question.errors.add(:question, "The item couldn't be save correctly in the database...")
		end
	end

	private
	def question_params
    params.require.permit(:name, :answer)
  end
end












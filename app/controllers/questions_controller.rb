class QuestionsController < ApplicationController

	def create

		@item = Item.find(params[:item_id])
		@question = @item.questions.new question_params
		@question.item_id = params[:item_id]

		if @question.save
			redirect_to item_relation_path(params[:item_id], current_relation)
		else
			@question.errors.add(:question, "The item couldn't be save correctly in the database...")
			redirect_to :back
		end

	end

	def validate_answer
		@answer = Answer.find(params[:answer_id])
		@answer.update_attribute(:is_validated, params[:is_validated])
		redirect_to items_path
	end

	private

	def question_params
    params.require(:question).permit(:name, :answer)
  end
end












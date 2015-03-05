class Answer < ActiveRecord::Base

	belongs_to :relation
  belongs_to :user
  belongs_to :question

  def self.validate_all_by_userid_and_relationid(user_id, relation_id)
		answers = where(["user_id = ? and relation_id = ?", user_id, relation_id])
		responses = []
		answers.each do |answer|
			responses << answer.is_validated
		end
		return false if responses.include? false
		return nil if responses.include? nil
		true
  end
end



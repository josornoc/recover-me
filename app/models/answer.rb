class Answer < ActiveRecord::Base
	#validations here...
	belongs_to :relation
  belongs_to :user
  belongs_to :question

  def self.validate_all_by_userid_and_relationid(user_id, relation_id)
		answers = where(["user_id = ? and relation_id = ? and is_validated = ?", user_id, relation_id, false])
		return false if answers.length > 0
		return true
  end
end



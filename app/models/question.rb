class Question < ActiveRecord::Base

	# validates :type, presence: true
	validates :name, presence: true
	belongs_to :item
  has_many :answers

  def already_answerd?(user_id)
    return true if( answers.where(user_id: user_id).any? )
    false
  end

  def get_answer_by_user_id(user_id)
    answers.where(user_id: user_id)[0].answer
  end

  def is_answer_validated?(user_id)
    answers.where(user_id: user_id)[0].is_validated
  end

end

class Answer < ActiveRecord::Base
	#validations here...
	belongs_to :relation
  belongs_to :user
  belongs_to :question
end
class Question < ActiveRecord::Base

	validates :type, presence: true
	validates :name, presence: true
	validates :answer, presence: true

	belongs_to :item

end

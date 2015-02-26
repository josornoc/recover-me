class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      # type of the question (unique choice, multiple choice, open, ...)
      t.string :type
    	# name of the question
    	t.text :name
    	# if the question has been validated by the founder
    	t.boolean :is_validated, :default => false
    	# the answer against the actual answer of the user would be validated
    	# the user can override this and validate manually all questions
    	t.string :answer
      t.timestamps null: false
    end
  end
end

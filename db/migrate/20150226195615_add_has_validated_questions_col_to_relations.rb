class AddHasValidatedQuestionsColToRelations < ActiveRecord::Migration

  def self.up
  	add_column :relations, :has_validated_questions, :boolean
  end

  def self.down
  	remove_column :relations, :has_validated_questions
  end

end

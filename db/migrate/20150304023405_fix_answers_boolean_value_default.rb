class FixAnswersBooleanValueDefault < ActiveRecord::Migration
  def change
		change_column :answers, :is_validated, :boolean, :default => nil
  end
end

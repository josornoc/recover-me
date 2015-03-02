class AddIsValidatedToAnswers < ActiveRecord::Migration
  def self.up
    add_column :answers, :is_validated, :boolean
  end
  def self.down
    add_column :answers, :is_validated
  end
end

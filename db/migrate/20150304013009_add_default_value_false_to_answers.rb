class AddDefaultValueFalseToAnswers < ActiveRecord::Migration
	
  def self.up
  	change_column :answers, :is_validated, :boolean, :default => false
  end

  def self.down
  	change_column :answers, :is_validated, :boolean
  end
end

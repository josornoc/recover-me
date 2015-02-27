class AddItemIdToQuestions < ActiveRecord::Migration
  def self.up
  	add_column :questions, :item_id, :integer
  end
  def self.down
  	remove_column :questions, :item_id
  end
end

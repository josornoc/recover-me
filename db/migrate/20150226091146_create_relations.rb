class CreateRelations < ActiveRecord::Migration
  def change
    create_table :relations do |t|
    	t.integer :item_id
    	t.integer :user_id
    	t.string  :type
      t.timestamps null: false
    end
  end
end

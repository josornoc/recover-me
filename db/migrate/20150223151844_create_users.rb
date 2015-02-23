class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	# date where found or lost
    	t.string	:name
    	# name of the product
    	t.string	:email
    	# ····
      t.timestamps null: false
    end
  end
end

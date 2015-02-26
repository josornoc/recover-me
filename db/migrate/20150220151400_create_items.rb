class CreateItems < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      # type of the question (unique choice, multiple choice, open, ...)
      t.string :type
    	# name of the question
    	t.string :name
    	# lost, found, resolver, etc...
    	t.boolean :is_validated, :default => false
    	# brief description of the product... if any
    	t.string :string
      t.timestamps null: false
    end
  end
end

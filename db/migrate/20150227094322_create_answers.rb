class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
    	t.integer :relation_id
    	t.text    :answer
      t.timestamps null: false
    end
  end
end

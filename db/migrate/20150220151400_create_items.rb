class CreateItems < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.datetime :datetime
      t.string   :name
      t.string   :state
      t.text     :description
      t.float    :latitude
      t.float    :longitude
      t.string   :contact_email
      t.string   :reward
      t.string   :category
      t.integer  :user_id
      t.string   :avatar_file_name
      t.string   :avatar_content_type
      t.integer  :avatar_file_size
      t.datetime :avatar_updated_at
      t.timestamps null: false
    end
  end
end
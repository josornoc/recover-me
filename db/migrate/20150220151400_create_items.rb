class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
    	# date where found or lost
    	t.datetime 			  :datetime
    	# name of the product
    	t.string				  :name
    	# lost, found, resolver, etc...
    	t.string				  :state
    	# brief description of the product... if any
    	t.text				    :description
    	# for GEO purposes
    	t.float           :latitude
    	# for GEO purposes
    	t.float           :longitude
    	# this can be abstracted to a class in a later iteration
    	t.string          :contact_email
    	# only if lost user can actually enter a reward
    	t.string          :reward
    	# categories will be implemented in a later iteration, default will be nil...
    	t.string          :category
    	# default
      t.timestamps  null: false
    end
  end
end

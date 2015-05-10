class AddReviews < ActiveRecord::Migration
  def change
  	    create_table :reviews do |t|
	        t.integer :quest_id
	        t.integer :questgiver_id
	        t.integer :adventurer_id
	        t.integer :rating
	        t.string :comment
	        t.datetime :post_time
    	end

	    add_foreign_key :reviews, :users, column: :questgiver_id
	    add_foreign_key :reviews, :users, column: :adventurer_id
	    add_foreign_key :reviews, :quests, column: :quest_id
	  end
end

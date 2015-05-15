class AddNumberOfAdventurerRatingsToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :num_adventurer_ratings, :int, default: 0
  end
end

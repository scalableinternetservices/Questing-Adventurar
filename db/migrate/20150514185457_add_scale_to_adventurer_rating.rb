class AddScaleToAdventurerRating < ActiveRecord::Migration
  def change
  	change_column :profiles, :adventurer_rating, :decimal, precision: 10, scale: 2
  end
end

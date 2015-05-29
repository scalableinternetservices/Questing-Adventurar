class AddLatitudeAndLongitudeToQuest < ActiveRecord::Migration
  def change
    add_column :quests, :latitude, :float
    add_column :quests, :longitude, :float
  end
end

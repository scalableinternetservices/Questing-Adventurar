class AddSearchRegionToQuests < ActiveRecord::Migration
  def change
    add_column :quests, :search_region, :string
  end
end
class ChangeIndexToQuests < ActiveRecord::Migration
  def change
    add_index :quests, :status
  end
end

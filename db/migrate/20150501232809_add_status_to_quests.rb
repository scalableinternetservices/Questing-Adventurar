class AddStatusToQuests < ActiveRecord::Migration
  def change
    add_column :quests, :status, :integer
  end
end

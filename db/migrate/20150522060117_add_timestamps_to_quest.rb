class AddTimestampsToQuest < ActiveRecord::Migration
  def change
    add_column :quests, :updated_at, :datetime
  end
end

class ChangeStatusDefault < ActiveRecord::Migration
  def change
  	change_column :quests, :status, :integer, default: 0
  end
end

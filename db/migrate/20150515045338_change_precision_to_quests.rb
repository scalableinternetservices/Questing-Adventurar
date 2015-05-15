class ChangePrecisionToQuests < ActiveRecord::Migration
  def change
  	change_column :quests, :price, :decimal, precision: 10, scale: 2
  end
end

class AddUsernameToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :username, :string
    add_index :profiles, :username
  end
end

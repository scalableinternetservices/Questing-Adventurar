class CreateDatabase < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
    	t.belongs_to :user, index: true
    	t.string :first_name
    	t.string :last_name
    	t.string :gender
    	t.decimal :questgiver_rating
    	t.decimal :adventurer_rating
    end

    add_foreign_key :profiles, :users

    create_table :addresses do |t|
    	t.belongs_to :user, index: true
    	t.string :address
    	t.string :country
    	t.string :state
    	t.decimal :zip_code
    end

    add_foreign_key :addresses, :users

    create_table :phone_numbers do |t|
    	t.belongs_to :user, index: true
    	t.decimal :phone_number
    end

    add_foreign_key :phone_numbers, :users

    create_table :quests do |t|
    	t.integer :questgiver_id
    	t.integer :adventurer_id
    	t.string :title
    	t.decimal :price
    	t.string :description
    	t.datetime :post_time
    	t.datetime :expiration_time
    end

    add_foreign_key :quests, :users, column: :questgiver_id
    add_foreign_key :quests, :users, column: :adventurer_id

    create_table :pendings do |t|
    	t.belongs_to :quest
    	t.belongs_to :user
    end

    add_foreign_key :pendings, :quests
    add_foreign_key :pendings, :users
  end
end

class Quest < ActiveRecord::Base
  belongs_to :adventurer, class_name: 'User', foreign_key: 'adventurer_id'
  belongs_to :questgiver, class_name: 'User', foreign_key: 'questgiver_id'
  has_many :pending_adventurers, through: :pendings, class_name: 'User', source: :user
end

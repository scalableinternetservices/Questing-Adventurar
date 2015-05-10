class Review < ActiveRecord::Base
  # validates :rating, :quest, :questgiver, :adventurer, :comment, :post_time, presence: true
  
  belongs_to :quest, class_name: 'Quest', foreign_key: 'quest_id'
  belongs_to :questgiver, class_name: 'User', foreign_key: 'questgiver_id'
  belongs_to :adventurer, class_name: 'User', foreign_key: 'adventurer_id'

end
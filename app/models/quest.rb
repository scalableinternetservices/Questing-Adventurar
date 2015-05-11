class Quest < ActiveRecord::Base
  validates :title, :price, :description,
            :post_time, :expiration_time, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  
  belongs_to :adventurer, class_name: 'User', foreign_key: 'adventurer_id'
  belongs_to :questgiver, class_name: 'User', foreign_key: 'questgiver_id'

  has_many :pendings
  has_many :pending_adventurers, through: :pendings, class_name: 'User',
           source: :user, dependent: :destroy
  has_one :review, class_name: 'Review', foreign_key: :quest_id

  enum status: [:open, :accepted, :complete, :success, :failure]

  acts_as_taggable # Alias for acts_as_taggable_on :tags

end

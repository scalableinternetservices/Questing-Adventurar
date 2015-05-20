class Quest < ActiveRecord::Base
  validates :title, :price, :description,
            :post_time, :expiration_time, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}

  include PublicActivity::Common
  
  belongs_to :adventurer, class_name: 'User', foreign_key: 'adventurer_id'
  belongs_to :questgiver, class_name: 'User', foreign_key: 'questgiver_id'

  has_many :pendings, dependent: :destroy
  has_many :pending_adventurers, through: :pendings, class_name: 'User',
           source: :user
  has_one :review, class_name: 'Review', foreign_key: :quest_id, dependent: :destroy

  enum status: [:open, :accepted, :complete, :success, :failure]

  before_save :default_values
  def default_values
    self.status ||= :open
  end

  acts_as_taggable # Alias for acts_as_taggable_on :tags
end

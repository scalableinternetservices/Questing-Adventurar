class Quest < ActiveRecord::Base
  validates :questgiver, :title, :price, :description,
            :post_time, :expiration_time, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  
  belongs_to :adventurer, class_name: 'User', foreign_key: 'adventurer_id'
  belongs_to :questgiver, class_name: 'User', foreign_key: 'questgiver_id'

  has_many :pendings
  has_many :pending_adventurers, through: :pendings, class_name: 'User',
           source: :user

  enum status: [ :open, :closed, :success, :failure ]

	def self.search(search)
	  if search
	    where('title LIKE ?', "%#{search}%")
	  else
	    all
	  end
	end

end

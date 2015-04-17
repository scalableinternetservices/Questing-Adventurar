class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Supplementary user information.
  has_one  :profile
  has_many :addresses
  has_many :phone_numbers

  # Quest information.
  has_many :quests_posted, class_name: 'Quest', foreign_key: :questgiver_id
  has_many :quests_accepted, class_name: 'Quest', foreign_key: :adventurer_id

  has_many :pendings
  has_many :pending_quests, through: :pendings, class_name: 'Quest', source: :quest

end

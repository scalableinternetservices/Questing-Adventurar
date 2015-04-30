class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Virtual attribute for authenticating by either username or email
  # This is in addition to a real persisted field like 'username'
  attr_accessor :login

  validates :username,
            :presence => true,
            :uniqueness => {
              :case_sensitive => false
            }

  # Supplementary user information.
  has_one  :profile
  has_many :addresses
  has_many :phone_numbers

  # Quest information.
  has_many :quests_posted, class_name: 'Quest', foreign_key: :questgiver_id
  has_many :quests_accepted, class_name: 'Quest', foreign_key: :adventurer_id

  has_many :pendings
  has_many :pending_quests, through: :pendings, class_name: 'Quest', source: :quest

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      if conditions[:username].nil?
        where(conditions).first
      else
        where(username: conditions[:username]).first
      end
    end
  end
end

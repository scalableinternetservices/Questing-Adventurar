class Profile < ActiveRecord::Base
  belongs_to :user
  validates  :username, uniqueness: true
end

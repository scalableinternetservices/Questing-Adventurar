class Pending < ActiveRecord::Base
  belongs_to :quest
  belongs_to :user

  include PublicActivity::Common
end

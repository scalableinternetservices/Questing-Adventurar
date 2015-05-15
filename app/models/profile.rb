class Profile < ActiveRecord::Base
  geocoded_by :address
  after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }
  after_validation :lat_changed?

  belongs_to :user

  private
  def lat_changed?
    if (self.address_changed?)
        if !(self.latitude_changed?)
            self.errors.add(:address, "is not valid")
            return false
        end
    end
    return true
  end
end

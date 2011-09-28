class Location < ActiveRecord::Base
  belongs_to :website
  belongs_to :page
  attr_accessible :address, :latitude, :longitude, :page_id
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?
end

class Photo < ActiveRecord::Base
  belongs_to :website
  belongs_to :gallery
  validates :title, :presence => true
  validates :image, :presence => true
  validates :website_id, :presence => true
  mount_uploader :image, PhotoUploader
end

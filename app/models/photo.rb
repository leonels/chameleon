class Photo < ActiveRecord::Base
  belongs_to :gallery
  validates :title, :presence => true
  validates :image, :presence => true
  mount_uploader :image, PhotoUploader
end

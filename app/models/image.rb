class Image < ActiveRecord::Base
  belongs_to :website
  belongs_to :page
  
  validates :website_id, :presence => true
  validates :src, :presence => true
  # validates :page_id, :presence => true
  
  mount_uploader :src, ImageUploader
end

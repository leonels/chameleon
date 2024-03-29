class Page < ActiveRecord::Base
  belongs_to :website
  has_many :locations, :dependent => :destroy
  has_many :galleries
  has_many :forms, :dependent => :destroy
  has_many :images
  accepts_nested_attributes_for :locations
  
  validates :title, :presence => true
  validates :title, :uniqueness => {:scope => :website_id}
  validates :permalink, :presence => true
  validates :permalink, :uniqueness => {:scope => :website_id}
  validates :website_id, :presence => true
end

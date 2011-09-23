class Gallery < ActiveRecord::Base
  has_many :photos, :dependent => :destroy
  belongs_to :website
  belongs_to :page
  validates :name, :presence => true
  accepts_nested_attributes_for :photos
end

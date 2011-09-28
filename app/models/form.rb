class Form < ActiveRecord::Base
  belongs_to :website
  belongs_to :page
  
  validates :heading, :presence => true
  validates :page_id, :presence => true
end

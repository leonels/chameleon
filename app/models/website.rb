class Website < ActiveRecord::Base

  attr_accessible :name, :subdomain, :layout_name, :logo, :remove_logo
  
  belongs_to :account
  has_many :pages, :dependent => :destroy
  has_many :galleries, :dependent => :destroy
  has_many :messages, :dependent => :destroy
  has_many :forms, :dependent => :destroy
  has_many :images, :dependent => :destroy
  
  accepts_nested_attributes_for :pages
  
  validates :name, :presence => true
  
  mount_uploader :logo, LogoUploader
  
end

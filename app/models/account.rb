class Account < ActiveRecord::Base
  has_many :users, :dependent => :destroy
  has_many :websites, :dependent => :destroy
  accepts_nested_attributes_for :users
  accepts_nested_attributes_for :websites
end

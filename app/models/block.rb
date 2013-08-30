class Block < ActiveRecord::Base
  attr_accessible :name
  has_many :units
  
  validates :name, :presence => true  
end

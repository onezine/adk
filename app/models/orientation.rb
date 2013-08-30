class Orientation < ActiveRecord::Base
  attr_accessible :name
  has_many :units, :dependent => :delete_all
  
  validates :name, :presence => true
end

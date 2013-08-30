class BedroomType < ActiveRecord::Base
  attr_accessible :name
  has_many :unit_types
  
  def to_js
    hash = {}
    unit_types.map{ |ut| hash[ut.id] = ut.name } 
    
     {
       'n' => read_attribute(:name),
       'ut' => hash
     }
  end
end
